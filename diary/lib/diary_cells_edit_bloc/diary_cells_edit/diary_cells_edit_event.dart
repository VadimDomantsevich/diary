part of 'diary_cells_edit_bloc.dart';

@freezed
class DiaryCellsEditEvent with _$DiaryCellsEditEvent {
  const factory DiaryCellsEditEvent.selectAlignment({
    required HorizontalAlignmentsEnum horizontalAlignment,
    required VerticalAlignmentsEnum verticalAlignment,
  }) = SelectAlignmentEvent;
}
