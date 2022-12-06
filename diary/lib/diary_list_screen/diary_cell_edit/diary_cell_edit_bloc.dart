import 'package:bloc/bloc.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:diary/model/diary_cell_settings.dart';
import 'package:diary/model/diary_list.dart';
import 'package:diary/services/diary_cell_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_cell_edit_state.dart';
part 'diary_cell_edit_event.dart';
part 'diary_cell_edit_bloc.freezed.dart';

class DiaryCellEditBloc extends Bloc<DiaryCellEditEvent, DiaryCellEditState> {
  final DiaryList diaryList;
  final DiaryCell diaryCell;
  final DiaryCellSettings diaryCellSettings;
  final DiaryCellService _diaryCellService; //Мб другой сервис здесь
  DiaryCellEditBloc(this._diaryCellService, this.diaryCell, this.diaryList,
      this.diaryCellSettings)
      : super(
          DiaryCellEditState.cellSelected(
            diaryCell: diaryCell,
            diaryList: diaryList,
            diaryCellSettings: diaryCellSettings,
          ),
        ) {
    on<EditCellEvent>((event, emit) => onEditCellEvent(event, emit));
  }

  Future<void> onEditCellEvent(
    EditCellEvent event,
    Emitter<DiaryCellEditState> emit,
  ) async {
    // final settings = await _diaryCellService.getCellSettings(
    //   diaryList: event.diaryList,
    //   diaryCell: event.diaryCell,
    // );
    emit(DiaryCellEditState.editing(
      diaryList: event.diaryList,
      diaryCell: event.diaryCell,
      diaryCellSettings: event.cellSettings,
    ));
  }
}
