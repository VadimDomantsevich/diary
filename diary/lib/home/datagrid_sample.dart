import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/grid_display/bloc/grid_display_bloc.dart';
import 'package:diary/home/sample.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataGridSample extends StatelessWidget {
  const DataGridSample({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DiaryListBloc, DiaryListState>(
        builder: (context, state) => state.maybeWhen(
            loaded: (diaryList, diaryColumns, diaryCells, cellsKeys) {
              int crossAxisCount = 0;
              for (var column in diaryColumns) {
                crossAxisCount += column.columnsCount;
              }
              return BlocBuilder<GridDisplayBloc, GridDisplayState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loaded: (scaleFactor, width, height,
                        transformationController, translateX, translateY) {
                      return SampleWidget.listLoadedGridLoaded(
                        scaleFactor: scaleFactor,
                        transformationController: transformationController,
                        height: height,
                        width: width,
                        diaryCells: diaryCells,
                        cellsKeys: cellsKeys,
                        crossAxisCount: crossAxisCount,
                        onInteractionEnd: (details) => context
                            .read<GridDisplayBloc>()
                            .add(GridDisplayEvent.onInteractionEnd(
                                details: details)),
                      );
                    },
                    orElse: () {
                      return Container();
                    },
                  );
                },
              );
            },
            cellSelected:
                (diaryList, diaryColumns, diaryCells, selectedCell, cellsKeys) {
              int crossAxisCount = 0;
              for (var column in diaryColumns) {
                crossAxisCount += column.columnsCount;
              }
              return BlocBuilder<GridDisplayBloc, GridDisplayState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loaded: (scaleFactor, width, height,
                        transformationController, translateX, translateY) {
                      return SampleWidget.cellSelectedGridLoaded(
                        scaleFactor: scaleFactor,
                        transformationController: transformationController,
                        height: height,
                        width: width,
                        diaryCells: diaryCells,
                        cellsKeys: cellsKeys,
                        crossAxisCount: crossAxisCount,
                        onPointerDown: (details) {
                          context
                              .read<GridDisplayBloc>()
                              .add(GridDisplayEvent.onPointerDown(
                                details: details,
                                selectedCellKey:
                                    cellsKeys[diaryCells.indexOf(selectedCell)],
                              ));
                        },
                        onInteractionEnd: (details) => context
                            .read<GridDisplayBloc>()
                            .add(GridDisplayEvent.onInteractionEnd(
                                details: details)),
                      );
                    },
                    selectedMoving: (scaleFactor, width, height,
                        transformationController, translateX, translateY) {
                      return SampleWidget.cellSelectedGridSelectedMoving(
                        scaleFactor: scaleFactor,
                        transformationController: transformationController,
                        height: height,
                        width: width,
                        diaryCells: diaryCells,
                        cellsKeys: cellsKeys,
                        crossAxisCount: crossAxisCount,
                        onPointerUp: (details) {
                          context.read<GridDisplayBloc>().add(
                              GridDisplayEvent.onPointerUp(details: details));
                        },
                        onPointerMove: (details) {
                          context.read<GridDisplayBloc>().add(
                              GridDisplayEvent.onPointerSelectMove(
                                  details: details));
                        },
                      );
                    },
                    orElse: () {
                      return Container();
                    },
                  );
                },
              );
            },
            orElse: () => const CircularProgressIndicator()),
      ),
    );
  }
}
