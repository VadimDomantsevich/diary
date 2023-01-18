part of 'grid_display_bloc.dart';

@freezed
class GridDisplayEvent with _$GridDisplayEvent {
  const factory GridDisplayEvent.getConstraints({
    required double scaleFactor,
    required DiaryList diaryList,
    required List<DiaryColumn> diaryColumns,
    required List<DiaryCell> diaryCells,
  }) = _GetConstraintsEvent;

  const factory GridDisplayEvent.onPointerSelectMove({
    required PointerEvent details,
    required DiaryCell firstSelectedCell,
    required List<DiaryCell> selectedCells,
  }) = _OnPointerSelectMoveEvent;

  const factory GridDisplayEvent.onInteractionEnd({
    required ScaleEndDetails details,
  }) = _OnInteractionEndEvent;

  const factory GridDisplayEvent.onPointerDown({
    required PointerDownEvent details,
    required DiaryCell firstSelectedCell,
    required List<DiaryCell> selectedCells,
    required GlobalObjectKey selectedCellKey,
  }) = _OnPointerDownEvent;

  const factory GridDisplayEvent.onPointerUp({
    required PointerUpEvent details,
  }) = _OnPointerUpEvent;
}
