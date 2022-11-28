part of 'diary_cell_edit_bloc.dart';

@freezed
class DiaryCellEditEvent with _$DiaryCellEditEvent {
  const factory DiaryCellEditEvent.selectCell({
    required DiaryCell diaryCell,
  }) = SelectCellEvent;

  const factory DiaryCellEditEvent.editCell({
    required DiaryCell diaryCell,
    required DataTypesEnum dataType,
    required dynamic content,
  }) = EditCellEvent;

  const factory DiaryCellEditEvent.copyCell({
    required DiaryCell diaryCell,
  }) = CopyCellEvent;

  const factory DiaryCellEditEvent.selectCells({
    required List<DiaryCell> diaryCells,
  }) = SelectCellsEvent;
}
