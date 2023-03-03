import 'package:diary/core/constants/constants.dart';
import 'package:diary/diary_list_screen/bloc_capital_cell_widget.dart';
import 'package:diary/home/bloc_appbar_widget.dart';
import 'package:diary/home/bloc_capital_cells_row_widget.dart';
import 'package:diary/home/bloc_diary_cells_grid_widget.dart';
import 'package:diary/home/edit_panel/edit_cells/bloc_edit_cells_panel_widget.dart';
import 'package:diary/home/edit_panel/edit_list/bloc_edit_list_panel_widget.dart';
import 'package:diary/home/edit_panel/bloc_edit_panel_widget.dart';
import 'package:diary/model/capital_cell.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:diary/model/diary_column.dart';
import 'package:flutter/material.dart';

class SampleWidget extends StatelessWidget {
  const SampleWidget({
    super.key,
    required this.transformationController,
    required this.capitalCellHeight,
    required this.height,
    required this.width,
    required this.diaryCells,
    required this.cellsKeys,
    required this.capitalCells,
    required this.diaryColumns,
    required this.crossAxisCount,
    required this.scaleFactor,
    required this.isAppBarShown,
    this.onPointerDown,
    this.onPointerUp,
    this.onPointerMove,
    this.onInteractionEnd,
  });

  final TransformationController transformationController;
  final double capitalCellHeight;
  final double height;
  final double width;
  final List<DiaryCell> diaryCells;
  final List<GlobalObjectKey> cellsKeys;
  final List<CapitalCell> capitalCells;
  final List<DiaryColumn> diaryColumns;
  final int crossAxisCount;
  final double scaleFactor;
  final bool isAppBarShown;
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
    required List<CapitalCell> capitalCells,
    required List<DiaryColumn> diaryColumns,
    required int crossAxisCount,
    required double scaleFactor,
    required bool isAppBarShown,
    required Function(PointerUpEvent) onPointerUp,
    required Function(ScaleEndDetails) onInteractionEnd,
  }) {
    return SampleWidget(
      transformationController: transformationController,
      capitalCellHeight: capitalCells.first.settings.capitalCellHeight,
      height: height,
      width: width,
      diaryCells: diaryCells,
      cellsKeys: cellsKeys,
      capitalCells: capitalCells,
      diaryColumns: diaryColumns,
      crossAxisCount: crossAxisCount,
      scaleFactor: scaleFactor,
      isAppBarShown: isAppBarShown,
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
    required List<CapitalCell> capitalCells,
    required List<DiaryColumn> diaryColumns,
    required int crossAxisCount,
    required double scaleFactor,
    required bool isAppBarShown,
    required Function(PointerDownEvent) onPointerDown,
    required Function(PointerUpEvent) onPointerUp,
  }) {
    return SampleWidget(
      transformationController: transformationController,
      capitalCellHeight: capitalCells.first.settings.capitalCellHeight,
      height: height,
      width: width,
      diaryCells: diaryCells,
      diaryColumns: diaryColumns,
      capitalCells: capitalCells,
      cellsKeys: cellsKeys,
      crossAxisCount: crossAxisCount,
      scaleFactor: scaleFactor,
      isAppBarShown: isAppBarShown,
      onPointerDown: onPointerDown,
      onPointerUp: onPointerUp,
    );
  }

  factory SampleWidget.cellsEditingGridLoaded({
    required TransformationController transformationController,
    required double height,
    required double width,
    required List<DiaryCell> diaryCells,
    required List<GlobalObjectKey> cellsKeys,
    required List<CapitalCell> capitalCells,
    required List<DiaryColumn> diaryColumns,
    required int crossAxisCount,
    required double scaleFactor,
    required bool isAppBarShown,
    required Function(PointerDownEvent) onPointerDown,
    required Function(PointerUpEvent) onPointerUp,
  }) {
    return SampleWidget(
      transformationController: transformationController,
      capitalCellHeight: capitalCells.first.settings.capitalCellHeight,
      height: height,
      width: width,
      diaryCells: diaryCells,
      cellsKeys: cellsKeys,
      capitalCells: capitalCells,
      diaryColumns: diaryColumns,
      crossAxisCount: crossAxisCount,
      scaleFactor: scaleFactor,
      isAppBarShown: isAppBarShown,
      onPointerDown: onPointerDown,
      onPointerUp: onPointerUp,
    );
  }

  factory SampleWidget.cellsSelectedGridLoaded({
    required TransformationController transformationController,
    required double height,
    required double width,
    required List<DiaryCell> diaryCells,
    required List<GlobalObjectKey> cellsKeys,
    required List<CapitalCell> capitalCells,
    required List<DiaryColumn> diaryColumns,
    required int crossAxisCount,
    required double scaleFactor,
    required bool isAppBarShown,
    required Function(PointerDownEvent) onPointerDown,
    required Function(ScaleEndDetails) onInteractionEnd,
  }) {
    return SampleWidget(
      transformationController: transformationController,
      capitalCellHeight: capitalCells.first.settings.capitalCellHeight,
      height: height,
      width: width,
      diaryCells: diaryCells,
      cellsKeys: cellsKeys,
      capitalCells: capitalCells,
      diaryColumns: diaryColumns,
      crossAxisCount: crossAxisCount,
      scaleFactor: scaleFactor,
      isAppBarShown: isAppBarShown,
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
    required List<CapitalCell> capitalCells,
    required List<DiaryColumn> diaryColumns,
    required int crossAxisCount,
    required double scaleFactor,
    required bool isAppBarShown,
    required Function(PointerUpEvent) onPointerUp,
    required Function(PointerMoveEvent) onPointerMove,
  }) {
    return SampleWidget(
      transformationController: transformationController,
      capitalCellHeight: capitalCells.first.settings.capitalCellHeight,
      height: height,
      width: width,
      diaryCells: diaryCells,
      cellsKeys: cellsKeys,
      capitalCells: capitalCells,
      diaryColumns: diaryColumns,
      crossAxisCount: crossAxisCount,
      scaleFactor: scaleFactor,
      isAppBarShown: isAppBarShown,
      onPointerMove: onPointerMove,
      onPointerUp: onPointerUp,
    );
  }

  factory SampleWidget.capitalCellSelectedGridLoaded({
    required TransformationController transformationController,
    required double height,
    required double width,
    required List<DiaryCell> diaryCells,
    required List<GlobalObjectKey> cellsKeys,
    required List<CapitalCell> capitalCells,
    required List<DiaryColumn> diaryColumns,
    required int crossAxisCount,
    required double scaleFactor,
    required bool isAppBarShown,
  }) {
    return SampleWidget(
      transformationController: transformationController,
      capitalCellHeight: capitalCells.first.settings.capitalCellHeight,
      height: height,
      width: width,
      diaryCells: diaryCells,
      cellsKeys: cellsKeys,
      capitalCells: capitalCells,
      diaryColumns: diaryColumns,
      crossAxisCount: crossAxisCount,
      scaleFactor: scaleFactor,
      isAppBarShown: isAppBarShown,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              isAppBarShown ? const Size(10, kToolbarHeight) : const Size(0, 0),
          child: const BlocAppBarWidget(),
        ),
        body: Stack(
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
                child: Column(
                  children: [
                    SizedBox(
                      height: capitalCellHeight,
                      width: width,
                      child: BlocCapitalCellsRowWidget.capitalCells(
                        capitalCells: capitalCells,
                      ),
                    ),
                    SizedBox(
                      height: height,
                      width: width,
                      child: BlocDiaryCellsGridWidget.cells(
                        diaryCells: diaryCells,
                        cellsKeys: cellsKeys,
                        diaryColumns: diaryColumns,
                        scaleFactor: scaleFactor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const BlocEditCellsPanelWidget(),
            const BlocEditListPanelWidget(),
            const BlocEditPanelWidget(),
          ],
        ),
      ),
    );
  }
}
