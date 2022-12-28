import 'package:bloc/bloc.dart';
import 'package:diary/core/constants/enums.dart';
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
  final DiaryCellService _diaryCellService; //Мб другой сервис здесь
  DiaryCellEditBloc(
    this._diaryCellService,
    this.diaryCell,
    this.diaryList,
  ) : super(
          DiaryCellEditState.cellSelected(
            diaryCell: diaryCell,
            diaryList: diaryList,
          ),
        ) {
    on<EditCellEvent>((event, emit) => onEditCellEvent(event, emit));
    on<ChangeCellAlignmentEvent>(
        (event, emit) => onChangeCellAlignmentEvent(event, emit));
    on<ConfirmChangesEvent>(
        (event, emit) => onConfirmChangesEvent(event, emit));
  }

  void onEditCellEvent(
    EditCellEvent event,
    Emitter<DiaryCellEditState> emit,
  ) {
    emit(
      DiaryCellEditState.editing(
        diaryList: event.diaryList,
        diaryCell: event.diaryCell,
      ),
    );
  }

  void onChangeCellAlignmentEvent(
    ChangeCellAlignmentEvent event,
    Emitter<DiaryCellEditState> emit,
  ) {
    final alignment = AlignmentsEnum.values
        .firstWhere((element) => element.name == event.alignment);
    final newSettings = event.diaryCell.settings.copyWith(alignment: alignment);
    final newCell = diaryCell.copyWith(settings: newSettings);
    emit(
      DiaryCellEditState.cellSelected(
        diaryList: diaryList,
        diaryCell: newCell,
      ),
    );
    add(
      EditCellEvent(
        diaryList: diaryList,
        diaryCell: newCell,
      ),
    );
  }

  Future<void> onConfirmChangesEvent(
    ConfirmChangesEvent event,
    Emitter<DiaryCellEditState> emit,
  ) async {
    _diaryCellService.updateSettings(
      diaryList: event.diaryList,
      diaryCell: event.diaryCell,
      settings: event.diaryCell.settings,
    );
    emit(
      DiaryCellEditState.cellSelected(
        diaryList: event.diaryList,
        diaryCell: event.diaryCell,
      ),
    );
  }
}
