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
            loaded: (diaryList, diaryColumns, capitalCells, diaryCells,
                cellsKeys, lists) {
              int crossAxisCount = 0;
              for (var column in diaryColumns) {
                crossAxisCount += column.columnsCount;
              }
              return BlocBuilder<GridDisplayBloc, GridDisplayState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loaded: (
                      scaleFactor,
                      diaryColumns,
                      width,
                      height,
                      transformationController,
                      translateX,
                      translateY,
                      isAppBarShown,
                      isPanelShown,
                      isEditCellPanelShown,
                    ) {
                      return SampleWidget.listLoadedGridLoaded(
                        scaleFactor: scaleFactor,
                        transformationController: transformationController,
                        height: height,
                        width: width,
                        diaryList: diaryList,
                        diaryCells: diaryCells,
                        cellsKeys: cellsKeys,
                        capitalCells: capitalCells,
                        diaryColumns: diaryColumns,
                        crossAxisCount: crossAxisCount,
                        isAppBarShown: isAppBarShown,
                        onPointerUp: (details) => context
                            .read<GridDisplayBloc>()
                            .add(
                              GridDisplayEvent.onPointerUp(details: details),
                            ),
                        onInteractionEnd: (details) =>
                            context.read<GridDisplayBloc>().add(
                                  GridDisplayEvent.onInteractionEnd(
                                    details: details,
                                    isCellSelected: false,
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
            cellsSelected: (
              diaryList,
              diaryColumns,
              capitalCells,
              diaryCells,
              firstSelectedCell,
              selectedCells,
              cellsKeys,
              lists,
              defaultTextSettings,
              defaultSettings,
            ) {
              int crossAxisCount = 0;
              for (var column in diaryColumns) {
                crossAxisCount += column.columnsCount;
              }
              return BlocBuilder<GridDisplayBloc, GridDisplayState>(
                builder: ((context, state) {
                  return state.maybeWhen(
                    loaded: (
                      scaleFactor,
                      diaryColumns,
                      width,
                      height,
                      transformationController,
                      translateX,
                      translateY,
                      isAppBarShown,
                      isPanelShown,
                      isEditCellPanelShown,
                    ) {
                      return SampleWidget.cellsSelectedGridLoaded(
                        transformationController: transformationController,
                        height: height,
                        width: width,
                        diaryList: diaryList,
                        diaryCells: diaryCells,
                        cellsKeys: cellsKeys,
                        capitalCells: capitalCells,
                        diaryColumns: diaryColumns,
                        crossAxisCount: crossAxisCount,
                        scaleFactor: scaleFactor,
                        isAppBarShown: isAppBarShown,
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
                                    isCellSelected: true,
                                  ),
                                ),
                      );
                    },
                    selectedMoving: (
                      scaleFactor,
                      diaryColumns,
                      width,
                      height,
                      transformationController,
                      translateX,
                      translateY,
                      firstSelectedCellGrid,
                      isAppBarShown,
                    ) {
                      return SampleWidget.cellsSelectedGridSelectedMoving(
                        transformationController: transformationController,
                        height: height,
                        width: width,
                        diaryList: diaryList,
                        diaryCells: diaryCells,
                        cellsKeys: cellsKeys,
                        diaryColumns: diaryColumns,
                        capitalCells: capitalCells,
                        crossAxisCount: crossAxisCount,
                        scaleFactor: scaleFactor,
                        isAppBarShown: isAppBarShown,
                        onPointerUp: (details) => context
                            .read<GridDisplayBloc>()
                            .add(
                              GridDisplayEvent.onPointerUp(details: details),
                            ),
                        onPointerMove: (details) =>
                            context.read<GridDisplayBloc>().add(
                                  GridDisplayEvent.onPointerSelectMove(
                                    details: details,
                                    firstSelectedCell: firstSelectedCell,
                                    selectedCells: selectedCells,
                                    capitalCell: capitalCells.first,
                                  ),
                                ),
                      );
                    },
                    orElse: () => Container(),
                  );
                }),
              );
            },
            listEditing: (
              diaryList,
              diaryColumns,
              capitalCells,
              diaryCells,
              cellsKeys,
              lists,
              isColumnDeleting,
              isColorThemeEditing,
              selectedList,
            ) {
              int crossAxisCount = 0;
              for (var column in diaryColumns) {
                crossAxisCount += column.columnsCount;
              }
              return BlocBuilder<GridDisplayBloc, GridDisplayState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loaded: (
                      scaleFactor,
                      diaryColumns,
                      width,
                      height,
                      transformationController,
                      translateX,
                      translateY,
                      isAppBarShown,
                      isPanelShown,
                      isEditCellPanelShown,
                    ) {
                      return SampleWidget.listEditingGridLoaded(
                        scaleFactor: scaleFactor,
                        transformationController: transformationController,
                        height: height,
                        width: width,
                        diaryList: diaryList,
                        diaryCells: diaryCells,
                        cellsKeys: cellsKeys,
                        capitalCells: capitalCells,
                        diaryColumns: diaryColumns,
                        crossAxisCount: crossAxisCount,
                        isAppBarShown: isAppBarShown,
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
            cellsEditing: (
              diaryList,
              diaryColumns,
              capitalCells,
              diaryCells,
              cellsKeys,
              firstSelectedCell,
              selectedCells,
              isTextEditing,
              isColorEditing,
              isBordersEditing,
              isBordersStyleEditing,
              lists,
              defaultTextSettings,
              defaultSettings,
            ) {
              int crossAxisCount = 0;
              for (var column in diaryColumns) {
                crossAxisCount += column.columnsCount;
              }
              return BlocBuilder<GridDisplayBloc, GridDisplayState>(
                builder: (context, state) {
                  return state.maybeWhen(
                      loaded: (
                        scaleFactor,
                        diaryColumns,
                        width,
                        height,
                        transformationController,
                        translateX,
                        translateY,
                        isAppBarShown,
                        isPanelShown,
                        isEditCellPanelShown,
                      ) {
                        return SampleWidget.cellsEditingGridLoaded(
                          transformationController: transformationController,
                          height: height,
                          width: width,
                          diaryList: diaryList,
                          diaryCells: diaryCells,
                          cellsKeys: cellsKeys,
                          capitalCells: capitalCells,
                          diaryColumns: diaryColumns,
                          crossAxisCount: crossAxisCount,
                          scaleFactor: scaleFactor,
                          isAppBarShown: isAppBarShown,
                          onPointerDown: (details) {
                            context.read<DiaryListBloc>().add(
                                  const DiaryListEvent.returnToCellsSelected(),
                                );
                          },
                          onPointerUp: (details) => context
                              .read<GridDisplayBloc>()
                              .add(
                                GridDisplayEvent.onPointerUp(details: details),
                              ),
                        );
                      },
                      orElse: () => Container());
                },
              );
            },
            capitalCellSelected: (
              diaryList,
              diaryColumns,
              capitalCells,
              diaryCells,
              selectedCapitalCell,
              isEditing,
              isTextEditing,
              isColorEditing,
              isBorderEditing,
              isBorderStyleEditing,
              cellsKeys,
              lists,
              defaultSettings,
            ) {
              int crossAxisCount = 0;
              for (var column in diaryColumns) {
                crossAxisCount += column.columnsCount;
              }
              return BlocBuilder<GridDisplayBloc, GridDisplayState>(
                  builder: (context, state) {
                return state.maybeWhen(
                  loaded: (
                    scaleFactor,
                    diaryColumns,
                    width,
                    height,
                    transformationController,
                    translateX,
                    translateY,
                    isAppBarShown,
                    isPanelShown,
                    isEditCellPanelShown,
                  ) {
                    return SampleWidget.capitalCellSelectedGridLoaded(
                      transformationController: transformationController,
                      height: height,
                      width: width,
                      diaryList: diaryList,
                      diaryCells: diaryCells,
                      cellsKeys: cellsKeys,
                      capitalCells: capitalCells,
                      diaryColumns: diaryColumns,
                      crossAxisCount: crossAxisCount,
                      scaleFactor: scaleFactor,
                      isAppBarShown: isAppBarShown,
                    );
                  },
                  orElse: () => const CircularProgressIndicator(),
                );
              });
            },
            orElse: () => const CircularProgressIndicator()),
      ),
    );
  }
}
