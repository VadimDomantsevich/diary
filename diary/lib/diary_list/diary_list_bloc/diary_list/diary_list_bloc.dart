import 'package:bloc/bloc.dart';
import 'package:diary/model/diary_cell.dart';
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
    on<ChangeDiaryCellEvent>(
        ((event, emit) => _onChangeDiaryCellEvent(event, emit)));
    on<UpdateDiaryCellEvent>(
        ((event, emit) => _onUpdateDiaryCellEvent(event, emit)));
    on<OnPanUpdateEvent>(((event, emit) => _onPanUpdateEvent(event, emit)));
    // on<OnPointerDownEvent>(((event, emit) => _onPointerDownEvent(event, emit)));
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
    final diaryList = await _diaryListService.getByDate(date: event.date);
    emit(DiaryListState.listLoaded(diaryList: diaryList));
    add(DiaryListEvent.getDiaryColumns(diaryList: diaryList));
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
      ),
    );
    add(
      DiaryListEvent.getDiaryCells(
        diaryList: event.diaryList,
        diaryColumns: diaryColumns,
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
      ),
    );
  }

  Future<void> _onSelectDiaryCellEvent(
    //seemed to should be refactored in future
    SelectDiaryCellEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.whenOrNull(
      loaded: (diaryList, diaryColumns, diaryCells, cellsKeys) async {
        emit(DiaryListState.cellSelected(
          diaryList: diaryList,
          diaryColumns: diaryColumns,
          diaryCells: diaryCells,
          selectedCell: event.diaryCell,
          cellsKeys: cellsKeys,
        ));
      },
      cellSelected:
          (diaryList, diaryColumns, diaryCells, selectedCell, cellsKeys) async {
        emit(
          DiaryListState.cellSelected(
            diaryList: diaryList,
            diaryColumns: diaryColumns,
            diaryCells: diaryCells,
            selectedCell: event.diaryCell,
            cellsKeys: cellsKeys,
          ),
        );
      },
      cellsSelected: (diaryList, diaryColumns, diaryCells, firstSelectedCell,
          selectedCells, cellsKeys) {
        emit(
          DiaryListState.cellSelected(
            diaryList: diaryList,
            diaryColumns: diaryColumns,
            diaryCells: diaryCells,
            selectedCell: event.diaryCell,
            cellsKeys: cellsKeys,
          ),
        );
      },
    );
  }

  Future<void> _onPanUpdateEvent(
    OnPanUpdateEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.whenOrNull(
      cellSelected:
          (diaryList, diaryColumns, diaryCells, selectedCell, cellsKeys) {
            
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

        int verticalStep = columnsCount - 1;
        //print('Step: $verticalStep');
        List<int> touchedCellsIndexes = List<int>.empty(growable: true);

        //up direction
        bool isTouch = true;
        int index = diaryCells.indexOf(selectedCell);
        int checksCount = 0;
        touchedCellsIndexes.add(index);
        if (index >= 0) {
          index--;
        } else {
          isTouch = false;
        }
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
        index = diaryCells.indexOf(selectedCell);
        if (index < cellsKeys.length - 1) {
          index++;
        } else {
          isTouch = false;
        }
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
        print('ChecksCount: $checksCount');
        print(touchedCellsIndexes.length);
        for (var i in touchedCellsIndexes) {
          print('Touched Index: $i');
        }
      },
    );
  }

  Future<void> _onChangeDiaryCellEvent(
    //И на апдейт контента и сеттингов
    ChangeDiaryCellEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.whenOrNull(
      cellSelected: (diaryList, diaryColumns, diaryCells, selectedCell,
          cellRenderBox) async {
        if (event.textFieldText != selectedCell.content.toString()) {
          await _diaryCellService.update(
            diaryList: diaryList,
            diaryCell: selectedCell,
            dataType: selectedCell.dataType,
            content: event.textFieldText,
          );
          final diaryColumn = diaryColumns.firstWhere(
            ((element) => element.id == selectedCell.columnName),
          );
          final updatedCell = await _diaryCellService.getDiaryCell(
            diaryList: diaryList,
            diaryColumn: diaryColumn,
            diaryCell: selectedCell,
          );
          add(UpdateDiaryCellEvent(diaryCell: updatedCell));
        }
      },
    );
  }

  Future<void> _onUpdateDiaryCellEvent(
    UpdateDiaryCellEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.whenOrNull(
      cellSelected:
          (diaryList, diaryColumns, diaryCells, selectedCell, cellsKeys) async {
        final index = diaryCells.indexOf(selectedCell);
        List<DiaryCell> newCells = diaryCells.toList();
        newCells[index] = event.diaryCell;
        emit(
          DiaryListState.loaded(
            diaryList: diaryList,
            diaryColumns: diaryColumns,
            diaryCells: newCells,
            cellsKeys: cellsKeys,
          ),
        );
        final cellKey = GlobalObjectKey(event.diaryCell);
        add(
          SelectDiaryCellEvent(cellKey: cellKey, diaryCell: event.diaryCell),
        );
      },
    );
  }
}
