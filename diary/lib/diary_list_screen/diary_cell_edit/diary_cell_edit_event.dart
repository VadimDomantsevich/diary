part of 'diary_cell_edit_bloc.dart';

@freezed
class DiaryCellEditEvent with _$DiaryCellEditEvent {
  const factory DiaryCellEditEvent.editCell({
    required DiaryList diaryList,
    required DiaryCell diaryCell,
  }) = EditCellEvent;

  const factory DiaryCellEditEvent.changeCellAlignment({
    required DiaryList diaryList,
    required DiaryCell diaryCell,
    required String alignment,
  }) = ChangeCellAlignmentEvent;

  const factory DiaryCellEditEvent.confirmChanges({
    required DiaryList diaryList,
    required DiaryCell diaryCell,
  }) = ConfirmChangesEvent;
}
