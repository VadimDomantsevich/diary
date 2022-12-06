part of 'diary_cell_edit_bloc.dart';

@freezed
class DiaryCellEditState with _$DiaryCellEditState {
  const factory DiaryCellEditState.cellSelected({
    required DiaryList diaryList,
    required DiaryCell diaryCell,
    required DiaryCellSettings diaryCellSettings,
  }) = _CellSelectedState;

  const factory DiaryCellEditState.editing({
    required DiaryList diaryList,
    required DiaryCell diaryCell,
    required DiaryCellSettings diaryCellSettings,
  }) = _CellEditingState;
}
