import 'package:bloc/bloc.dart';
import 'package:diary/core/constants/constants.dart';
import 'package:diary/core/constants/enums.dart';
import 'package:diary/core/extentions.dart';
import 'package:diary/diary_list_screen/diary_cell_content_widget.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:diary/model/diary_cell_settings.dart';
import 'package:diary/model/diary_cell_text_settings.dart';
import 'package:diary/model/diary_column.dart';
import 'package:diary/model/diary_list.dart';
import 'package:diary/services/diary_cell_service.dart';
import 'package:diary/services/diary_column_service.dart';
import 'package:diary/services/diary_list_service.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_list_state.dart';
part 'diary_list_event.dart';
part 'diary_list_bloc.freezed.dart';

class DiaryListBloc extends Bloc<DiaryListEvent, DiaryListState> {
  final DiaryListService _diaryListService;
  final DiaryColumnService _diaryColumnService;
  final DiaryCellService _diaryCellService;
  DiaryListBloc(
    this._diaryListService,
    this._diaryColumnService,
    this._diaryCellService,
  ) : super(const DiaryListState.initial()) {
    on<CreateSampleEvent>((event, emit) => _onCreateSampleEvent(event, emit));
    on<GetDiaryListEvent>((event, emit) => _onGetDiaryListEvent(event, emit));
    on<GetDiaryColumnsEvent>(
        (event, emit) => _onGetDiaryColumnsEvent(event, emit));
    on<GetDiaryCellsEvent>((event, emit) => _onGetDiaryCellsEvent(event, emit));
    on<SelectDiaryCellEvent>(
        ((event, emit) => _onSelectDiaryCellEvent(event, emit)));
    on<SelectDiaryCellsEvent>(
        ((event, emit) => _onSelectDiaryCellsEvent(event, emit)));
    on<StartEditingListEvent>(
        ((event, emit) => _onStartEditingListEvent(event, emit)));
    on<ReturnToLoadedEvent>(
        ((event, emit) => _onReturnToLoadedEvent(event, emit)));
    on<ReturnToCellsSelectedEvent>(
        ((event, emit) => _onReturnToCellsSelectedEvent(event, emit)));
    on<UpdateDiaryListNameEvent>(
        ((event, emit) => _onUpdateDiaryListNameEvent(event, emit)));
    on<ChangeDiaryCellEvent>(
        ((event, emit) => _onChangeDiaryCellEvent(event, emit)));
    on<UpdateDiaryCellInFirebaseEvent>(
        ((event, emit) => _onUpdateDiaryCellInFirebaseEvent(event, emit)));
    on<OnPanUpdateEvent>(((event, emit) => _onPanUpdateEvent(event, emit)));
    on<StartEditingCellsEvent>(
        ((event, emit) => _onStartEditingCellsEvent(event, emit)));
    on<ChangeDiaryCellsSettingsEvent>(
        ((event, emit) => _onChangeDiaryCellsSettingsEvent(event, emit)));
    on<ChangeDiaryCellsBordersSettingsEvent>(((event, emit) =>
        _onChangeDiaryCellsBordersSettingsEvent(event, emit)));
    on<UpdateDiaryCellsSettingsInFirebaseEvent>(((event, emit) =>
        _onUpdateDiaryCellsSettingsInFirebaseEvent(event, emit)));
    on<StartEditingColorEvent>(
        ((event, emit) => _onStartEditingColorEvent(event, emit)));
    on<StartEditingBordersEvent>(
        ((event, emit) => _onStartEditingBordersEvent(event, emit)));
    on<StartEditingBordersStyleEvent>(
        ((event, emit) => _onStartEditingBordersStyleEvent(event, emit)));
    on<TurnBackEditingEvent>(
        ((event, emit) => _onTurnBackEditingEvent(event, emit)));
  }

  Future<void> _onCreateSampleEvent(
    CreateSampleEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    _diaryListService.create(date: DateTime.now());
    final diaryList = await _diaryListService.getByDate(date: DateTime.now());
    _diaryColumnService.createDateColumn(diaryList: diaryList);
    final dateColumn =
        await _diaryColumnService.getDateColumn(diaryList: diaryList);
    _diaryCellService.createDateCells(
      diaryList: diaryList,
      diaryColumn: dateColumn,
    );
    //create other columns
    add(DiaryListEvent.getDiaryList(date: DateTime.now()));
  }

  Future<void> _onGetDiaryListEvent(
    GetDiaryListEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    final lists = await _diaryListService.getAll();
    final diaryList = await _diaryListService.getByDate(date: event.date);
    emit(
      DiaryListState.listLoaded(
        diaryList: diaryList,
        lists: lists,
      ),
    );
    add(
      DiaryListEvent.getDiaryColumns(
        diaryList: diaryList,
        lists: lists,
      ),
    );
  }

  Future<void> _onGetDiaryColumnsEvent(
    GetDiaryColumnsEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    final diaryColumns =
        await _diaryColumnService.getAll(diaryList: event.diaryList);
    emit(
      DiaryListState.columnsLoaded(
        diaryList: event.diaryList,
        diaryColumns: diaryColumns,
        lists: event.lists,
      ),
    );
    add(
      DiaryListEvent.getDiaryCells(
        diaryList: event.diaryList,
        diaryColumns: diaryColumns,
        lists: event.lists,
      ),
    );
  }

  Future<void> _onGetDiaryCellsEvent(
    GetDiaryCellsEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    List<DiaryCell> diaryCells = List<DiaryCell>.empty(growable: true);

    for (var column in event.diaryColumns) {
      final newCells = await _diaryCellService.getAll(
        diaryList: event.diaryList,
        diaryColumn: column,
      );
      diaryCells.addAll(newCells);
    }
    //List of global cells keys
    List<GlobalObjectKey> cellsKeys =
        List<GlobalObjectKey>.empty(growable: true);
    for (var cell in diaryCells) {
      cellsKeys.add(GlobalObjectKey(cell));
    }
    emit(
      DiaryListState.loaded(
        diaryList: event.diaryList,
        diaryColumns: event.diaryColumns,
        diaryCells: diaryCells,
        cellsKeys: cellsKeys,
        lists: event.lists,
      ),
    );
  }

  Future<void> _onSelectDiaryCellEvent(
    SelectDiaryCellEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.whenOrNull(
      loaded: (diaryList, diaryColumns, diaryCells, cellsKeys, lists) async {
        List<DiaryCell> selectedCells = [event.diaryCell];
        // final diaryColumn = diaryColumns
        //     .firstWhere((element) => element.id == event.diaryCell.columnName);
        // var defaultTextSettings =
        //     await _diaryCellService.getDefaultCellTextSettings(
        //   diaryList: diaryList,
        //   diaryColumn: diaryColumn,
        // );

        emit(
          DiaryListState.cellsSelected(
            diaryList: diaryList,
            diaryColumns: diaryColumns,
            diaryCells: diaryCells,
            firstSelectedCell: event.diaryCell,
            selectedCells: selectedCells,
            cellsKeys: cellsKeys,
            lists: lists,
            defaultTextSettings: event.diaryCell.textSettings,
            defaultSettings: event.diaryCell.settings,
          ),
        );
      },
      cellsSelected: (
        diaryList,
        diaryColumns,
        diaryCells,
        firstSelectedCell,
        selectedCells,
        cellsKeys,
        lists,
        defaultTextSettings,
        defaultSettings,
      ) {
        List<DiaryCell> selectedCells = [event.diaryCell];
        emit(
          DiaryListState.cellsSelected(
            diaryList: diaryList,
            diaryColumns: diaryColumns,
            diaryCells: diaryCells,
            firstSelectedCell: event.diaryCell,
            selectedCells: selectedCells,
            cellsKeys: cellsKeys,
            lists: lists,
            defaultTextSettings: defaultTextSettings,
            defaultSettings: defaultSettings,
          ),
        );
      },
    );
  }

  Future<void> _onSelectDiaryCellsEvent(
    SelectDiaryCellsEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.whenOrNull(
      cellsSelected: (
        diaryList,
        diaryColumns,
        diaryCells,
        firstSelectedCell,
        selectedCells,
        cellsKeys,
        lists,
        defaultTextSettings,
        defaultSettings,
      ) {
        emit(
          DiaryListState.cellsSelected(
            diaryList: diaryList,
            diaryColumns: diaryColumns,
            diaryCells: diaryCells,
            firstSelectedCell: firstSelectedCell,
            selectedCells: event.diaryCells,
            cellsKeys: cellsKeys,
            lists: lists,
            defaultTextSettings: defaultTextSettings,
            defaultSettings: defaultSettings,
          ),
        );
      },
    );
  }

  Future<void> _onStartEditingListEvent(
    StartEditingListEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.whenOrNull(
      loaded: (diaryList, diaryColumns, diaryCells, cellsKeys, lists) {
        emit(
          DiaryListState.listEditing(
            diaryList: diaryList,
            diaryColumns: diaryColumns,
            diaryCells: diaryCells,
            cellsKeys: cellsKeys,
            lists: lists,
            selectedList: event.selectedList,
          ),
        );
      },
    );
  }

  Future<void> _onReturnToLoadedEvent(
    ReturnToLoadedEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.whenOrNull(
      listEditing: (diaryList, diaryColumns, diaryCells, cellsKeys, lists,
          selectedList) {
        if (event.newName != null && event.newName!.isNotEmpty) {
          final changedDiaryList = diaryList.copyWith(name: event.newName);
          List<DiaryList> updatedLists = List<DiaryList>.empty(growable: true);
          for (var list in lists) {
            if (list.listDate == diaryList.listDate) {
              updatedLists.add(changedDiaryList);
            } else {
              updatedLists.add(list);
            }
          }
          emit(
            DiaryListState.loaded(
              diaryList: changedDiaryList,
              diaryColumns: diaryColumns,
              diaryCells: diaryCells,
              cellsKeys: cellsKeys,
              lists: updatedLists,
            ),
          );
        } else {
          emit(
            DiaryListState.loaded(
              diaryList: diaryList,
              diaryColumns: diaryColumns,
              diaryCells: diaryCells,
              cellsKeys: cellsKeys,
              lists: lists,
            ),
          );
        }
      },
      cellsSelected: (
        diaryList,
        diaryColumns,
        diaryCells,
        firstSelectedCell,
        selectedCells,
        cellsKeys,
        lists,
        defaultTextSettings,
        defaultSettings,
      ) {
        emit(
          DiaryListState.loaded(
            diaryList: diaryList,
            diaryColumns: diaryColumns,
            diaryCells: diaryCells,
            cellsKeys: cellsKeys,
            lists: lists,
          ),
        );
      },
      cellsEditing: (
        diaryList,
        diaryColumns,
        diaryCells,
        cellsKeys,
        firstSelectedCell,
        selectedCells,
        isTextEditing,
        isColorEditing,
        isBordersEditing,
        isBordersStyleEditing,
        lists,
        defaultTextSettings,
        defaultSettings,
      ) {
        emit(
          DiaryListState.loaded(
            diaryList: diaryList,
            diaryColumns: diaryColumns,
            diaryCells: diaryCells,
            cellsKeys: cellsKeys,
            lists: lists,
          ),
        );
      },
    );
  }

  Future<void> _onReturnToCellsSelectedEvent(
    ReturnToCellsSelectedEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.whenOrNull(
      cellsEditing: (
        diaryList,
        diaryColumns,
        diaryCells,
        cellsKeys,
        firstSelectedCell,
        selectedCells,
        isTextEditing,
        isColorEditing,
        isBordersEditing,
        isBordersStyleEditing,
        lists,
        defaultTextSettings,
        defaultSettings,
      ) {
        //Возможно надо будет обновлять ячейки
        //Даже не возможно, а точно
        emit(
          DiaryListState.cellsSelected(
            diaryList: diaryList,
            diaryColumns: diaryColumns,
            diaryCells: diaryCells,
            firstSelectedCell: firstSelectedCell,
            selectedCells: selectedCells,
            cellsKeys: cellsKeys,
            lists: lists,
            defaultTextSettings: defaultTextSettings,
            defaultSettings: defaultSettings,
          ),
        );
      },
    );
  }

  Future<void> _onUpdateDiaryListNameEvent(
    UpdateDiaryListNameEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.whenOrNull(
      initial: () {
        if (event.newName.isNotEmpty) {
          _diaryListService.update(
              diaryList: event.diaryList, newName: event.newName);
        }
      },
    );
  }

  Future<void> _onPanUpdateEvent(
    OnPanUpdateEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.whenOrNull(
      cellsSelected: (
        diaryList,
        diaryColumns,
        diaryCells,
        firstSelectedCell,
        selectedCells,
        cellsKeys,
        lists,
        defaultTextSettings,
        defaultSettings,
      ) {
        final cellBox =
            event.cellKey.currentContext!.findRenderObject() as RenderBox;

        int columnsCount = 0;
        for (var column in diaryColumns) {
          columnsCount += column.columnsCount;
        }
        double cellTopOffset = cellBox.localToGlobal(Offset.zero).dy;
        // print('PanUpdate');
        // print('ScaleFactor: ${event.scaleFactor}');

        //print('gridPosition: ${position.dy}');
        final cellRect = Rect.fromLTWH(
          cellBox.localToGlobal(Offset.zero).dx,
          cellTopOffset,
          cellBox.size.width * event.scaleFactor,
          cellBox.size.height * event.scaleFactor,
        );
        // final cellLeft = cellBox.localToGlobal(Offset.zero).dx;
        // final cellTop = cellBox.localToGlobal(Offset.zero).dy;
        // final cellRight = cellLeft + cellBox.size.width;
        // final cellBottom = cellTop + cellBox.size.height;

        //I need to know all the corners of the rect

        double leftPosition = cellRect.left;
        double rightPosition = cellRect.right;
        double topPosition = cellRect.top;
        double bottomPosition = cellRect.bottom;
        // print('Start');
        // print('cellTop: ${cellRect.top}');
        // print('cellBottom: ${cellRect.bottom}');
        // print('cellLeft: ${cellRect.left}');
        // print('cellRight: ${cellRect.right}');
        event.details.globalPosition.dy < cellRect.top
            ? topPosition = event.details.globalPosition.dy
            : topPosition = cellRect.top;
        // print('topPosition: ${topPosition}');
        event.details.globalPosition.dy > cellRect.bottom
            ? bottomPosition = event.details.globalPosition.dy
            : bottomPosition = cellRect.bottom;
        // print('bottomPosition: ${bottomPosition}');
        event.details.globalPosition.dx < cellRect.left
            ? leftPosition = event.details.globalPosition.dx
            : leftPosition = cellRect.left;
        // print('leftPosition: ${leftPosition}');
        event.details.globalPosition.dx > cellRect.right
            ? rightPosition = event.details.globalPosition.dx
            : rightPosition = cellRect.right;
        // print('rightPosition: ${rightPosition}');
        // print('End');
        //The corners of the selected rect

        //To fix bug with selecting
        topPosition += 2;
        bottomPosition -= 2;

        int verticalStep = columnsCount - 1;
        //print('Step: $verticalStep');
        List<int> touchedCellsIndexes = List<int>.empty(growable: true);

        //up direction
        bool isTouch = true;
        int index = diaryCells.indexOf(firstSelectedCell);
        int checksCount = 0;
        touchedCellsIndexes.add(index);
        index >= 0 ? index-- : isTouch = false;
        do {
          if (index >= 0 &&
              _diaryCellService.isRectTouchTheCell(
                leftPosition: leftPosition,
                rightPosition: rightPosition,
                topPosition: topPosition,
                bottomPosition: bottomPosition,
                cellKey: cellsKeys[index],
                scaleFactor: event.scaleFactor,
              )) {
            if (!touchedCellsIndexes.contains(index)) {
              touchedCellsIndexes.add(index);
            }
            index--;
            checksCount++;
          } else if (index - verticalStep >= 0 &&
              _diaryCellService.isRectTouchTheCell(
                leftPosition: leftPosition,
                rightPosition: rightPosition,
                topPosition: topPosition,
                bottomPosition: bottomPosition,
                cellKey: cellsKeys[index - verticalStep],
                scaleFactor: event.scaleFactor,
              )) {
            index -= verticalStep;
            checksCount++;
          } else {
            isTouch = false;
            checksCount++;
          }
        } while (isTouch == true);
        //down direction
        isTouch = true;
        index = diaryCells.indexOf(firstSelectedCell);
        index < cellsKeys.length - 1 ? index++ : isTouch = false;
        do {
          if (index < cellsKeys.length &&
              _diaryCellService.isRectTouchTheCell(
                leftPosition: leftPosition,
                rightPosition: rightPosition,
                topPosition: topPosition,
                bottomPosition: bottomPosition,
                cellKey: cellsKeys[index],
                scaleFactor: event.scaleFactor,
              )) {
            if (!touchedCellsIndexes.contains(index)) {
              touchedCellsIndexes.add(index);
            }
            index++;
            checksCount++;
          } else if (index + verticalStep < cellsKeys.length &&
              _diaryCellService.isRectTouchTheCell(
                leftPosition: leftPosition,
                rightPosition: rightPosition,
                topPosition: topPosition,
                bottomPosition: bottomPosition,
                cellKey: cellsKeys[index + verticalStep],
                scaleFactor: event.scaleFactor,
              )) {
            index += verticalStep;
          } else {
            isTouch = false;
            checksCount++;
          }
        } while (isTouch == true);
        // print('ChecksCount: $checksCount');
        // print(touchedCellsIndexes.length);
        // for (var i in touchedCellsIndexes) {
        //   print('Touched Index: $i');
        // }
        //Event selectCells
        List<DiaryCell> selectedCells = List<DiaryCell>.empty(
          growable: true,
        );
        for (var index in touchedCellsIndexes) {
          selectedCells.add(diaryCells[index]);
        }
        add(DiaryListEvent.selectDiaryCells(diaryCells: selectedCells));
      },
    );
  }

  Future<void> _onChangeDiaryCellEvent(
    ChangeDiaryCellEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.whenOrNull(
      cellsSelected: (
        diaryList,
        diaryColumns,
        diaryCells,
        firstSelectedCell,
        selectedCells,
        cellsKeys,
        lists,
        defaultTextSettings,
        defaultSettings,
      ) async {
        if (event.textFieldText != firstSelectedCell.content.toString()) {
          final index = diaryCells.indexOf(firstSelectedCell);
          final changedCell =
              event.diaryCell.copyWith(content: event.textFieldText);
          List<DiaryCell> newCells = diaryCells.toList();
          newCells[index] = changedCell;
          List<DiaryCell> newSelectedCells =
              List<DiaryCell>.empty(growable: true);
          for (var cell in selectedCells) {
            newSelectedCells.add(newCells[diaryCells.indexOf(cell)]);
          }
          emit(
            DiaryListState.cellsSelected(
              diaryList: diaryList,
              diaryColumns: diaryColumns,
              diaryCells: newCells,
              firstSelectedCell: changedCell,
              selectedCells: newSelectedCells,
              cellsKeys: cellsKeys,
              lists: lists,
              defaultTextSettings: defaultTextSettings,
              defaultSettings: defaultSettings,
            ),
          );
          add(
            UpdateDiaryCellInFirebaseEvent(
              diaryCell: firstSelectedCell,
              textFieldText: event.textFieldText,
            ),
          );
        }
      },
    );
  }

  Future<void> _onUpdateDiaryCellInFirebaseEvent(
    UpdateDiaryCellInFirebaseEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.whenOrNull(
      cellsSelected: (
        diaryList,
        diaryColumns,
        diaryCells,
        firstSelectedCell,
        selectedCells,
        cellsKeys,
        lists,
        defaultTextSettings,
        defaultSettings,
      ) async {
        //Update cell in Firebase after 10 sec delay if there is no more changes
        Future.delayed(
          const Duration(seconds: 10),
          () async {
            final index = diaryCells.indexOf(firstSelectedCell);
            final cellKey = cellsKeys[index];
            final cellWidget = cellKey.currentWidget as Container;
            final textWidget = cellWidget.child as DiaryCellContentWidget;
            final currentText = textWidget.content;
            if (currentText == event.textFieldText) {
              await _diaryCellService.update(
                diaryList: diaryList,
                diaryCell: firstSelectedCell,
                content: event.textFieldText,
              );
            }
          },
        );
      },
    );
  }

  Future<void> _onStartEditingCellsEvent(
    StartEditingCellsEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.whenOrNull(
      cellsSelected: (
        diaryList,
        diaryColumns,
        diaryCells,
        firstSelectedCell,
        selectedCells,
        cellsKeys,
        lists,
        defaultTextSettings,
        defaultSettings,
      ) async {
        final isTextEditing = event.isTextEditing;
        emit(
          DiaryListState.cellsEditing(
            diaryList: diaryList,
            diaryColumns: diaryColumns,
            diaryCells: diaryCells,
            cellsKeys: cellsKeys,
            firstSelectedCell: firstSelectedCell,
            selectedCells: selectedCells,
            isTextEditing: isTextEditing,
            isColorEditing: false,
            isBordersEditing: false,
            isBordersStyleEditing: false,
            lists: lists,
            defaultTextSettings: defaultTextSettings,
            defaultSettings: defaultSettings,
          ),
        );
      },
      cellsEditing: (
        diaryList,
        diaryColumns,
        diaryCells,
        cellsKeys,
        firstSelectedCell,
        selectedCells,
        isTextEditing,
        isColorEditing,
        isBordersEditing,
        isBordersStyleEditing,
        lists,
        defaultTextSettings,
        defaultSettings,
      ) {
        final isTextEditing = event.isTextEditing;
        emit(
          DiaryListState.cellsEditing(
            diaryList: diaryList,
            diaryColumns: diaryColumns,
            diaryCells: diaryCells,
            cellsKeys: cellsKeys,
            firstSelectedCell: firstSelectedCell,
            selectedCells: selectedCells,
            isTextEditing: isTextEditing,
            isColorEditing: false,
            isBordersEditing: false,
            isBordersStyleEditing: false,
            lists: lists,
            defaultTextSettings: defaultTextSettings,
            defaultSettings: defaultSettings,
          ),
        );
      },
    );
  }

  Future<void> _onStartEditingColorEvent(
    StartEditingColorEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.whenOrNull(
      cellsEditing: (
        diaryList,
        diaryColumns,
        diaryCells,
        cellsKeys,
        firstSelectedCell,
        selectedCells,
        isTextEditing,
        isColorEditing,
        isBordersEditing,
        isBordersStyleEditing,
        lists,
        defaultTextSettings,
        defaultSettings,
      ) {
        emit(
          DiaryListState.cellsEditing(
            diaryList: diaryList,
            diaryColumns: diaryColumns,
            diaryCells: diaryCells,
            cellsKeys: cellsKeys,
            firstSelectedCell: firstSelectedCell,
            selectedCells: selectedCells,
            isTextEditing: isTextEditing,
            isColorEditing: true,
            isBordersEditing: isBordersEditing,
            isBordersStyleEditing: false,
            lists: lists,
            defaultTextSettings: defaultTextSettings,
            defaultSettings: defaultSettings,
          ),
        );
      },
    );
  }

  Future<void> _onStartEditingBordersEvent(
    StartEditingBordersEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.whenOrNull(
      cellsEditing: (
        diaryList,
        diaryColumns,
        diaryCells,
        cellsKeys,
        firstSelectedCell,
        selectedCells,
        isTextEditing,
        isColorEditing,
        isBordersEditing,
        isBordersStyleEditing,
        lists,
        defaultTextSettings,
        defaultSettings,
      ) {
        emit(
          DiaryListState.cellsEditing(
            diaryList: diaryList,
            diaryColumns: diaryColumns,
            diaryCells: diaryCells,
            cellsKeys: cellsKeys,
            firstSelectedCell: firstSelectedCell,
            selectedCells: selectedCells,
            isTextEditing: isTextEditing,
            isColorEditing: false,
            isBordersEditing: true,
            isBordersStyleEditing: false,
            lists: lists,
            defaultTextSettings: defaultTextSettings,
            defaultSettings: defaultSettings,
          ),
        );
      },
    );
  }

  Future<void> _onStartEditingBordersStyleEvent(
    StartEditingBordersStyleEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.whenOrNull(
      cellsEditing: (
        diaryList,
        diaryColumns,
        diaryCells,
        cellsKeys,
        firstSelectedCell,
        selectedCells,
        isTextEditing,
        isColorEditing,
        isBordersEditing,
        isBordersStyleEditing,
        lists,
        defaultTextSettings,
        defaultSettings,
      ) {
        emit(
          DiaryListState.cellsEditing(
            diaryList: diaryList,
            diaryColumns: diaryColumns,
            diaryCells: diaryCells,
            cellsKeys: cellsKeys,
            firstSelectedCell: firstSelectedCell,
            selectedCells: selectedCells,
            isTextEditing: isTextEditing,
            isColorEditing: false,
            isBordersEditing: true,
            isBordersStyleEditing: true,
            lists: lists,
            defaultTextSettings: defaultTextSettings,
            defaultSettings: defaultSettings,
          ),
        );
      },
    );
  }

  Future<void> _onTurnBackEditingEvent(
    TurnBackEditingEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.whenOrNull(
      cellsEditing: (
        diaryList,
        diaryColumns,
        diaryCells,
        cellsKeys,
        firstSelectedCell,
        selectedCells,
        isTextEditing,
        isColorEditing,
        isBordersEditing,
        isBordersStyleEditing,
        lists,
        defaultTextSettings,
        defaultSettings,
      ) {
        emit(
          DiaryListState.cellsEditing(
            diaryList: diaryList,
            diaryColumns: diaryColumns,
            diaryCells: diaryCells,
            cellsKeys: cellsKeys,
            firstSelectedCell: firstSelectedCell,
            selectedCells: selectedCells,
            isTextEditing: isTextEditing,
            isColorEditing: false,
            isBordersEditing:
                isColorEditing && isBordersEditing || isBordersStyleEditing
                    ? true
                    : false,
            isBordersStyleEditing: false,
            lists: lists,
            defaultTextSettings: defaultTextSettings,
            defaultSettings: defaultSettings,
          ),
        );
      },
    );
  }

  Future<void> _onChangeDiaryCellsSettingsEvent(
    ChangeDiaryCellsSettingsEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.whenOrNull(
      cellsEditing: (
        diaryList,
        diaryColumns,
        diaryCells,
        cellsKeys,
        firstSelectedCell,
        selectedCells,
        isTextEditing,
        isColorEditing,
        isBordersEditing,
        isBordersStyleEditing,
        lists,
        defaultTextSettings,
        defaultSettings,
      ) {
        var newDiaryCells = List<DiaryCell>.empty(growable: true);
        newDiaryCells.addAll(diaryCells);
        var newSelectedCells = List<DiaryCell>.empty(growable: true);
        for (var cell in selectedCells) {
          final index = diaryCells.indexOf(cell);
          var newFontSize = event.fontSize ?? cell.textSettings.fontSize;
          newFontSize < Constants.minFontSize
              ? newFontSize = Constants.minFontSize
              : newFontSize;
          newFontSize > Constants.maxFontSize
              ? newFontSize = Constants.maxFontSize
              : newFontSize;
          final newTextSettings = DiaryCellTextSettings(
            alignment: _diaryCellService.convertAlignments(
              horizontal: event.horizontalAlignment ??
                  cell.textSettings.alignment.toHorizontalAlignmentsEnum(),
              vertical: event.verticalAlignment ??
                  cell.textSettings.alignment.toVerticalAlignmentsEnum(),
            ),
            fontWeight: event.fontWeight ?? cell.textSettings.fontWeight,
            textDecoration:
                event.textDecoration ?? cell.textSettings.textDecoration,
            fontStyle: event.fontStyle ?? cell.textSettings.fontStyle,
            fontSize: newFontSize,
            color: event.color ?? cell.textSettings.color,
          );

          final newSettings = DiaryCellSettings(
            //Все эти параметры так же будут изменяться в будущем
            topBorderWidth: cell.settings.topBorderWidth,
            topBorderColor: cell.settings.topBorderColor,
            leftBorderWidth: cell.settings.leftBorderWidth,
            leftBorderColor: cell.settings.leftBorderColor,
            rightBorderWidth: cell.settings.rightBorderWidth,
            rightBorderColor: cell.settings.rightBorderColor,
            bottomBorderWidth: cell.settings.bottomBorderWidth,
            bottomBorderColor: cell.settings.bottomBorderColor,
            height: cell.settings.height, //will change
            backgroundColor:
                event.backgroundColor ?? cell.settings.backgroundColor,
          );
          newDiaryCells[index] = DiaryCell(
            columnName: cell.columnName,
            columnPosition: cell.columnPosition,
            day: cell.day,
            settings: newSettings,
            textSettings: newTextSettings,
            content: cell.content,
          );
          newSelectedCells.add(newDiaryCells[index]);
        }
        var newFirstSelectedCell =
            newDiaryCells[diaryCells.indexOf(firstSelectedCell)];

        emit(
          DiaryListState.cellsEditing(
            diaryList: diaryList,
            diaryColumns: diaryColumns,
            diaryCells: newDiaryCells,
            cellsKeys: cellsKeys,
            firstSelectedCell: newFirstSelectedCell,
            selectedCells: newSelectedCells,
            isTextEditing: isTextEditing,
            isColorEditing: isColorEditing,
            isBordersEditing: isBordersEditing,
            isBordersStyleEditing: isBordersStyleEditing,
            lists: lists,
            defaultTextSettings: defaultTextSettings,
            defaultSettings: defaultSettings,
          ),
        );

        //Uncomment to save changes to base

        // add(
        //   DiaryListEvent.updateDiaryCellsSettingsInFirebase(
        //     diaryCells: newSelectedCells,
        //     fontWeight: event.fontWeight,
        //     fontStyle: event.fontStyle,
        //     textDecoration: event.textDecoration,
        //     fontSize: event.fontSize,
        //     color: event.color,
        //     horizontalAlignment: event.horizontalAlignment,
        //     verticalAlignment: event.verticalAlignment,
        //   ),
        // );
      },
    );
  }

  Future<void> _onChangeDiaryCellsBordersSettingsEvent(
    ChangeDiaryCellsBordersSettingsEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.whenOrNull(
      cellsEditing: (
        diaryList,
        diaryColumns,
        diaryCells,
        cellsKeys,
        firstSelectedCell,
        selectedCells,
        isTextEditing,
        isColorEditing,
        isBordersEditing,
        isBordersStyleEditing,
        lists,
        defaultTextSettings,
        defaultSettings,
      ) {
        int columnsCount = 0;
        for (var column in diaryColumns) {
          columnsCount += column.columnsCount;
        }
        var newDiaryCells = _fillBorders(
          diaryCells: diaryCells,
          selectedCells: selectedCells,
          columnsCount: columnsCount,
          bordersStyleEnum: event.bordersStyleEnum,
          bordersColor: event.bordersColor,
          bordersEditing: event.bordersEditingEnum,
        );
        var newSelectedCells = List<DiaryCell>.empty(growable: true);

        for (var cell in selectedCells) {
          final index = diaryCells.indexOf(cell);
          newSelectedCells.add(newDiaryCells[index]);
        }
        var newFirstSelectedCell =
            newDiaryCells[diaryCells.indexOf(firstSelectedCell)];
        emit(
          DiaryListState.cellsEditing(
            diaryList: diaryList,
            diaryColumns: diaryColumns,
            diaryCells: newDiaryCells,
            cellsKeys: cellsKeys,
            firstSelectedCell: newFirstSelectedCell,
            selectedCells: newSelectedCells,
            isTextEditing: isTextEditing,
            isColorEditing: isColorEditing,
            isBordersEditing: isBordersEditing,
            isBordersStyleEditing: isBordersStyleEditing,
            lists: lists,
            defaultTextSettings: defaultTextSettings,
            defaultSettings: defaultSettings,
          ),
        );
        //Uncomment to save changes to base

        // add(
        //   DiaryListEvent.updateDiaryCellsSettingsInFirebase(
        //     diaryCells: newSelectedCells,
        //   ),
        // );
      },
    );
  }

  Future<void> _onUpdateDiaryCellsSettingsInFirebaseEvent(
    UpdateDiaryCellsSettingsInFirebaseEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.whenOrNull(
      cellsEditing: (
        diaryList,
        diaryColumns,
        diaryCells,
        cellsKeys,
        firstSelectedCell,
        selectedCells,
        isTextEditing,
        isColorEditing,
        isBordersEditing,
        isBordersStyleEditing,
        lists,
        defaultTextSettings,
        defaultSettings,
      ) {
        //Update cell in Firebase after 10 sec delay if there is no more changes
        //Uncomment to save changes in base

        // for (var cell in event.diaryCells) {
        //   Future.delayed(
        //     const Duration(seconds: 10),
        //     () async {
        //       final newFontWeight =
        //           event.fontWeight ?? cell.textSettings.fontWeight;
        //       final newFontStyle =
        //           event.fontStyle ?? cell.textSettings.fontStyle;
        //       final newTextDecoration =
        //           event.textDecoration ?? cell.textSettings.textDecoration;
        //       final newSize = event.fontSize ?? cell.textSettings.fontSize;
        //       final newColor = event.color ?? cell.textSettings.color;

        //       final newTextSettings = DiaryCellTextSettings(
        //         alignment: _diaryCellService.convertAlignments(
        //           horizontal: event.horizontalAlignment ??
        //               cell.textSettings.alignment.toHorizontalAlignmentsEnum(),
        //           vertical: event.verticalAlignment ??
        //               cell.textSettings.alignment.toVerticalAlignmentsEnum(),
        //         ),
        //         fontWeight: newFontWeight,
        //         textDecoration: newTextDecoration,
        //         fontStyle: newFontStyle,
        //         fontSize: newSize,
        //         color: newColor,
        //       );

        //       final newSettings = DiaryCellSettings(
        //         topBorderWidth: cell.settings.topBorderWidth,
        //         topBorderColor: cell.settings.topBorderColor,
        //         leftBorderWidth: cell.settings.leftBorderWidth,
        //         leftBorderColor: cell.settings.leftBorderColor,
        //         rightBorderWidth: cell.settings.rightBorderWidth,
        //         rightBorderColor: cell.settings.rightBorderColor,
        //         bottomBorderWidth: cell.settings.bottomBorderWidth,
        //         bottomBorderColor: cell.settings.bottomBorderColor,
        //         height: cell.settings.height,
        //         backgroundColor: cell.settings.backgroundColor,
        //       );

        //       await _diaryCellService.updateTextSettings(
        //         diaryList: diaryList,
        //         diaryCell: cell,
        //         settings: newTextSettings,
        //       );

        //       await _diaryCellService.updateSettings(
        //         diaryList: diaryList,
        //         diaryCell: cell,
        //         settings: newSettings,
        //       );
        //     },
        //   );
        // }
      },
    );
  }

  List<DiaryCell> _fillBorders({
    required List<DiaryCell> diaryCells,
    required List<DiaryCell> selectedCells,
    required int columnsCount,
    required BordersStyleEnum bordersStyleEnum,
    required Color bordersColor,
    required BordersEditingEnum bordersEditing,
  }) {
    var sorted = List<DiaryCell>.empty(growable: true);
    sorted.addAll(selectedCells);
    sorted.length > 1
        ? sorted.sort(
            (a, b) => diaryCells.indexOf(a).compareTo(diaryCells.indexOf(b)))
        : sorted;
    var topLeftCell = sorted.first;
    int topLeftCellIndex = diaryCells.indexOf(topLeftCell);
    int topRightCellIndex = diaryCells.indexOf(topLeftCell);
    int bottomLeftCellIndex = diaryCells.indexOf(topLeftCell);
    int bottomRightCellIndex = diaryCells.indexOf(topLeftCell);

    bool isTopRightIndexFinded = false;
    if (selectedCells.length > 1) {
      for (var cell in sorted.skip(1)) {
        final cellIndex = diaryCells.indexOf(cell);
        if (cellIndex % columnsCount == topLeftCellIndex % columnsCount) {
          isTopRightIndexFinded = true;
        }
        if (!isTopRightIndexFinded) {
          topRightCellIndex = cellIndex;
        }
        if (cellIndex % columnsCount == topLeftCellIndex % columnsCount) {
          bottomLeftCellIndex = cellIndex;
        }
        if (cellIndex % columnsCount == topRightCellIndex % columnsCount) {
          bottomRightCellIndex = cellIndex;
        }
      }
    }
    var newDiaryCells = List<DiaryCell>.empty(growable: true);
    newDiaryCells.addAll(diaryCells);

    double newBorderWidth = bordersStyleEnum.toDoubleWidth();
    var newBorderColor = bordersColor;
    var cellsWithTopBorders = List<DiaryCell>.empty(growable: true);
    var cellsWithLeftBorders = List<DiaryCell>.empty(growable: true);
    var cellsWithBottomBorders = List<DiaryCell>.empty(growable: true);
    var cellsWithRightBorders = List<DiaryCell>.empty(growable: true);
    for (var cell in selectedCells) {
      final index = diaryCells.indexOf(cell);
      switch (bordersEditing) {
        case BordersEditingEnum.all:
          cellsWithTopBorders.add(cell);
          cellsWithLeftBorders.add(cell);
          cellsWithBottomBorders.add(cell);
          cellsWithRightBorders.add(cell);
          break;
        case BordersEditingEnum.outer:
          {
            if (index >= topLeftCellIndex && index <= topRightCellIndex) {
              cellsWithTopBorders.add(cell);
            }
            if (index % columnsCount == topLeftCellIndex % columnsCount) {
              cellsWithLeftBorders.add(cell);
            }
            if (index >= bottomLeftCellIndex && index <= bottomRightCellIndex) {
              cellsWithBottomBorders.add(cell);
            }
            if (index % columnsCount == topRightCellIndex % columnsCount) {
              cellsWithRightBorders.add(cell);
            }
          }
          break;
        case BordersEditingEnum.inner:
          if (selectedCells.length > 1) {
            if (index % columnsCount >= topLeftCellIndex % columnsCount &&
                index % columnsCount < topRightCellIndex % columnsCount) {
              cellsWithRightBorders.add(cell);
            }
            if (index % columnsCount >= topLeftCellIndex % columnsCount &&
                index % columnsCount <= topRightCellIndex % columnsCount &&
                index < bottomLeftCellIndex) {
              cellsWithBottomBorders.add(cell);
            }
          }
          break;
        case BordersEditingEnum.vertical:
          if (selectedCells.length > 1) {
            if (index % columnsCount >= topLeftCellIndex % columnsCount &&
                index % columnsCount < topRightCellIndex % columnsCount) {
              cellsWithRightBorders.add(cell);
            }
          }
          break;
        case BordersEditingEnum.horizontal:
          if (selectedCells.length > 1) {
            if (index % columnsCount >= topLeftCellIndex % columnsCount &&
                index % columnsCount <= topRightCellIndex % columnsCount &&
                index < bottomLeftCellIndex) {
              cellsWithBottomBorders.add(cell);
            }
          }
          break;
        case BordersEditingEnum.left:
          if (index % columnsCount == topLeftCellIndex % columnsCount) {
            cellsWithLeftBorders.add(cell);
          }
          break;
        case BordersEditingEnum.right:
          if (index % columnsCount == topRightCellIndex % columnsCount) {
            cellsWithRightBorders.add(cell);
          }
          break;
        case BordersEditingEnum.top:
          if (index >= topLeftCellIndex && index <= topRightCellIndex) {
            cellsWithTopBorders.add(cell);
          }
          break;
        case BordersEditingEnum.bottom:
          if (index >= bottomLeftCellIndex && index <= bottomRightCellIndex) {
            cellsWithBottomBorders.add(cell);
          }
          break;
        case BordersEditingEnum.clear:
          cellsWithTopBorders.add(cell);
          cellsWithLeftBorders.add(cell);
          cellsWithBottomBorders.add(cell);
          cellsWithRightBorders.add(cell);
          bordersStyleEnum = Constants.defaultBordersStyleEnum;
          bordersColor = Constants.defaultBordersColor.toColor();
          newBorderWidth = bordersStyleEnum.toDoubleWidth();
          newBorderColor = Constants.defaultBordersColor.toColor();
          // return newDiaryCells; //function
          break;
        case BordersEditingEnum.none:
          break;
      }
    }
    for (var cell in cellsWithTopBorders) {
      final index = diaryCells.indexOf(cell);
      final isTopBorderNeedToBeDrawn =
          _diaryCellService.isTopBorderNeedToBeDrawn(
        diaryCells: diaryCells,
        diaryCell: cell,
        columnsCount: columnsCount,
        bordersStyleEnum: bordersStyleEnum,
        color: bordersColor,
      );
      if (isTopBorderNeedToBeDrawn && index - columnsCount >= 0 ||
          bordersEditing == BordersEditingEnum.clear &&
              index - columnsCount >= 0) {
        final topCell = newDiaryCells[index - columnsCount];
        newDiaryCells[index - columnsCount] = DiaryCell(
          columnName: topCell.columnName,
          columnPosition: topCell.columnPosition,
          day: topCell.day,
          settings: topCell.settings.copyWith(
            bottomBorderWidth: 0,
            bottomBorderColor: bordersColor.toColorString(),
          ),
          textSettings: topCell.textSettings,
          content: topCell.content,
        );
      }
      if (isTopBorderNeedToBeDrawn ||
          bordersEditing == BordersEditingEnum.clear) {
        final cell = newDiaryCells[index];
        newDiaryCells[index] = DiaryCell(
          columnName: cell.columnName,
          columnPosition: cell.columnPosition,
          day: cell.day,
          settings: cell.settings.copyWith(
            topBorderWidth: newBorderWidth,
            topBorderColor: newBorderColor.toColorString(),
          ),
          textSettings: cell.textSettings,
          content: cell.content,
        );
      }
    }
    for (var cell in cellsWithLeftBorders) {
      final index = diaryCells.indexOf(cell);
      final isLeftBorderNeedToBeDrawn =
          _diaryCellService.isLeftBorderNeedToBeDrawn(
        diaryCells: diaryCells,
        diaryCell: cell,
        columnsCount: columnsCount,
        bordersStyleEnum: bordersStyleEnum,
        color: bordersColor,
      );
      if (isLeftBorderNeedToBeDrawn &&
              index % columnsCount != 0 &&
              index != 0 ||
          bordersEditing == BordersEditingEnum.clear &&
              index % columnsCount != 0 &&
              index != 0) {
        final leftCell = newDiaryCells[index - 1];
        newDiaryCells[index - 1] = DiaryCell(
          columnName: leftCell.columnName,
          columnPosition: leftCell.columnPosition,
          day: leftCell.day,
          settings: leftCell.settings.copyWith(
            rightBorderWidth: 0,
            rightBorderColor: bordersColor.toColorString(),
          ),
          textSettings: leftCell.textSettings,
          content: leftCell.content,
        );
      }
      if (isLeftBorderNeedToBeDrawn ||
          bordersEditing == BordersEditingEnum.clear) {
        final cell = newDiaryCells[index];
        newDiaryCells[index] = DiaryCell(
          columnName: cell.columnName,
          columnPosition: cell.columnPosition,
          day: cell.day,
          settings: cell.settings.copyWith(
            leftBorderWidth: newBorderWidth,
            leftBorderColor: newBorderColor.toColorString(),
          ),
          textSettings: cell.textSettings,
          content: cell.content,
        );
      }
    }
    for (var cell in cellsWithBottomBorders) {
      final index = diaryCells.indexOf(cell);
      final isBottomBorderNeedToBeDrawn =
          _diaryCellService.isBottomBorderNeedToBeDrawn(
        diaryCells: diaryCells,
        diaryCell: cell,
        columnsCount: columnsCount,
        bordersStyleEnum: bordersStyleEnum,
        color: bordersColor,
      );
      if (isBottomBorderNeedToBeDrawn &&
              index + columnsCount < diaryCells.length ||
          bordersEditing == BordersEditingEnum.clear &&
              index + columnsCount < diaryCells.length) {
        final bottomCell = newDiaryCells[index + columnsCount];
        newDiaryCells[index + columnsCount] = DiaryCell(
          columnName: bottomCell.columnName,
          columnPosition: bottomCell.columnPosition,
          day: bottomCell.day,
          settings: bottomCell.settings.copyWith(
            topBorderWidth: 0,
            topBorderColor: bordersColor.toColorString(),
          ),
          textSettings: bottomCell.textSettings,
          content: bottomCell.content,
        );
      }
      if (isBottomBorderNeedToBeDrawn ||
          bordersEditing == BordersEditingEnum.clear) {
        final cell = newDiaryCells[index];
        newDiaryCells[index] = DiaryCell(
          columnName: cell.columnName,
          columnPosition: cell.columnPosition,
          day: cell.day,
          settings: cell.settings.copyWith(
            bottomBorderWidth: newBorderWidth,
            bottomBorderColor: newBorderColor.toColorString(),
          ),
          textSettings: cell.textSettings,
          content: cell.content,
        );
      }
    }
    for (var cell in cellsWithRightBorders) {
      final index = diaryCells.indexOf(cell);
      final isRightBorderNeedToBeDrawn =
          _diaryCellService.isRightBorderNeedToBeDrawn(
        diaryCells: diaryCells,
        diaryCell: cell,
        columnsCount: columnsCount,
        bordersStyleEnum: bordersStyleEnum,
        color: bordersColor,
      );
      if (isRightBorderNeedToBeDrawn &&
              index % columnsCount != columnsCount - 1 &&
              index < diaryCells.length ||
          bordersEditing == BordersEditingEnum.clear &&
              index % columnsCount != columnsCount - 1 &&
              index < diaryCells.length) {
        final rightCell = newDiaryCells[index + 1];
        newDiaryCells[index + 1] = DiaryCell(
          columnName: rightCell.columnName,
          columnPosition: rightCell.columnPosition,
          day: rightCell.day,
          settings: rightCell.settings.copyWith(
            leftBorderWidth: 0,
            leftBorderColor: bordersColor.toColorString(),
          ),
          textSettings: rightCell.textSettings,
          content: rightCell.content,
        );
      }
      if (isRightBorderNeedToBeDrawn ||
          bordersEditing == BordersEditingEnum.clear) {
        final cell = newDiaryCells[index];
        newDiaryCells[index] = DiaryCell(
          columnName: cell.columnName,
          columnPosition: cell.columnPosition,
          day: cell.day,
          settings: cell.settings.copyWith(
            rightBorderWidth: newBorderWidth,
            rightBorderColor: newBorderColor.toColorString(),
          ),
          textSettings: cell.textSettings,
          content: cell.content,
        );
      }
    }
    return newDiaryCells;
  }
}
