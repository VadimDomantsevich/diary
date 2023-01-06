import 'package:bloc/bloc.dart';
import 'package:diary/core/constants/constants.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:diary/model/diary_column.dart';
import 'package:diary/model/diary_list.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vector_math/vector_math_64.dart';

part 'grid_display_event.dart';
part 'grid_display_state.dart';
part 'grid_display_bloc.freezed.dart';

class GridDisplayBloc extends Bloc<GridDisplayEvent, GridDisplayState> {
  final DiaryList diaryList;
  final List<DiaryColumn> diaryColumns;
  final List<DiaryCell> diaryCells;
  final TransformationController transformationController;
  GridDisplayBloc({
    required this.diaryList,
    required this.diaryColumns,
    required this.diaryCells,
    required this.transformationController,
  }) : super(_Initial(
          scaleFactor: 1,
          transformationController: transformationController,
          translateX: 0,
          translateY: 0,
        )) {
    on<_GetConstraintsEvent>(
        (event, emit) => _onGetConstraintsEvent(event, emit));
    on<_OnPointerDownEvent>((event, emit) => _onPointerDownEvent(event, emit));
    on<_OnPointerUpEvent>((event, emit) => _onPointerUpEvent(event, emit));
    on<_OnPointerSelectMoveEvent>(
        (event, emit) => _onPointerSelectMoveEvent(event, emit));
    on<_OnInteractionEndEvent>(
        (event, emit) => _onInteractionEndEvent(event, emit));
    add(GridDisplayEvent.getConstraints(
      scaleFactor: 1,
      diaryList: diaryList,
      diaryColumns: diaryColumns,
      diaryCells: diaryCells,
      isScaled: false,
    ));
  }

  Future<void> _onGetConstraintsEvent(
    _GetConstraintsEvent event,
    Emitter<GridDisplayState> emit,
  ) async {
    double width = 0;
    double height = 0;
    for (var column in event.diaryColumns) {
      width += column.settings.width *
          column.columnsCount; //Надо будет переделать под каждую колонку
    }

    List<DiaryCell> cells = List<DiaryCell>.empty(growable: true);
    for (var cell in event.diaryCells) {
      if (cell.columnName == Constants.diaryColumnDateField &&
          cell.columnPosition == 1) {
        cells.add(cell);
      }
    }
    cells.sort(
      ((a, b) {
        int pos = a.columnPosition.compareTo(b.columnPosition);
        if (pos == 0) {
          return a.day.compareTo(b.day);
        }
        return pos;
      }),
    );
    for (var cell in cells) {
      height += cell.settings.height;
    }

    height = height +
        WidgetsBinding.instance.window.padding.top +
        WidgetsBinding.instance.window.padding.bottom;

    emit(_Loaded(
      scaleFactor: 1,
      width: width,
      height: height,
      transformationController: transformationController,
      translateX: 0,
      translateY: 0,
    ));
  }

  void _onPointerDownEvent(
    _OnPointerDownEvent event,
    Emitter<GridDisplayState> emit,
  ) {
    state.whenOrNull(
      loaded: (scaleFactor, width, height, transformationController, translateX,
          translateY) {
        final cellBox = event.selectedCellKey.currentContext!.findRenderObject()
            as RenderBox;
        final cellRect = Rect.fromLTWH(
          cellBox.localToGlobal(Offset.zero).dx,
          cellBox.localToGlobal(Offset.zero).dy,
          cellBox.size.width * scaleFactor,
          cellBox.size.height * scaleFactor,
        );
        if (event.details.position.dx <= cellRect.right &&
            event.details.position.dx >= cellRect.left &&
            event.details.position.dy <= cellRect.bottom &&
            event.details.position.dy >= cellRect.top) {
          emit(GridDisplayState.selectedMoving(
            scaleFactor: scaleFactor,
            width: width,
            height: height,
            transformationController: transformationController,
            translateX: translateX,
            translateY: translateY,
          ));
        }
      },
    );
  }

  void _onPointerUpEvent(
    _OnPointerUpEvent event,
    Emitter<GridDisplayState> emit,
  ) {
    state.whenOrNull(
      selectedMoving: (scaleFactor, width, height, transformationController,
          translateX, translateY) {
        emit(
          GridDisplayState.loaded(
            scaleFactor: scaleFactor,
            width: width,
            height: height,
            transformationController: transformationController,
            translateX: translateX,
            translateY: translateY,
          ),
        );
      },
    );
  }

  void _onPointerSelectMoveEvent(
    _OnPointerSelectMoveEvent event,
    Emitter<GridDisplayState> emit,
  ) {
    state.whenOrNull(
      selectedMoving: (scaleFactor, width, height, transformationController,
          translateX, translateY) {
        final screenHeight =
            MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                .size
                .height;
        final screenWidth =
            MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                .size
                .width;
        final scaledWidth = screenWidth + width * scaleFactor * -1;
        final scaledHeight = screenHeight -
            WidgetsBinding.instance.window.padding.bottom +
            height * scaleFactor * -1;
        double currentTranslationX =
            transformationController.value.getTranslation().x;
        double currentTranslationY =
            transformationController.value.getTranslation().y;
        if (event.details.position.dx >= screenWidth * 0.9 &&
            currentTranslationX > scaledWidth) {
          currentTranslationX -= 10;
          transformationController.value.setTranslation(
              Vector3(currentTranslationX, currentTranslationY, 0));
        } else if (event.details.position.dx <= screenWidth * 0.1 &&
            currentTranslationX < 0) {
          currentTranslationX += 10;
          transformationController.value.setTranslation(
              Vector3(currentTranslationX, currentTranslationY, 0));
        }
        if (event.details.position.dy >= screenHeight * 0.9 &&
            currentTranslationY > scaledHeight) {
          currentTranslationY -= 10;
          transformationController.value.setTranslation(
              Vector3(currentTranslationX, currentTranslationY, 0));
        } else if (event.details.position.dy <= screenHeight * 0.1 &&
            currentTranslationY < 0) {
          currentTranslationY += 10;
          transformationController.value.setTranslation(
              Vector3(currentTranslationX, currentTranslationY, 0));
        }
        emit(_SelectedMoving(
          scaleFactor: scaleFactor,
          width: width,
          height: height,
          transformationController: transformationController,
          translateX: currentTranslationX,
          translateY: currentTranslationY,
        ));
      },
    );
  }

  void _onInteractionEndEvent(
    _OnInteractionEndEvent event,
    Emitter<GridDisplayState> emit,
  ) {
    state.whenOrNull(
      loaded: (scaleFactor, width, height, transformationController, translateX,
          translateY) {
        emit(_Loaded(
          scaleFactor: transformationController.value.getMaxScaleOnAxis(),
          width: width,
          height: height,
          transformationController: transformationController,
          translateX: translateX,
          translateY: translateY,
        ));
      },
    );
  }
}