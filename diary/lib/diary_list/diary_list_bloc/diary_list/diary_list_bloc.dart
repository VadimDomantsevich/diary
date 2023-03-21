import 'package:bloc/bloc.dart';
import 'package:diary/core/constants/constants.dart';
import 'package:diary/core/constants/enums.dart';
import 'package:diary/core/extentions.dart';
import 'package:diary/core/functions.dart';
import 'package:diary/diary_list_screen/diary_cell_content_widget.dart';
import 'package:diary/model/capital_cell.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:diary/model/diary_cell_settings.dart';
import 'package:diary/model/diary_cell_text_settings.dart';
import 'package:diary/model/diary_column.dart';
import 'package:diary/model/diary_column_settings.dart';
import 'package:diary/model/diary_list.dart';
import 'package:diary/model/diary_list_settings.dart';
import 'package:diary/model/list_theme.dart';
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
    on<CreateSampleEvent>(_onCreateSampleEvent);
    on<InitialLoadEvent>(_onInitialLoadEvent);
    on<GetDiaryListEvent>(_onGetDiaryListEvent);
    on<GetDiaryColumnsEvent>(_onGetDiaryColumnsEvent);
    on<GetDiaryCellsEvent>(_onGetDiaryCellsEvent);
    on<SelectDiaryCellEvent>((_onSelectDiaryCellEvent));
    on<SelectDiaryCellsEvent>((_onSelectDiaryCellsEvent));
    on<SelectCapitalCellEvent>((_onSelectCapitalCellEvent));
    on<StartEditingListEvent>((_onStartEditingListEvent));
    on<ReturnToLoadedEvent>((_onReturnToLoadedEvent));
    on<ReturnToCellsSelectedEvent>((_onReturnToCellsSelectedEvent));
    on<UpdateDiaryListNameEvent>((_onUpdateDiaryListNameEvent));
    on<ChangeDiaryCellEvent>((_onChangeDiaryCellEvent));
    on<ChangeCapitalCellEvent>((_onChangeCapitalCellEvent));
    on<UpdateDiaryCellInFirebaseEvent>((_onUpdateDiaryCellInFirebaseEvent));
    on<OnPanUpdateEvent>((_onPanUpdateEvent));
    on<StartEditingCellsEvent>((_onStartEditingCellsEvent));
    on<ChangeDiaryCellsSettingsEvent>((_onChangeDiaryCellsSettingsEvent));
    on<ChangeDiaryCellsBordersSettingsEvent>(
        _onChangeDiaryCellsBordersSettingsEvent);
    on<UpdateDiaryCellSettingsInFirebaseEvent>(
        _onUpdateDiaryCellSettingsInFirebaseEvent);
    on<ChangeCapitalCellSettingsEvent>((_onChangeCapitalCellSettingsEvent));
    on<UpdateCapitalCellWidthEvent>((_onUpdateCapitalCellWidthEvent));
    on<UpdateCapitalCellWidthInFirebaseEvent>(
        _onUpdateCapitalCellWidthInFirebaseEvent);
    on<UpdateCapitalCellSettingsInFirebaseEvent>(
        _onUpdateCapitalCellSettingsInFirebaseEvent);
    on<UpdateDiaryListSettingsEvent>((_onUpdateDiaryListSettingsEvent));
    on<StartEditingColorEvent>((_onStartEditingColorEvent));
    on<ShareThemeEvent>(_onShareThemeEvent);
    on<StartEditingBordersEvent>((_onStartEditingBordersEvent));
    on<StartEditingBordersStyleEvent>((_onStartEditingBordersStyleEvent));
    on<TurnBackEditingEvent>((_onTurnBackEditingEvent));
    on<CreateDiaryColumnEvent>(_onCreateDiaryColumnEvent);
    on<DeleteDiaryColumnEvent>(_onDeleteDiaryColumnEvent);
    on<DeleteColumnsEvent>(_onDeleteColumnsEvent);
    on<StartColumnDeletingEvent>((_onStartColumnDeletingEvent));
    on<StartColorThemeEditingEvent>((_onStartColorThemeEditingEvent));
    on<LoadThemesEvent>((_onLoadThemesEvent));
    on<LoadFromThemeEvent>((_onLoadFromThemeEvent));
    on<TakeThemeEvent>((_onTakeThemeEvent));
  }

  Future<void> _onInitialLoadEvent(
    InitialLoadEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.mapOrNull(
      initial: (value) async {
        final isNewUser = await _diaryListService.isNewUser();
        if (isNewUser) {
          add(const DiaryListEvent.createSample());
        } else {
          final lists = await _diaryListService.getAll();
          if (lists.any((element) =>
              element.listDate.month == DateTime.now().month &&
              element.listDate.year == DateTime.now().year)) {
            add(
              DiaryListEvent.getDiaryList(
                date: DateTime.now(),
                delay: event.isThemeTaken ? 5000 : 200,
              ),
            );
          } else {
            add(
              const DiaryListEvent.createSample(),
            );
          }
        }
      },
    );
  }

  Future<void> _onCreateSampleEvent(
    CreateSampleEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    await _diaryListService.create(date: DateTime.now());
    final diaryList = await _diaryListService.getByDate(date: DateTime.now());
    await _diaryColumnService.createDateColumn(diaryList: diaryList);
    final dateColumn =
        await _diaryColumnService.getDateColumn(diaryList: diaryList);
    await _diaryCellService.createDateCells(
      diaryList: diaryList,
      diaryColumn: dateColumn,
    );
    add(
      DiaryListEvent.getDiaryList(
        date: DateTime.now(),
        delay: Constants.createSampleDelay,
      ),
    );
  }

  Future<void> _onGetDiaryListEvent(
    GetDiaryListEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    emit(const DiaryListState.initial());
    Future.delayed(
      Duration(milliseconds: event.delay),
      () async {
        final lists = await _diaryListService.getAll();
        final diaryList = await _diaryListService.getByDate(date: event.date);
        add(
          DiaryListEvent.getDiaryColumns(
            diaryList: diaryList,
            lists: lists,
          ),
        );
      },
    );
  }

  Future<void> _onGetDiaryColumnsEvent(
    GetDiaryColumnsEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    final diaryColumns =
        await _diaryColumnService.getAll(diaryList: event.diaryList);
    final capitalCells = await _diaryColumnService.getCapitalCells(
      diaryList: event.diaryList,
      diaryColumns: diaryColumns,
    );
    emit(
      DiaryListState.columnsLoaded(
        diaryList: event.diaryList,
        diaryColumns: diaryColumns,
        capitalCells: capitalCells,
        lists: event.lists,
      ),
    );
    add(
      DiaryListEvent.getDiaryCells(
        diaryList: event.diaryList,
        diaryColumns: diaryColumns,
        capitalCells: capitalCells,
        lists: event.lists,
      ),
    );
  }

  Future<void> _onGetDiaryCellsEvent(
    GetDiaryCellsEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    List<DiaryCell> diaryCells = List<DiaryCell>.empty(growable: true);

    for (var column in event.diaryColumns.reversed) {
      final newCells = await _diaryCellService.getAll(
        diaryList: event.diaryList,
        diaryColumn: column,
      );
      diaryCells.addAll(newCells);
    }
    diaryCells.sort();

    List<GlobalObjectKey> cellsKeys =
        List<GlobalObjectKey>.empty(growable: true);
    for (var cell in diaryCells) {
      cellsKeys.add(GlobalObjectKey(cell));
    }
    emit(
      DiaryListState.loaded(
        diaryList: event.diaryList,
        diaryColumns: event.diaryColumns,
        capitalCells: event.capitalCells,
        diaryCells: diaryCells,
        cellsKeys: cellsKeys,
        lists: event.lists,
        isListThemeViewMode: false,
        listTheme: null,
      ),
    );
  }

  Future<void> _onSelectDiaryCellEvent(
    SelectDiaryCellEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.mapOrNull(
      loaded: (value) async {
        List<DiaryCell> selectedCells = [event.diaryCell];
        emit(
          DiaryListState.cellsSelected(
            diaryList: value.diaryList,
            diaryColumns: value.diaryColumns,
            capitalCells: value.capitalCells,
            diaryCells: value.diaryCells,
            firstSelectedCell: event.diaryCell,
            selectedCells: selectedCells,
            cellsKeys: value.cellsKeys,
            lists: value.lists,
            defaultTextSettings: event.diaryCell.textSettings,
            defaultSettings: event.diaryCell.settings,
            isListThemeViewMode: value.isListThemeViewMode,
            listTheme: value.listTheme,
          ),
        );
      },
      cellsSelected: (value) {
        List<DiaryCell> selectedCells = [event.diaryCell];
        emit(
          value.copyWith(
            firstSelectedCell: event.diaryCell,
            selectedCells: selectedCells,
          ),
        );
      },
      capitalCellSelected: (value) {
        List<DiaryCell> selectedCells = [event.diaryCell];
        emit(
          DiaryListState.cellsSelected(
            diaryList: value.diaryList,
            diaryColumns: value.diaryColumns,
            capitalCells: value.capitalCells,
            diaryCells: value.diaryCells,
            firstSelectedCell: event.diaryCell,
            selectedCells: selectedCells,
            cellsKeys: value.cellsKeys,
            lists: value.lists,
            defaultTextSettings: event.diaryCell.textSettings,
            defaultSettings: event.diaryCell.settings,
            isListThemeViewMode: value.isListThemeViewMode,
            listTheme: value.listTheme,
          ),
        );
      },
    );
  }

  Future<void> _onSelectDiaryCellsEvent(
    SelectDiaryCellsEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.mapOrNull(
      cellsSelected: (value) {
        emit(
          value.copyWith(
            selectedCells: event.diaryCells,
          ),
        );
      },
    );
  }

  Future<void> _onSelectCapitalCellEvent(
    SelectCapitalCellEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.mapOrNull(
      loaded: (value) async {
        emit(
          DiaryListState.capitalCellSelected(
            diaryList: value.diaryList,
            diaryColumns: value.diaryColumns,
            capitalCells: value.capitalCells,
            diaryCells: value.diaryCells,
            selectedCapitalCell: event.capitalCell,
            isEditing: false,
            isTextEditing: false,
            isBordersEditing: false,
            isBordersStyleEditing: false,
            isColorEditing: false,
            cellsKeys: value.cellsKeys,
            lists: value.lists,
            defaultSettings: event.capitalCell.settings,
            isListThemeViewMode: value.isListThemeViewMode,
            listTheme: value.listTheme,
          ),
        );
      },
      cellsSelected: (value) {
        emit(
          DiaryListState.capitalCellSelected(
            diaryList: value.diaryList,
            diaryColumns: value.diaryColumns,
            capitalCells: value.capitalCells,
            diaryCells: value.diaryCells,
            selectedCapitalCell: event.capitalCell,
            isEditing: false,
            isTextEditing: false,
            isBordersEditing: false,
            isBordersStyleEditing: false,
            isColorEditing: false,
            cellsKeys: value.cellsKeys,
            lists: value.lists,
            defaultSettings: event.capitalCell.settings,
            isListThemeViewMode: value.isListThemeViewMode,
            listTheme: value.listTheme,
          ),
        );
      },
      capitalCellSelected: (value) {
        emit(
          value.copyWith(
            selectedCapitalCell: event.capitalCell,
            isEditing: false,
            isTextEditing: false,
            isBordersEditing: false,
            isBordersStyleEditing: false,
            isColorEditing: false,
            defaultSettings: event.capitalCell.settings,
          ),
        );
      },
    );
  }

  Future<void> _onStartEditingListEvent(
    StartEditingListEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.mapOrNull(
      loaded: (value) {
        if (!value.isListThemeViewMode) {
          emit(
            DiaryListState.listEditing(
              diaryList: value.diaryList,
              diaryColumns: value.diaryColumns,
              capitalCells: value.capitalCells,
              diaryCells: value.diaryCells,
              cellsKeys: value.cellsKeys,
              lists: value.lists,
              selectedList: event.selectedList,
              isColumnDeleting: false,
              isColorThemeEditing: false,
            ),
          );
        }
      },
    );
  }

  Future<void> _onReturnToLoadedEvent(
    ReturnToLoadedEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.mapOrNull(
      listEditing: (value) async {
        if (event.newName != null && event.newName!.isNotEmpty) {
          final changedDiaryList =
              value.diaryList.copyWith(name: event.newName!);
          List<DiaryList> updatedLists = List<DiaryList>.empty(growable: true);
          for (var list in value.lists) {
            if (list.listDate == value.diaryList.listDate) {
              updatedLists.add(changedDiaryList);
            } else {
              updatedLists.add(list);
            }
          }
          emit(
            DiaryListState.loaded(
              diaryList: changedDiaryList,
              diaryColumns: value.diaryColumns,
              capitalCells: value.capitalCells,
              diaryCells: value.diaryCells,
              cellsKeys: value.cellsKeys,
              lists: updatedLists,
              isListThemeViewMode: false,
              listTheme: null,
            ),
          );
        } else {
          emit(
            DiaryListState.loaded(
              diaryList: value.diaryList,
              diaryColumns: value.diaryColumns,
              capitalCells: value.capitalCells,
              diaryCells: value.diaryCells,
              cellsKeys: value.cellsKeys,
              lists: value.lists,
              isListThemeViewMode: false,
              listTheme: null,
            ),
          );
        }
      },
      cellsSelected: (value) {
        emit(
          DiaryListState.loaded(
            diaryList: value.diaryList,
            diaryColumns: value.diaryColumns,
            capitalCells: value.capitalCells,
            diaryCells: value.diaryCells,
            cellsKeys: value.cellsKeys,
            lists: value.lists,
            isListThemeViewMode: value.isListThemeViewMode,
            listTheme: value.listTheme,
          ),
        );
      },
      cellsEditing: (value) {
        emit(
          DiaryListState.loaded(
            diaryList: value.diaryList,
            diaryColumns: value.diaryColumns,
            capitalCells: value.capitalCells,
            diaryCells: value.diaryCells,
            cellsKeys: value.cellsKeys,
            lists: value.lists,
            isListThemeViewMode: value.isListThemeViewMode,
            listTheme: value.listTheme,
          ),
        );
      },
      capitalCellSelected: (value) {
        emit(
          DiaryListState.loaded(
            diaryList: value.diaryList,
            diaryColumns: value.diaryColumns,
            capitalCells: value.capitalCells,
            diaryCells: value.diaryCells,
            cellsKeys: value.cellsKeys,
            lists: value.lists,
            isListThemeViewMode: value.isListThemeViewMode,
            listTheme: value.listTheme,
          ),
        );
      },
    );
  }

  Future<void> _onReturnToCellsSelectedEvent(
    ReturnToCellsSelectedEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.mapOrNull(
      cellsEditing: (value) {
        emit(
          DiaryListState.cellsSelected(
            diaryList: value.diaryList,
            diaryColumns: value.diaryColumns,
            capitalCells: value.capitalCells,
            diaryCells: value.diaryCells,
            firstSelectedCell: value.firstSelectedCell,
            selectedCells: value.selectedCells,
            cellsKeys: value.cellsKeys,
            lists: value.lists,
            defaultTextSettings: value.defaultTextSettings,
            defaultSettings: value.defaultSettings,
            isListThemeViewMode: value.isListThemeViewMode,
            listTheme: value.listTheme,
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
            diaryList: event.diaryList,
            newName: event.newName,
          );
        }
      },
    );
  }

  Future<void> _onPanUpdateEvent(
    OnPanUpdateEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.mapOrNull(
      cellsSelected: (value) {
        final cellBox =
            event.cellKey.currentContext!.findRenderObject() as RenderBox;

        int columnsCount = 0;
        for (var column in value.diaryColumns) {
          columnsCount += column.columnsCount;
        }
        double cellTopOffset = cellBox.localToGlobal(Offset.zero).dy;
        final cellRect = Rect.fromLTWH(
          cellBox.localToGlobal(Offset.zero).dx,
          cellTopOffset,
          cellBox.size.width * event.scaleFactor,
          cellBox.size.height * event.scaleFactor,
        );
        double leftPosition = cellRect.left;
        double rightPosition = cellRect.right;
        double topPosition = cellRect.top;
        double bottomPosition = cellRect.bottom;

        event.details.globalPosition.dy < cellRect.top
            ? topPosition = event.details.globalPosition.dy
            : topPosition = cellRect.top;

        event.details.globalPosition.dy > cellRect.bottom
            ? bottomPosition = event.details.globalPosition.dy
            : bottomPosition = cellRect.bottom;

        event.details.globalPosition.dx < cellRect.left
            ? leftPosition = event.details.globalPosition.dx
            : leftPosition = cellRect.left;

        event.details.globalPosition.dx > cellRect.right
            ? rightPosition = event.details.globalPosition.dx
            : rightPosition = cellRect.right;

        List<int> touchedCellsIndexes = List<int>.empty(growable: true);
        bool isTouch = true;
        int firstIndex = value.diaryCells.indexOf(value.firstSelectedCell);
        int index = firstIndex;
        touchedCellsIndexes.add(index);
        index >= 0 ? index-- : isTouch = false;
        do {
          if (index > 0 && index % columnsCount != firstIndex % columnsCount) {
            if (!touchedCellsIndexes.contains(index) &&
                _diaryCellService.isRectTouchTheCell(
                  leftPosition: leftPosition,
                  rightPosition: rightPosition,
                  topPosition: topPosition,
                  bottomPosition: bottomPosition,
                  cellKey: value.cellsKeys[index],
                  scaleFactor: event.scaleFactor,
                )) {
              touchedCellsIndexes.add(index);
              index--;
            } else {
              index--;
            }
          } else {
            if (index >= 0 &&
                !touchedCellsIndexes.contains(index) &&
                _diaryCellService.isRectTouchTheCell(
                  leftPosition: leftPosition,
                  rightPosition: rightPosition,
                  topPosition: topPosition,
                  bottomPosition: bottomPosition,
                  cellKey: value.cellsKeys[index],
                  scaleFactor: event.scaleFactor,
                )) {
              touchedCellsIndexes.add(index);
              index--;
            } else {
              isTouch = false;
            }
          }
        } while (isTouch);

        isTouch = true;
        index = value.diaryCells.indexOf(value.firstSelectedCell);
        index <= value.cellsKeys.length ? index++ : isTouch = false;
        do {
          if (index < value.cellsKeys.length &&
              index % columnsCount != firstIndex % columnsCount) {
            if (!touchedCellsIndexes.contains(index) &&
                _diaryCellService.isRectTouchTheCell(
                  leftPosition: leftPosition,
                  rightPosition: rightPosition,
                  topPosition: topPosition,
                  bottomPosition: bottomPosition,
                  cellKey: value.cellsKeys[index],
                  scaleFactor: event.scaleFactor,
                )) {
              touchedCellsIndexes.add(index);
              index++;
            } else {
              index++;
            }
          } else {
            if (index < value.cellsKeys.length &&
                !touchedCellsIndexes.contains(index) &&
                _diaryCellService.isRectTouchTheCell(
                  leftPosition: leftPosition,
                  rightPosition: rightPosition,
                  topPosition: topPosition,
                  bottomPosition: bottomPosition,
                  cellKey: value.cellsKeys[index],
                  scaleFactor: event.scaleFactor,
                )) {
              touchedCellsIndexes.add(index);
              index++;
            } else {
              isTouch = false;
            }
          }
        } while (isTouch);
        List<DiaryCell> selectedCells = List<DiaryCell>.empty(
          growable: true,
        );
        for (var index in touchedCellsIndexes) {
          selectedCells.add(value.diaryCells[index]);
        }
        add(
          DiaryListEvent.selectDiaryCells(
            diaryCells: selectedCells,
          ),
        );
      },
    );
  }

  Future<void> _onChangeDiaryCellEvent(
    ChangeDiaryCellEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.mapOrNull(
      cellsSelected: (value) async {
        if (event.textFieldText != value.firstSelectedCell.content.toString()) {
          final index = value.diaryCells.indexOf(value.firstSelectedCell);
          final changedCell =
              event.diaryCell.copyWith(content: event.textFieldText);
          List<DiaryCell> newCells = value.diaryCells.toList();
          newCells[index] = changedCell;
          List<DiaryCell> newSelectedCells =
              List<DiaryCell>.empty(growable: true);
          for (var cell in value.selectedCells) {
            newSelectedCells.add(newCells[value.diaryCells.indexOf(cell)]);
          }
          emit(
            value.copyWith(
              diaryCells: newCells,
              firstSelectedCell: changedCell,
              selectedCells: newSelectedCells,
            ),
          );
          if (!value.isListThemeViewMode) {
            add(
              UpdateDiaryCellInFirebaseEvent(
                diaryCell: value.firstSelectedCell,
                textFieldText: event.textFieldText,
              ),
            );
          }
        }
      },
    );
  }

  Future<void> _onChangeCapitalCellEvent(
    ChangeCapitalCellEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.mapOrNull(
      capitalCellSelected: (value) {
        if (event.textFieldText != value.selectedCapitalCell.name) {
          final index = value.capitalCells.indexOf(value.selectedCapitalCell);
          final changedCell =
              event.capitalCell.copyWith(name: event.textFieldText);
          List<CapitalCell> newCapitalCells = value.capitalCells.toList();
          newCapitalCells[index] = changedCell;
          emit(
            value.copyWith(
              capitalCells: newCapitalCells,
              selectedCapitalCell: changedCell,
              isEditing: false,
              isTextEditing: false,
              isBordersEditing: false,
              isBordersStyleEditing: false,
              isColorEditing: false,
            ),
          );
          if (!value.isListThemeViewMode) {
            final diaryColumn = value.diaryColumns
                .where((element) =>
                    element.id == value.selectedCapitalCell.columnId)
                .first;
            _diaryColumnService.update(
              diaryList: value.diaryList,
              diaryColumn: diaryColumn,
              name: changedCell.name,
              count: diaryColumn.columnsCount,
            );
          }
        }
      },
    );
  }

  Future<void> _onUpdateDiaryCellInFirebaseEvent(
    UpdateDiaryCellInFirebaseEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.mapOrNull(
      cellsSelected: (value) async {
        Future.delayed(
          const Duration(seconds: 10),
          () async {
            final index = value.diaryCells.indexOf(value.firstSelectedCell);
            final cellKey = value.cellsKeys[index];
            final cellWidget = cellKey.currentWidget as Container;
            final textWidget = cellWidget.child as DiaryCellContentWidget;
            final currentText = textWidget.content;
            if (currentText == event.textFieldText) {
              await _diaryCellService.update(
                diaryList: value.diaryList,
                diaryCell: value.firstSelectedCell,
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
    state.mapOrNull(
      cellsSelected: (value) async {
        final isTextEditing = event.isTextEditing;
        emit(
          DiaryListState.cellsEditing(
            diaryList: value.diaryList,
            diaryColumns: value.diaryColumns,
            capitalCells: value.capitalCells,
            diaryCells: value.diaryCells,
            cellsKeys: value.cellsKeys,
            firstSelectedCell: value.firstSelectedCell,
            selectedCells: value.selectedCells,
            isTextEditing: isTextEditing,
            isColorEditing: false,
            isBordersEditing: false,
            isBordersStyleEditing: false,
            lists: value.lists,
            defaultTextSettings: value.defaultTextSettings,
            defaultSettings: value.defaultSettings,
            isListThemeViewMode: value.isListThemeViewMode,
            listTheme: value.listTheme,
          ),
        );
      },
      cellsEditing: (value) {
        final isTextEditing = event.isTextEditing;
        emit(
          value.copyWith(
            isTextEditing: isTextEditing,
            isColorEditing: false,
            isBordersEditing: false,
            isBordersStyleEditing: false,
          ),
        );
      },
      capitalCellSelected: (value) {
        emit(
          value.copyWith(
            isEditing: true,
            isTextEditing: true,
          ),
        );
      },
    );
  }

  Future<void> _onStartEditingColorEvent(
    StartEditingColorEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.mapOrNull(
      cellsEditing: (value) {
        emit(
          value.copyWith(
            isColorEditing: true,
            isBordersStyleEditing: false,
          ),
        );
      },
      capitalCellSelected: (value) {
        emit(
          value.copyWith(
            isColorEditing: true,
            isBordersStyleEditing: false,
          ),
        );
      },
    );
  }

  Future<void> _onStartEditingBordersEvent(
    StartEditingBordersEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.mapOrNull(
      cellsEditing: (value) {
        emit(
          value.copyWith(
            isColorEditing: false,
            isBordersEditing: true,
            isBordersStyleEditing: false,
          ),
        );
      },
      capitalCellSelected: (value) {
        emit(
          value.copyWith(
              isTextEditing: false,
              isColorEditing: false,
              isBordersEditing: true,
              isBordersStyleEditing: false,),
        );
      },
    );
  }

  Future<void> _onStartEditingBordersStyleEvent(
    StartEditingBordersStyleEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.mapOrNull(
      cellsEditing: (value) {
        emit(
          value.copyWith(
            isColorEditing: false,
            isBordersEditing: true,
            isBordersStyleEditing: true,
          ),
        );
      },
      capitalCellSelected: (value) {
        emit(
          value.copyWith(
            isColorEditing: false,
            isBordersEditing: true,
            isBordersStyleEditing: true,
          ),
        );
      },
    );
  }

  Future<void> _onStartColumnDeletingEvent(
    StartColumnDeletingEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.mapOrNull(
      listEditing: (value) {
        emit(
          value.copyWith(
            isColumnDeleting: true,
            isColorThemeEditing: false,
          ),
        );
      },
    );
  }

  Future<void> _onStartColorThemeEditingEvent(
    StartColorThemeEditingEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.mapOrNull(
      listEditing: (value) {
        emit(
          value.copyWith(
            isColumnDeleting: false,
            isColorThemeEditing: true,
          ),
        );
      },
    );
  }

  Future<void> _onTurnBackEditingEvent(
    TurnBackEditingEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.mapOrNull(
      cellsEditing: (value) {
        emit(
          value.copyWith(
            isColorEditing: false,
            isBordersEditing: value.isColorEditing && value.isBordersEditing ||
                    value.isBordersStyleEditing
                ? true
                : false,
                isBordersStyleEditing: false,
          ),
        );
      },
      capitalCellSelected: (value) {
        emit(
          value.copyWith(
            isColorEditing: false,
            isBordersEditing: value.isColorEditing && value.isBordersEditing ||
                    value.isBordersStyleEditing
                ? true
                : false,
            isBordersStyleEditing: false,
          ),
        );
      },
      listEditing: (value) {
        emit(
          value.copyWith(
            isColorThemeEditing: false,
          ),
        );
        emit(
          DiaryListState.listEditing(
            diaryList: value.diaryList,
            diaryColumns: value.diaryColumns,
            capitalCells: value.capitalCells,
            diaryCells: value.diaryCells,
            cellsKeys: value.cellsKeys,
            lists: value.lists,
            isColumnDeleting: value.isColumnDeleting,
            isColorThemeEditing: false,
            selectedList: value.selectedList,
          ),
        );
      },
    );
  }

  Future<void> _onChangeDiaryCellsSettingsEvent(
    ChangeDiaryCellsSettingsEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.mapOrNull(
      cellsEditing: (value) {
        var newDiaryCells = List<DiaryCell>.empty(growable: true);
        newDiaryCells.addAll(value.diaryCells);
        var newSelectedCells = List<DiaryCell>.empty(growable: true);
        for (var cell in value.selectedCells) {
          final index = value.diaryCells.indexOf(cell);
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
            topBorderWidth: cell.settings.topBorderWidth,
            topBorderColor: cell.settings.topBorderColor,
            leftBorderWidth: cell.settings.leftBorderWidth,
            leftBorderColor: cell.settings.leftBorderColor,
            rightBorderWidth: cell.settings.rightBorderWidth,
            rightBorderColor: cell.settings.rightBorderColor,
            bottomBorderWidth: cell.settings.bottomBorderWidth,
            bottomBorderColor: cell.settings.bottomBorderColor,
            height: cell.settings.height,
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
            capitalColumnPosition: cell.capitalColumnPosition,
          );
          newSelectedCells.add(newDiaryCells[index]);
          if (!value.isListThemeViewMode) {
            Future.delayed(
              const Duration(seconds: 10),
              () {
                add(
                  DiaryListEvent.updateDiaryCellSettingsInFirebase(
                    diaryCell: newDiaryCells[index],
                    index: index,
                    newTextSettings: newTextSettings,
                    newSettings: newSettings,
                  ),
                );
              },
            );
          }
        }
        var newFirstSelectedCell =
            newDiaryCells[value.diaryCells.indexOf(value.firstSelectedCell)];

        emit(
          value.copyWith(
            diaryCells: newDiaryCells,
            firstSelectedCell: newFirstSelectedCell,
            selectedCells: newSelectedCells,
          ),
        );
      },
    );
  }

  Future<void> _onChangeDiaryCellsBordersSettingsEvent(
    ChangeDiaryCellsBordersSettingsEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.mapOrNull(
      cellsEditing: (value) {
        int columnsCount = 0;
        for (var column in value.diaryColumns) {
          columnsCount += column.columnsCount;
        }
        var newDiaryCells = _fillBorders(
          diaryCells: value.diaryCells,
          selectedCells: value.selectedCells,
          columnsCount: columnsCount,
          bordersStyleEnum: event.bordersStyleEnum,
          bordersColor: event.bordersColor,
          bordersEditing: event.bordersEditingEnum,
        );
        var newSelectedCells = List<DiaryCell>.empty(growable: true);

        for (var cell in value.selectedCells) {
          final index = value.diaryCells.indexOf(cell);
          newSelectedCells.add(newDiaryCells[index]);
          if (!value.isListThemeViewMode) {
            Future.delayed(
              const Duration(seconds: 10),
              () {
                add(
                  DiaryListEvent.updateDiaryCellSettingsInFirebase(
                    diaryCell: newDiaryCells[index],
                    index: index,
                    newSettings: newDiaryCells[index].settings,
                  ),
                );
              },
            );
          }
        }
        var newFirstSelectedCell =
            newDiaryCells[value.diaryCells.indexOf(value.firstSelectedCell)];

        emit(
          value.copyWith(
            diaryCells: newDiaryCells,
            firstSelectedCell: newFirstSelectedCell,
            selectedCells: newSelectedCells,
          ),
        );
      },
    );
  }

  Future<void> _onUpdateDiaryCellSettingsInFirebaseEvent(
    UpdateDiaryCellSettingsInFirebaseEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.mapOrNull(
      cellsEditing: (value) async {
        final cellInStateSettings = value.diaryCells[event.index].settings;
        final cellInStateTextSettings =
            value.diaryCells[event.index].textSettings;
        final newSettings = event.newSettings ?? event.diaryCell.settings;
        final newTextSettings =
            event.newTextSettings ?? event.diaryCell.textSettings;
        if (cellInStateSettings == newSettings &&
            cellInStateTextSettings == newTextSettings) {
          if (event.newTextSettings != null) {
            await _diaryCellService.updateTextSettings(
              diaryList: value.diaryList,
              diaryCell: event.diaryCell,
              settings: event.newTextSettings!,
            );
          }
          if (event.newSettings != null) {
            await _diaryCellService.updateSettings(
              diaryList: value.diaryList,
              diaryCell: event.diaryCell,
              settings: event.newSettings!,
            );
          }
        }
      },
    );
  }

  Future<void> _onUpdateCapitalCellSettingsInFirebaseEvent(
    UpdateCapitalCellSettingsInFirebaseEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.mapOrNull(
      capitalCellSelected: (value) {
        Future.delayed(
          const Duration(seconds: 5),
          () async {
            await _diaryColumnService.updateSettings(
              diaryList: value.diaryList,
              diaryColumn: value.diaryColumns.firstWhere((element) =>
                  element.id == value.selectedCapitalCell.columnId),
              settings: event.newSettings,
            );
          },
        );
      },
    );
  }

  Future<void> _onUpdateDiaryListSettingsEvent(
    UpdateDiaryListSettingsEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    final newSettings = DiaryListSettings(
      themeColor: event.themeColor ?? event.diaryList.settings.themeColor,
      themeBorderColor:
          event.themeBorderColor ?? event.diaryList.settings.themeBorderColor,
      themePanelBackgroundColor: event.themePanelBackgroundColor ??
          event.diaryList.settings.themePanelBackgroundColor,
    );
    _diaryListService.updateSettings(
      diaryList: event.diaryList,
      settings: newSettings,
    );
    if (event.diaryList.listDate.month == DateTime.now().month &&
        event.diaryList.listDate.year == DateTime.now().year) {
      _diaryListService.updateDefaultSettings(
        settings: newSettings,
      );
    }
  }

  Future<void> _onChangeCapitalCellSettingsEvent(
    ChangeCapitalCellSettingsEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.mapOrNull(
      capitalCellSelected: (value) {
        var newCapitalCells = List<CapitalCell>.empty(growable: true);
        newCapitalCells.addAll(value.capitalCells);
        var newFontSize = event.fontSize ??
            value.selectedCapitalCell.settings.capitalCellFontSize;
        newFontSize < Constants.minFontSize
            ? newFontSize = Constants.minFontSize
            : newFontSize;
        newFontSize > Constants.maxFontSize
            ? newFontSize = Constants.maxFontSize
            : newFontSize;
        var newBorderWidth =
            value.selectedCapitalCell.settings.capitalCellBorderWidth;
        event.bordersStyleEnum != null
            ? newBorderWidth = event.bordersStyleEnum!.toDoubleWidth()
            : newBorderWidth;
        var newBorderColor =
            value.selectedCapitalCell.settings.capitalCellBorderColor;
        event.bordersColor != null
            ? newBorderColor = event.bordersColor!.toColorString()
            : newBorderColor;
        var newAlignment = _diaryCellService.convertAlignments(
          horizontal: event.horizontalAlignment ??
              value.selectedCapitalCell.settings.capitalCellAlignment
                  .toHorizontalAlignmentsEnum(),
          vertical: event.verticalAlignment ??
              value.selectedCapitalCell.settings.capitalCellAlignment
                  .toVerticalAlignmentsEnum(),
        );
        final newSettings = DiaryColumnSettings(
          width: value.selectedCapitalCell.settings.width,
          capitalCellBorderWidth: newBorderWidth,
          capitalCellBorderColor: newBorderColor,
          capitalCellHeight:
              value.selectedCapitalCell.settings.capitalCellHeight,
          capitalCellBackgroundColor: event.backgroundColor ??
              value.selectedCapitalCell.settings.capitalCellBackgroundColor,
          capitalCellAlignment: newAlignment,
          capitalCellFontWeight: event.fontWeight ??
              value.selectedCapitalCell.settings.capitalCellFontWeight,
          capitalCellTextDecoration: event.textDecoration ??
              value.selectedCapitalCell.settings.capitalCellTextDecoration,
          capitalCellFontStyle: event.fontStyle ??
              value.selectedCapitalCell.settings.capitalCellFontStyle,
          capitalCellFontSize: newFontSize,
          capitalCellTextColor: event.color ??
              value.selectedCapitalCell.settings.capitalCellTextColor,
        );
        final newSelectedCapitalCell = CapitalCell(
          name: value.selectedCapitalCell.name,
          columnId: value.selectedCapitalCell.columnId,
          settings: newSettings,
        );
        final index = value.capitalCells.indexOf(value.selectedCapitalCell);
        newCapitalCells[index] = newSelectedCapitalCell;
        emit(
          value.copyWith(
            capitalCells: newCapitalCells,
            selectedCapitalCell: newSelectedCapitalCell,
          ),
        );

        if (!value.isListThemeViewMode) {
          add(
            DiaryListEvent.updateCapitalCellSettingsInFirebase(
              newSettings: newSettings,
            ),
          );
        }
      },
    );
  }

  Future<void> _onUpdateCapitalCellWidthEvent(
    UpdateCapitalCellWidthEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.mapOrNull(
      capitalCellSelected: (value) {
        final diaryColumn = value.diaryColumns.firstWhere(
            (element) => element.id == value.selectedCapitalCell.columnId);
        var newWidth = List<double>.empty(growable: true);
        for (var width in diaryColumn.settings.width) {
          width + event.details.delta.dx / diaryColumn.columnsCount >
                  Constants.minColumnWidth
              ? newWidth.add(
                  width += event.details.delta.dx / diaryColumn.columnsCount)
              : newWidth.add(Constants.minColumnWidth);
        }
        final newSettings =
            value.selectedCapitalCell.settings.copyWith(width: newWidth);
        final newDiaryColumn = DiaryColumn(
          id: diaryColumn.id,
          columnsCount: diaryColumn.columnsCount,
          name: diaryColumn.name,
          creationTime: diaryColumn.creationTime,
          settings: newSettings,
        );
        var newDiaryColumns = List<DiaryColumn>.empty(growable: true);
        newDiaryColumns.addAll(value.diaryColumns);
        newDiaryColumns[value.diaryColumns.indexOf(diaryColumn)] =
            newDiaryColumn;
        var newSelectedCapitalCell = CapitalCell(
          columnId: value.selectedCapitalCell.columnId,
          name: value.selectedCapitalCell.name,
          settings: newSettings,
        );
        var newCapitalCells = List<CapitalCell>.empty(growable: true);
        newCapitalCells.addAll(value.capitalCells);
        newCapitalCells[value.capitalCells.indexOf(value.selectedCapitalCell)] =
            newSelectedCapitalCell;
        emit(
          value.copyWith(
            diaryColumns: newDiaryColumns,
            capitalCells: newCapitalCells,
            selectedCapitalCell: newSelectedCapitalCell,
          ),
        );
      },
    );
  }

  Future<void> _onUpdateCapitalCellWidthInFirebaseEvent(
    UpdateCapitalCellWidthInFirebaseEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.mapOrNull(
      capitalCellSelected: (value) {
        final diaryColumn = value.diaryColumns.firstWhere(
            (element) => element.id == value.selectedCapitalCell.columnId);
        var newWidth = List<double>.empty(growable: true);
        for (var width in diaryColumn.settings.width) {
          newWidth
              .add(width += event.details.delta.dx / diaryColumn.columnsCount);
        }
        final newSettings = diaryColumn.settings.copyWith(width: newWidth);
        if (!value.isListThemeViewMode) {
          add(
            DiaryListEvent.updateCapitalCellSettingsInFirebase(
              newSettings: newSettings,
            ),
          );
        }
      },
    );
  }

  Future<void> _onCreateDiaryColumnEvent(
    CreateDiaryColumnEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    if (event.name.isNotEmpty) {
      final name = await _diaryColumnService.create(
        name: event.name,
        count: event.columnsCount,
        diaryList: event.diaryList,
      );
      final diaryColumn = await _diaryColumnService.getColumnById(
        diaryList: event.diaryList,
        columnId: name,
      );
      var newDiaryColumns = List<DiaryColumn>.empty(growable: true);
      newDiaryColumns.addAll(event.diaryColumns);
      newDiaryColumns.add(diaryColumn);
      await _diaryCellService.create(
        diaryList: event.diaryList,
        diaryColumn: diaryColumn,
        diaryColumns: newDiaryColumns,
      );
    }
  }

  Future<void> _onShareThemeEvent(
    ShareThemeEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    if (event.themeName.isNotEmpty) {
      final listTheme = _diaryListService.createListTheme(
        diaryList: event.diaryList,
        diaryColumns: event.diaryColumns,
        diaryCells: event.diaryCells,
        capitalCells: event.capitalCells,
        cellSettings: _diaryCellService.createDefaultSettings(),
        cellTextSettings: _diaryCellService.createDefaultTextSettings(),
        name: event.themeName,
        description: event.description,
      );
      _diaryListService.saveListThemeToFirestore(
        listTheme: listTheme,
      );
    }
  }

  Future<void> _onDeleteDiaryColumnEvent(
    DeleteDiaryColumnEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    final doc = await getDiaryColumnDoc(
      diaryList: event.diaryList,
      diaryColumnId: event.columnId,
    ).get();
    await _diaryColumnService.delete(doc: doc);
  }

  Future<void> _onDeleteColumnsEvent(
    DeleteColumnsEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    final diaryList = await _diaryListService.getByDate(
      date: DateTime.now(),
    );
    final diaryColumns = await _diaryColumnService.getAll(diaryList: diaryList);
    for (var diaryColumn in diaryColumns) {
      if (diaryColumn.id != Constants.diaryColumnDateField) {
        final doc = await getDiaryColumnDoc(
          diaryList: diaryList,
          diaryColumnId: diaryColumn.id,
        ).get();
        await _diaryColumnService.delete(doc: doc);
      }
    }
  }

  Future<void> _onLoadThemesEvent(
    LoadThemesEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    final listThemes = await _diaryListService.getListThemesFromFirestore();
    emit(
      DiaryListState.themesLoaded(
        listThemes: listThemes,
      ),
    );
  }

  Future<void> _onLoadFromThemeEvent(
    LoadFromThemeEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    List<GlobalObjectKey> cellsKeys =
        List<GlobalObjectKey>.empty(growable: true);
    for (var cell in event.listTheme.diaryCells) {
      cellsKeys.add(GlobalObjectKey(cell));
    }
    emit(
      DiaryListState.loaded(
        diaryList: event.listTheme.diaryList,
        diaryColumns: event.listTheme.diaryColumns,
        capitalCells: event.listTheme.capitalCells,
        diaryCells: event.listTheme.diaryCells,
        cellsKeys: cellsKeys,
        lists: [],
        isListThemeViewMode: true,
        listTheme: event.listTheme,
      ),
    );
  }

  Future<void> _onTakeThemeEvent(
    TakeThemeEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    add(const DiaryListEvent.deleteColumns());
    await _diaryListService.createFromTheme(listTheme: event.listTheme);
    await _diaryColumnService.createFromTheme(listTheme: event.listTheme);
    await _diaryCellService.createFromTheme(listTheme: event.listTheme);
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
          capitalColumnPosition: topCell.capitalColumnPosition,
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
          capitalColumnPosition: cell.capitalColumnPosition,
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
          capitalColumnPosition: leftCell.capitalColumnPosition,
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
          capitalColumnPosition: cell.capitalColumnPosition,
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
          capitalColumnPosition: bottomCell.capitalColumnPosition,
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
          capitalColumnPosition: cell.capitalColumnPosition,
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
          capitalColumnPosition: rightCell.capitalColumnPosition,
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
          capitalColumnPosition: cell.capitalColumnPosition,
        );
      }
    }
    return newDiaryCells;
  }
}
