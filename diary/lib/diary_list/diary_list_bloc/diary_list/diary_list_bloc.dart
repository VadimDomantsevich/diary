import 'package:bloc/bloc.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:diary/model/diary_cell_settings.dart';
import 'package:diary/model/diary_column.dart';
import 'package:diary/model/diary_list.dart';
import 'package:diary/services/diary_cell_service.dart';
import 'package:diary/services/diary_column_service.dart';
import 'package:diary/services/diary_list_service.dart';
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
  }

  Future<void> _onCreateSampleEvent(
    CreateSampleEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    _diaryListService.create(date: DateTime.now());
    final diaryList = await _diaryListService.getByDate(date: DateTime.now());
    _diaryColumnService.createDateColumn(diaryList: diaryList);
    _diaryCellService.createDateCells(diaryList: diaryList);
    //create other columns
    add(DiaryListEvent.getDiaryList(date: DateTime.now()));
  }

  //Null checks?
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
    List<DiaryCellSettings> diaryCellsSettings =
        List<DiaryCellSettings>.empty(growable: true);
    for (var column in event.diaryColumns) {
      final newCells = await _diaryCellService.getAll(
        diaryList: event.diaryList,
        diaryColumn: column,
      );
      diaryCells.addAll(newCells);
      final newCellsSettings = await _diaryCellService.getAllSettings(
        diaryList: event.diaryList,
        diaryColumn: column,
      );
      diaryCellsSettings.addAll(newCellsSettings);
    }
    emit(
      DiaryListState.loaded(
        diaryList: event.diaryList,
        diaryColumns: event.diaryColumns,
        diaryCells: diaryCells,
        diaryCellsSettings: diaryCellsSettings,
      ),
    );
  }

  Future<void> _onSelectDiaryCellEvent(
    //seemed to should be refactored in future
    SelectDiaryCellEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.whenOrNull(loaded:
        (diaryList, diaryColumns, diaryCells, diaryCellsSettings) async {
      // final settings = await _diaryCellService.getCellSettings(
      //     diaryList: diaryList, diaryCell: event.diaryCell);
      emit(DiaryListState.cellSelected(
        diaryList: diaryList,
        diaryColumns: diaryColumns,
        diaryCells: diaryCells,
        diaryCellsSettings: diaryCellsSettings,
        selectedCell: event.diaryCell,
      ));
    }, cellSelected: (diaryList, diaryColumns, diaryCells, diaryCellSettings,
        selectedCell) async {
      // final settings = await _diaryCellService.getCellSettings(
      //     diaryList: diaryList, diaryCell: event.diaryCell);
      emit(DiaryListState.cellSelected(
        diaryList: diaryList,
        diaryColumns: diaryColumns,
        diaryCells: diaryCells,
        diaryCellsSettings: diaryCellSettings,
        selectedCell: event.diaryCell,
      ));
    });
  }

  Future<void> _onChangeDiaryCellEvent(
    ChangeDiaryCellEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.whenOrNull(
      cellSelected: (diaryList, diaryColumns, diaryCells, diaryCellsSettings,
          selectedCell) async {
        if (event.textFieldText != selectedCell.content.toString()) {
          await _diaryCellService.update(
            diaryList: diaryList,
            diaryCell: selectedCell,
            dataType: selectedCell.dataType,
            content: event.textFieldText,
          );

          add(UpdateDiaryCellEvent(textFieldText: event.textFieldText));
        }
      },
    );
  }

  Future<void> _onUpdateDiaryCellEvent(
    //По идее апдейт запускается при изменении контента, а не редактировании settings
    UpdateDiaryCellEvent event,
    Emitter<DiaryListState> emit,
  ) async {
    state.whenOrNull(
      cellSelected: (diaryList, diaryColumns, diaryCells, diaryCellsSettings,
          selectedCell) async {
        final index = diaryCells.indexOf(selectedCell);
        selectedCell = selectedCell.copyWith(content: event.textFieldText);//copyWith не работает?
        // List<DiaryCell> newCells = List<DiaryCell>.empty(growable: true);
        // for (var i = 0; i < diaryCells.length; i++) {
        //   i == index ? newCells.add(selectedCell) : newCells.add(diaryCells[i]);
        // }
        // List<DiaryCellSettings> settings =
        //     await _diaryCellService.getAllSettings(
        //   diaryList: diaryList,
        //   diaryCells: newCells,
        // );
        List<DiaryCell> newCells = diaryCells.toList(growable: true);//growable?
        newCells[index] = selectedCell;
        // List<DiaryCellSettings> settings = diaryCellsSettings;
        emit(DiaryListState.loaded(
          diaryList: diaryList,
          diaryColumns: diaryColumns,
          diaryCells: newCells,
          diaryCellsSettings: diaryCellsSettings,
        ));
        add(SelectDiaryCellEvent(diaryCell: selectedCell));
      },
    );
  }
}
