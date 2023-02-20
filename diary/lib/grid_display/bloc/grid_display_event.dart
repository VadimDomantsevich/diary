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
    required bool isCellSelected,
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

  const factory GridDisplayEvent.showAppBar() = _ShowAppBarEvent;

  const factory GridDisplayEvent.showEditCellPanel() = _ShowEditCellPanelEvent;

  const factory GridDisplayEvent.showBottomPanel() = _ShowBottomPanelEvent;
}
