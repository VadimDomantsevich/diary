part of 'diary_cell_edit_bloc.dart';

@freezed
class DiaryCellEditState with _$DiaryCellEditState {
  const factory DiaryCellEditState.initial() = _Initial;

  const factory DiaryCellEditState.cellSelected({
    required DiaryCell diaryCell,
  }) = _CellSelectedState;

  const factory DiaryCellEditState.editing({
    required DiaryCell diaryCell,
  }) = _CellEditingState;

  const factory DiaryCellEditState.cellsSelected({
    required List<DiaryCell> diaryCells,
  }) = _CellsSelectedState;
}
