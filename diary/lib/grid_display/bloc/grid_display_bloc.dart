import 'package:bloc/bloc.dart';
import 'package:diary/core/constants/constants.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:diary/model/diary_column.dart';
import 'package:diary/model/diary_list.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'grid_display_event.dart';
part 'grid_display_state.dart';
part 'grid_display_bloc.freezed.dart';

class GridDisplayBloc extends Bloc<GridDisplayEvent, GridDisplayState> {
  final DiaryList diaryList;
  final List<DiaryColumn> diaryColumns;
  final List<DiaryCell> diaryCells;
  final ScrollController verticalScrollController;
  final ScrollController horizontalScrollController;
  GridDisplayBloc({
    required this.diaryList,
    required this.diaryColumns,
    required this.diaryCells,
    required this.verticalScrollController,
    required this.horizontalScrollController,
  }) : super(_Initial(
          scaleFactor: 1,
          verticalScrollController: verticalScrollController,
          horizontalScrollController: horizontalScrollController,
        )) {
    on<_GetConstraintsEvent>(
        (event, emit) => _onGetConstraintsEvent(event, emit));
    on<_OnPointerDownEvent>((event, emit) => _onPointerDownEvent(event, emit));
    on<_OnPointerUpEvent>((event, emit) => _onPointerUpEvent(event, emit));
    on<_OnPointerSelectMoveEvent>(
        (event, emit) => _onPointerSelectMoveEvent(event, emit));
    on<_OnPointerScrollMoveEvent>(
        (event, emit) => _onPointerScrollMoveEvent(event, emit));
    on<_OnScaleStartEvent>((event, emit) => _onScaleStartEvent(event, emit));
    on<_OnScaleUpdateEvent>((event, emit) => _onScaleUpdateEvent(event, emit));
    on<_OnScaleEndEvent>((event, emit) => _onScaleEndEvent(event, emit));
    add(GridDisplayEvent.getConstraints(
      diaryList: diaryList,
      diaryColumns: diaryColumns,
      diaryCells: diaryCells,
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
      scaleFactor: 0.5,
      width: width,
      height: height,
      verticalScrollController: verticalScrollController,
      horizontalScrollController: horizontalScrollController,
    ));
  }

  void _onPointerDownEvent(
    _OnPointerDownEvent event,
    Emitter<GridDisplayState> emit,
  ) {
    state.whenOrNull(
      loaded: (scaleFactor, width, height, verticalScrollController,
          horizontalScrollController) {
        if (event.selectedCellKey != null) {
          final cellBox = event.selectedCellKey!.currentContext!
              .findRenderObject() as RenderBox;

          final cellRect = Rect.fromLTWH(
            cellBox.localToGlobal(Offset.zero).dx,
            cellBox.localToGlobal(Offset.zero).dy,
            cellBox.size.width,
            cellBox.size.height,
          );
          // print('dx: ${event.details.position.dx}');
          // print('dy: ${event.details.position.dy}');
          // print('Cell left: ${cellRect.left}');
          // print('Cell top: ${cellRect.top}');
          // print('Cell right: ${cellRect.right}');
          // print('Cell bottom: ${cellRect.bottom}');
          if (event.details.position.dx <= cellRect.right &&
              event.details.position.dx >= cellRect.left &&
              event.details.position.dy <= cellRect.bottom &&
              event.details.position.dy >= cellRect.top) {
            emit(GridDisplayState.selectedMoving(
              scaleFactor: scaleFactor,
              width: width,
              height: height,
              verticalScrollController: verticalScrollController,
              horizontalScrollController: horizontalScrollController,
            ));
          } else {
            emit(GridDisplayState.scrolling(
              scaleFactor: scaleFactor,
              width: width,
              height: height,
              verticalScrollController: verticalScrollController,
              horizontalScrollController: horizontalScrollController,
            ));
          }
        }
      },
    );
  }

  void _onPointerUpEvent(
    _OnPointerUpEvent event,
    Emitter<GridDisplayState> emit,
  ) {
    state.whenOrNull(
      selectedMoving: (scaleFactor, width, height, verticalScrollController,
          horizontalScrollController) {
        emit(
          GridDisplayState.loaded(
            scaleFactor: scaleFactor,
            width: width,
            height: height,
            verticalScrollController: verticalScrollController,
            horizontalScrollController: horizontalScrollController,
          ),
        );
      },
      scrolling: (scaleFactor, width, height, verticalScrollController,
              horizontalScrollController) =>
          emit(
        GridDisplayState.loaded(
          scaleFactor: scaleFactor,
          width: width,
          height: height,
          verticalScrollController: verticalScrollController,
          horizontalScrollController: horizontalScrollController,
        ),
      ),
    );
  }

  void _onPointerSelectMoveEvent(
    _OnPointerSelectMoveEvent event,
    Emitter<GridDisplayState> emit,
  ) {
    state.whenOrNull(
      selectedMoving: (scaleFactor, width, height, verticalScrollController,
          horizontalScrollController) {
        final screenHeight =
            MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                .size
                .height;
        // print('Screen Height: $screenHeight');
        // print('Height in params: $height');
        final screenWidth =
            MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                .size
                .width;
        // print('Screen Width: $screenWidth');
        // print('Width in params: $width');
        double currentHorizontalScrollOffset =
            horizontalScrollController.offset;
        double currentVerticalScrollOffset = verticalScrollController.offset;
        if (event.details.position.dx >= screenWidth * 0.9 &&
            currentHorizontalScrollOffset <
                horizontalScrollController.position.maxScrollExtent) {
          horizontalScrollController.jumpTo(currentHorizontalScrollOffset + 10);
        } else if (event.details.position.dx <= screenWidth * 0.1 &&
            currentHorizontalScrollOffset >
                horizontalScrollController.position.minScrollExtent) {
          horizontalScrollController.jumpTo(currentHorizontalScrollOffset - 10);
        }
        // print(
        //     'Max extent v: ${verticalScrollController.position.maxScrollExtent}');
        if (event.details.position.dy >= screenHeight * 0.9 &&
            currentVerticalScrollOffset <
                verticalScrollController.position.maxScrollExtent) {
          verticalScrollController.jumpTo(currentVerticalScrollOffset + 10);
        } else if (event.details.position.dy <= screenHeight * 0.1 &&
            currentVerticalScrollOffset >
                verticalScrollController.position.minScrollExtent) {
          verticalScrollController.jumpTo(currentVerticalScrollOffset - 10);
        }
      },
    );
  }

  void _onPointerScrollMoveEvent(
    _OnPointerScrollMoveEvent event,
    Emitter<GridDisplayState> emit,
  ) {
    state.whenOrNull(
      scrolling: (scaleFactor, width, height, verticalScrollController,
          horizontalScrollController) {
        double currentHorizontalScrollOffset =
            horizontalScrollController.offset;
        double currentVerticalScrollOffset = verticalScrollController.offset;
        if (event.details.delta.dx > 0 &&
            currentHorizontalScrollOffset >
                horizontalScrollController.position.minScrollExtent) {
          horizontalScrollController
              .jumpTo(currentHorizontalScrollOffset - event.details.delta.dx);
        } else if (event.details.delta.dx < 0 &&
            currentHorizontalScrollOffset <
                horizontalScrollController.position.maxScrollExtent) {
          horizontalScrollController
              .jumpTo(currentHorizontalScrollOffset - event.details.delta.dx);
        }
        if (event.details.delta.dy > 0 &&
            currentVerticalScrollOffset >
                verticalScrollController.position.minScrollExtent) {
          verticalScrollController
              .jumpTo(currentVerticalScrollOffset - event.details.delta.dy);
        } else if (event.details.delta.dy < 0 &&
            currentVerticalScrollOffset <
                verticalScrollController.position.maxScrollExtent) {
          verticalScrollController
              .jumpTo(currentVerticalScrollOffset - event.details.delta.dy);
        }
      },
    );
  }

  void _onScaleStartEvent(
    _OnScaleStartEvent event,
    Emitter<GridDisplayState> emit,
  ) {
    state.whenOrNull(
      loaded: (scaleFactor, width, height, verticalScrollController,
          horizontalScrollController) {
        print('Zoom start');
        emit(
          GridDisplayState.scaling(
            scaleFactor: scaleFactor,
            width: width,
            height: height,
            verticalScrollController: verticalScrollController,
            horizontalScrollController: horizontalScrollController,
          ),
        );
      },
      // scrolling: (scaleFactor, width, height, verticalScrollController,
      //     horizontalScrollController) {
      //   print('Zoom start');
      //   emit(
      //     GridDisplayState.scaling(
      //       scaleFactor: scaleFactor,
      //       width: width,
      //       height: height,
      //       verticalScrollController: verticalScrollController,
      //       horizontalScrollController: horizontalScrollController,
      //     ),
      //   );
      // },
    );
  }

  void _onScaleUpdateEvent(
    _OnScaleUpdateEvent event,
    Emitter<GridDisplayState> emit,
  ) {
    state.whenOrNull(
      scaling: (scaleFactor, width, height, verticalScrollController,
          horizontalScrollController) {
        print('Details scale: ${event.details.scale}');
        double factor = scaleFactor * event.details.scale;
        print('factor: $factor');
        // if (event.details.scale < 1) {
        //   scaleFactor *= event.details.scale;
        // }
      },
    );
  }

  void _onScaleEndEvent(
    _OnScaleEndEvent event,
    Emitter<GridDisplayState> emit,
  ) {
    state.whenOrNull(
      scaling: (scaleFactor, width, height, verticalScrollController,
          horizontalScrollController) {
        print('Zoom end');
        
        emit(
          GridDisplayState.loaded(
            scaleFactor: scaleFactor,
            width: width,
            height: height,
            verticalScrollController: verticalScrollController,
            horizontalScrollController: horizontalScrollController,
          ),
        );
      },
    );
  }
}
