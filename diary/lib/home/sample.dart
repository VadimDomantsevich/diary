import 'package:diary/core/constants/constants.dart';
import 'package:diary/diary_list_screen/bloc_diary_cell_widget.dart';
import 'package:diary/home/edit_panel/edit_list/bloc_edit_list_panel_widget.dart';
import 'package:diary/home/edit_panel/bloc_edit_panel_widget.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SampleWidget extends StatelessWidget {
  const SampleWidget({
    super.key,
    required this.transformationController,
    required this.height,
    required this.width,
    required this.diaryCells,
    required this.cellsKeys,
    required this.crossAxisCount,
    required this.scaleFactor,
    this.onPointerDown,
    this.onPointerUp,
    this.onPointerMove,
    this.onInteractionEnd,
  });

  final TransformationController transformationController;
  final double height;
  final double width;
  final List<DiaryCell> diaryCells;
  final List<GlobalObjectKey> cellsKeys;
  final int crossAxisCount;
  final double scaleFactor;
  final Function(PointerDownEvent)? onPointerDown;
  final Function(PointerUpEvent)? onPointerUp;
  final Function(PointerMoveEvent)? onPointerMove;
  final Function(ScaleEndDetails)? onInteractionEnd;

  factory SampleWidget.listLoadedGridLoaded({
    required TransformationController transformationController,
    required double height,
    required double width,
    required List<DiaryCell> diaryCells,
    required List<GlobalObjectKey> cellsKeys,
    required int crossAxisCount,
    required double scaleFactor,
    required Function(PointerUpEvent) onPointerUp,
    required Function(ScaleEndDetails) onInteractionEnd,
  }) {
    return SampleWidget(
      transformationController: transformationController,
      height: height,
      width: width,
      diaryCells: diaryCells,
      cellsKeys: cellsKeys,
      crossAxisCount: crossAxisCount,
      scaleFactor: scaleFactor,
      onPointerUp: onPointerUp,
      onInteractionEnd: onInteractionEnd,
    );
  }

  factory SampleWidget.listEditingGridLoaded({
    required TransformationController transformationController,
    required double height,
    required double width,
    required List<DiaryCell> diaryCells,
    required List<GlobalObjectKey> cellsKeys,
    required int crossAxisCount,
    required double scaleFactor,
    required Function(PointerDownEvent) onPointerDown,
    required Function(PointerUpEvent) onPointerUp,
  }) {
    return SampleWidget(
      transformationController: transformationController,
      height: height,
      width: width,
      diaryCells: diaryCells,
      cellsKeys: cellsKeys,
      crossAxisCount: crossAxisCount,
      scaleFactor: scaleFactor,
      onPointerDown: onPointerDown,
      onPointerUp: onPointerUp,
    );
  }
  // factory SampleWidget.cellSelectedGridLoaded({
  //   required TransformationController transformationController,
  //   required double height,
  //   required double width,
  //   required List<DiaryCell> diaryCells,
  //   required List<GlobalObjectKey> cellsKeys,
  //   required int crossAxisCount,
  //   required double scaleFactor,
  //   required Function(PointerDownEvent) onPointerDown,
  //   required Function(ScaleEndDetails) onInteractionEnd,
  // }) {
  //   return SampleWidget(
  //     transformationController: transformationController,
  //     height: height,
  //     width: width,
  //     diaryCells: diaryCells,
  //     cellsKeys: cellsKeys,
  //     crossAxisCount: crossAxisCount,
  //     onPointerDown: onPointerDown,
  //     scaleFactor: scaleFactor,
  //     onInteractionEnd: onInteractionEnd,
  //   );
  // }

  // factory SampleWidget.cellSelectedGridSelectedMoving({
  //   required TransformationController transformationController,
  //   required double height,
  //   required double width,
  //   required List<DiaryCell> diaryCells,
  //   required List<GlobalObjectKey> cellsKeys,
  //   required int crossAxisCount,
  //   required double scaleFactor,
  //   required Function(PointerUpEvent) onPointerUp,
  //   required Function(PointerMoveEvent) onPointerMove,
  // }) {
  //   return SampleWidget(
  //     transformationController: transformationController,
  //     height: height,
  //     width: width,
  //     diaryCells: diaryCells,
  //     cellsKeys: cellsKeys,
  //     crossAxisCount: crossAxisCount,
  //     scaleFactor: scaleFactor,
  //     onPointerMove: onPointerMove,
  //     onPointerUp: onPointerUp,
  //   );
  // }

  factory SampleWidget.cellsSelectedGridLoaded({
    required TransformationController transformationController,
    required double height,
    required double width,
    required List<DiaryCell> diaryCells,
    required List<GlobalObjectKey> cellsKeys,
    required int crossAxisCount,
    required double scaleFactor,
    required Function(PointerDownEvent) onPointerDown,
    required Function(ScaleEndDetails) onInteractionEnd,
    //Ещё параметры для отрисовки границ выделения
  }) {
    return SampleWidget(
      transformationController: transformationController,
      height: height,
      width: width,
      diaryCells: diaryCells,
      cellsKeys: cellsKeys,
      crossAxisCount: crossAxisCount,
      scaleFactor: scaleFactor,
      onPointerDown: onPointerDown,
      onInteractionEnd: onInteractionEnd,
    );
  }

  factory SampleWidget.cellsSelectedGridSelectedMoving({
    required TransformationController transformationController,
    required double height,
    required double width,
    required List<DiaryCell> diaryCells,
    required List<GlobalObjectKey> cellsKeys,
    required int crossAxisCount,
    required double scaleFactor,
    required Function(PointerUpEvent) onPointerUp,
    required Function(PointerMoveEvent) onPointerMove,
    //Ещё параметры для отрисовки границ выделения
  }) {
    return SampleWidget(
      transformationController: transformationController,
      height: height,
      width: width,
      diaryCells: diaryCells,
      cellsKeys: cellsKeys,
      crossAxisCount: crossAxisCount,
      scaleFactor: scaleFactor,
      onPointerMove: onPointerMove,
      onPointerUp: onPointerUp,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Listener(
            onPointerDown: onPointerDown,
            onPointerMove: onPointerMove,
            onPointerUp: onPointerUp,
            child: InteractiveViewer(
              minScale: Constants.interactiveViewerMinScale,
              maxScale: Constants.interactiveViewerMaxScale,
              constrained: false,
              transformationController: transformationController,
              onInteractionEnd: onInteractionEnd,
              child: SizedBox(
                height: height,
                width: width,
                child: AlignedGridView.custom(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: diaryCells.length,
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                  ),
                  itemBuilder: ((context, index) => BlocDiaryCellWidget(
                        diaryCell: diaryCells[index],
                        cellKey: cellsKeys[index],
                        scaleFactor: scaleFactor,
                      )),
                ),
              ),
            ),
          ),
          //BlocWidget
          const BlocEditListPanelWidget(),
          const BlocEditPanelWidget(),
        ],
      ),
    );
  }
}
