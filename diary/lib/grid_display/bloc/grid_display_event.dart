part of 'grid_display_bloc.dart';

@freezed
class GridDisplayEvent with _$GridDisplayEvent {
  const factory GridDisplayEvent.getConstraints({
    required DiaryList diaryList,
    required List<DiaryColumn> diaryColumns,
    required List<DiaryCell> diaryCells,
  }) = _GetConstraintsEvent;

  const factory GridDisplayEvent.onPointerDown({
    required PointerDownEvent details,
    GlobalObjectKey? selectedCellKey,
  }) = _OnPointerDownEvent;

  const factory GridDisplayEvent.onPointerSelectMove({
    required PointerEvent details,
  }) = _OnPointerSelectMoveEvent;

  const factory GridDisplayEvent.onPointerScrollMove({
    required PointerEvent details,
  }) = _OnPointerScrollMoveEvent;

  const factory GridDisplayEvent.onPointerUp({
    required PointerUpEvent details,
    GlobalObjectKey? selectedCellKey,
  }) = _OnPointerUpEvent;

  const factory GridDisplayEvent.onScaleStart({
    required ScaleStartDetails details,
  }) = _OnScaleStartEvent;

  const factory GridDisplayEvent.onScaleUpdate({
    required ScaleUpdateDetails details,
  }) = _OnScaleUpdateEvent;

  const factory GridDisplayEvent.onScaleEnd({
    required ScaleEndDetails details,
  }) = _OnScaleEndEvent;
}
