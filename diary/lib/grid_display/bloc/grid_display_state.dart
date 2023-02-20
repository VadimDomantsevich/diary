part of 'grid_display_bloc.dart';

@freezed
class GridDisplayState with _$GridDisplayState {
  const factory GridDisplayState.initial({
    required double scaleFactor,
    required TransformationController transformationController,
    required double translateX,
    required double translateY,
  }) = _Initial;

  const factory GridDisplayState.loaded({
    required double scaleFactor,
    required double width,
    required double height,
    required TransformationController transformationController,
    required double translateX,
    required double translateY,
    required bool isAppBarShown,
    required bool isPanelShown,
    required bool isEditCellPanelShown,
  }) = _Loaded;

  const factory GridDisplayState.selectedMoving({
    required double scaleFactor,
    required double width,
    required double height,
    required TransformationController transformationController,
    required double translateX,
    required double translateY,
    required DiaryCell firstSelectedCell,
    required bool isAppBarShown,
  }) = _SelectedMoving;
}
