part of 'diary_cell_edit_bloc.dart';

@freezed
class DiaryCellEditEvent with _$DiaryCellEditEvent {
  const factory DiaryCellEditEvent.editCell({
    required DiaryList diaryList,
    required DiaryCell diaryCell,
    required DiaryCellSettings cellSettings,
  }) = EditCellEvent;
}
