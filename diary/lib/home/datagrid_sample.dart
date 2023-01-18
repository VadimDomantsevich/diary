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
            loaded: (diaryList, diaryColumns, diaryCells, cellsKeys, lists) {
              int crossAxisCount = 0;
              for (var column in diaryColumns) {
                crossAxisCount += column.columnsCount;
              }
              return BlocBuilder<GridDisplayBloc, GridDisplayState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loaded: (
                      scaleFactor,
                      width,
                      height,
                      transformationController,
                      translateX,
                      translateY,
                      isPanelShown,
                    ) {
                      return SampleWidget.listLoadedGridLoaded(
                        scaleFactor: scaleFactor,
                        transformationController: transformationController,
                        height: height,
                        width: width,
                        diaryCells: diaryCells,
                        cellsKeys: cellsKeys,
                        crossAxisCount: crossAxisCount,
                        onPointerUp: (details) => context
                            .read<GridDisplayBloc>()
                            .add(
                              GridDisplayEvent.onPointerUp(details: details),
                            ),
                        onInteractionEnd: (details) =>
                            context.read<GridDisplayBloc>().add(
                                  GridDisplayEvent.onInteractionEnd(
                                    details: details,
                                  ),
                                ),
                      );
                    },
                    orElse: () {
                      return Container();
                    },
                  );
                },
              );
            },
            // cellSelected:
            //     (diaryList, diaryColumns, diaryCells, selectedCell, cellsKeys) {
            //   int crossAxisCount = 0;
            //   for (var column in diaryColumns) {
            //     crossAxisCount += column.columnsCount;
            //   }
            //   return BlocBuilder<GridDisplayBloc, GridDisplayState>(
            //     builder: (context, state) {
            //       return state.maybeWhen(
            //         loaded: (
            //           scaleFactor,
            //           width,
            //           height,
            //           transformationController,
            //           translateX,
            //           translateY,
            //           selectedCells,
            //         ) {
            //           return SampleWidget.cellSelectedGridLoaded(
            //             scaleFactor: scaleFactor,
            //             transformationController: transformationController,
            //             height: height,
            //             width: width,
            //             diaryCells: diaryCells,
            //             cellsKeys: cellsKeys,
            //             crossAxisCount: crossAxisCount,
            //             onPointerDown: (details) {
            //               context
            //                   .read<GridDisplayBloc>()
            //                   .add(GridDisplayEvent.onPointerDown(
            //                     details: details,
            //                     firstSelectedCell: selectedCell,
            //                     selectedCells: selectedCells!,
            //                     selectedCellKey:
            //                         cellsKeys[diaryCells.indexOf(selectedCell)],
            //                   ));
            //             },
            //             onInteractionEnd: (details) => context
            //                 .read<GridDisplayBloc>()
            //                 .add(GridDisplayEvent.onInteractionEnd(
            //                     details: details)),
            //           );
            //         },
            //         selectedMoving: (
            //           scaleFactor,
            //           width,
            //           height,
            //           transformationController,
            //           translateX,
            //           translateY,
            //           firstSelectedCell,
            //           selectedCells,
            //         ) {
            //           return SampleWidget.cellSelectedGridSelectedMoving(
            //             scaleFactor: scaleFactor,
            //             transformationController: transformationController,
            //             height: height,
            //             width: width,
            //             diaryCells: diaryCells,
            //             cellsKeys: cellsKeys,
            //             crossAxisCount: crossAxisCount,
            //             onPointerUp: (details) {
            //               context.read<GridDisplayBloc>().add(
            //                   GridDisplayEvent.onPointerUp(details: details));
            //             },
            //             onPointerMove: (details) {
            //               context.read<GridDisplayBloc>().add(
            //                   GridDisplayEvent.onPointerSelectMove(
            //                       details: details));
            //             },
            //           );
            //         },
            //         orElse: () => Container(),
            //       );
            //     },
            //   );
            // },
            cellsSelected: (diaryList, diaryColumns, diaryCells,
                firstSelectedCell, selectedCells, cellsKeys, lists) {
              int crossAxisCount = 0;
              for (var column in diaryColumns) {
                crossAxisCount += column.columnsCount;
              }
              return BlocBuilder<GridDisplayBloc, GridDisplayState>(
                builder: ((context, state) {
                  return state.maybeWhen(
                    loaded: (
                      scaleFactor,
                      width,
                      height,
                      transformationController,
                      translateX,
                      translateY,
                      isPanelShown,
                    ) {
                      return SampleWidget.cellsSelectedGridLoaded(
                        transformationController: transformationController,
                        height: height,
                        width: width,
                        diaryCells: diaryCells,
                        cellsKeys: cellsKeys,
                        crossAxisCount: crossAxisCount,
                        scaleFactor: scaleFactor,
                        onPointerDown: (details) {
                          context
                              .read<GridDisplayBloc>()
                              .add(GridDisplayEvent.onPointerDown(
                                details: details,
                                firstSelectedCell: firstSelectedCell,
                                selectedCells: selectedCells,
                                selectedCellKey: cellsKeys[
                                    diaryCells.indexOf(firstSelectedCell)],
                              ));
                        },
                        onInteractionEnd: (details) =>
                            context.read<GridDisplayBloc>().add(
                                  GridDisplayEvent.onInteractionEnd(
                                    details: details,
                                  ),
                                ),
                      );
                    },
                    selectedMoving: (
                      scaleFactor,
                      width,
                      height,
                      transformationController,
                      translateX,
                      translateY,
                      firstSelectedCellGrid,
                    ) {
                      return SampleWidget.cellsSelectedGridSelectedMoving(
                        transformationController: transformationController,
                        height: height,
                        width: width,
                        diaryCells: diaryCells,
                        cellsKeys: cellsKeys,
                        crossAxisCount: crossAxisCount,
                        scaleFactor: scaleFactor,
                        onPointerUp: (details) => context
                            .read<GridDisplayBloc>()
                            .add(
                              GridDisplayEvent.onPointerUp(details: details),
                            ),
                        onPointerMove: (details) => context
                            .read<GridDisplayBloc>()
                            .add(
                              GridDisplayEvent.onPointerSelectMove(
                                details: details,
                                firstSelectedCell: firstSelectedCell,
                                selectedCells: selectedCells,
                              ),
                            ),
                      );
                    },
                    orElse: () => Container(),
                  );
                }),
              );
            },
            listEditing: (diaryList, diaryColumns, diaryCells, cellsKeys, lists,
                selectedList) {
              int crossAxisCount = 0;
              for (var column in diaryColumns) {
                crossAxisCount += column.columnsCount;
              }
              return BlocBuilder<GridDisplayBloc, GridDisplayState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loaded: (
                      scaleFactor,
                      width,
                      height,
                      transformationController,
                      translateX,
                      translateY,
                      isPanelShown,
                    ) {
                      return SampleWidget.listEditingGridLoaded(
                        scaleFactor: scaleFactor,
                        transformationController: transformationController,
                        height: height,
                        width: width,
                        diaryCells: diaryCells,
                        cellsKeys: cellsKeys,
                        crossAxisCount: crossAxisCount,
                        onPointerDown: (details) =>
                            context.read<DiaryListBloc>().add(
                                  const DiaryListEvent.returnToLoaded(),
                                ),
                        onPointerUp: (details) => context
                            .read<GridDisplayBloc>()
                            .add(
                              GridDisplayEvent.onPointerUp(details: details),
                            ),
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
