part of 'grid_display_bloc.dart';

@freezed
class GridDisplayState with _$GridDisplayState {
  const factory GridDisplayState.initial({
    required double scaleFactor,
    required ScrollController verticalScrollController,
    required ScrollController horizontalScrollController,
  }) = _Initial;

  const factory GridDisplayState.loaded({
    required double scaleFactor,
    required double width,
    required double height,
    required ScrollController verticalScrollController,
    required ScrollController horizontalScrollController,
  }) = _Loaded;

  const factory GridDisplayState.selectedMoving({
    required double scaleFactor,
    required double width,
    required double height,
    required ScrollController verticalScrollController,
    required ScrollController horizontalScrollController,
  }) = _SelectedMoving;

  const factory GridDisplayState.scrolling({
    required double scaleFactor,
    required double width,
    required double height,
    required ScrollController verticalScrollController,
    required ScrollController horizontalScrollController,
  }) = _Scrolling;

  const factory GridDisplayState.scaling({
    required double scaleFactor,
    required double width,
    required double height,
    required ScrollController verticalScrollController,
    required ScrollController horizontalScrollController,
  }) = _Scaling;
}
