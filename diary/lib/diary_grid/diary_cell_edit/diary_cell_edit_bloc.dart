import 'package:bloc/bloc.dart';
import 'package:diary/core/constants/enums.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:diary/model/diary_list.dart';
import 'package:diary/services/diary_cell_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_cell_edit_state.dart';
part 'diary_cell_edit_event.dart';
part 'diary_cell_edit_bloc.freezed.dart';

class DiaryCellEditBloc extends Bloc<DiaryCellEditEvent, DiaryCellEditState> {
  final DiaryList diaryList;
  final DiaryCellService _diaryCellService;
  DiaryCellEditBloc(this._diaryCellService, this.diaryList)
      : super(const DiaryCellEditState.initial()) {
    on<SelectCellEvent>((event, emit) => onSelectCellEvent(event, emit));
    on<EditCellEvent>((event, emit) => onEditCellEvent(event, emit));
    on<SelectCellsEvent>((event, emit) => onSelectCellsEvent(event, emit));
  }

  void onSelectCellEvent(
    SelectCellEvent event,
    Emitter<DiaryCellEditState> emit,
  ) {
    emit(DiaryCellEditState.cellSelected(
      diaryCell: event.diaryCell,
    ));
  }

  Future<void> onEditCellEvent(
    EditCellEvent event,
    Emitter<DiaryCellEditState> emit,
  ) async {
    await _diaryCellService.update(
      diaryList: diaryList,
      diaryCell: event.diaryCell,
      dataType: event.dataType,
      content: event.content,
    );
    emit(DiaryCellEditState.editing(
      diaryCell: event.diaryCell,
    ));
  }

  void onSelectCellsEvent(
    SelectCellsEvent event,
    Emitter<DiaryCellEditState> emit,
  ) {
    emit(DiaryCellEditState.cellsSelected(diaryCells: event.diaryCells));
  }
}
