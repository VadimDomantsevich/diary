import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/diary_list_screen/bloc_diary_cell_widget.dart';
import 'package:diary/grid_display/bloc/grid_display_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DataGridSample extends StatelessWidget {
  const DataGridSample({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final gridKey = GlobalKey();

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
                        verticalScrollController, horizontalScrollController) {
                      return SafeArea(
                        child: Listener(
                          onPointerDown: (event) {
                            event.position.dx;
                          },
                          //onPointerMove: _updateLocation,
                          child: SingleChildScrollView(
                            controller: horizontalScrollController,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: SingleChildScrollView(
                              controller: verticalScrollController,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              child: SizedBox(
                                height: height, //No?
                                width: width,
                                child: AlignedGridView.count(
                                  key: gridKey,
                                  itemCount: diaryCells.length,
                                  crossAxisCount: crossAxisCount,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Transform.scale(
                                      filterQuality: FilterQuality.high,
                                      alignment: Alignment.topLeft,
                                      scale: scaleFactor,
                                      child: BlocDiaryCellWidget(
                                        diaryCell: diaryCells[index],
                                        gridKey: gridKey,
                                        cellKey: cellsKeys[index],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
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
                        verticalScrollController, horizontalScrollController) {
                      return SafeArea(
                        child: Listener(
                          onPointerDown: (details) {
                            context.read<GridDisplayBloc>().add(
                                  GridDisplayEvent.onPointerDown(
                                    details: details,
                                    selectedCellKey: cellsKeys[
                                        diaryCells.indexOf(selectedCell)],
                                  ),
                                );
                          },
                          child: GestureDetector(
                            onScaleStart: (details) {
                              context.read<GridDisplayBloc>().add(
                                  GridDisplayEvent.onScaleStart(
                                      details: details));
                            },
                            child: SingleChildScrollView(
                              controller: horizontalScrollController,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              child: SingleChildScrollView(
                                controller: verticalScrollController,
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                child: SizedBox(
                                  height: height, //No?
                                  width: width,
                                  child: AlignedGridView.count(
                                    key: gridKey,
                                    itemCount: diaryCells.length,
                                    crossAxisCount: crossAxisCount,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Transform.scale(
                                        filterQuality: FilterQuality.high,
                                        alignment: Alignment.topLeft,
                                        scale: scaleFactor,
                                        child: BlocDiaryCellWidget(
                                          diaryCell: diaryCells[index],
                                          gridKey: gridKey,
                                          cellKey: cellsKeys[index],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    selectedMoving: (scaleFactor, width, height,
                        verticalScrollController, horizontalScrollController) {
                      return SafeArea(
                        child: Listener(
                          onPointerDown: (details) {
                            context.read<GridDisplayBloc>().add(
                                  GridDisplayEvent.onPointerDown(
                                    details: details,
                                    selectedCellKey: cellsKeys[
                                        diaryCells.indexOf(selectedCell)],
                                  ),
                                );
                          },
                          onPointerUp: (details) {
                            context.read<GridDisplayBloc>().add(
                                GridDisplayEvent.onPointerUp(details: details));
                          },
                          onPointerMove: (details) {
                            context.read<GridDisplayBloc>().add(
                                  GridDisplayEvent.onPointerSelectMove(
                                    details: details,
                                  ),
                                );
                          },
                          child: SingleChildScrollView(
                            controller: horizontalScrollController,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: SingleChildScrollView(
                              controller: verticalScrollController,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              child: SizedBox(
                                height: height,
                                width: width,
                                child: AlignedGridView.count(
                                  key: gridKey,
                                  itemCount: diaryCells.length,
                                  crossAxisCount: crossAxisCount,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Transform.scale(
                                      filterQuality: FilterQuality.high,
                                      alignment: Alignment.topLeft,
                                      scale: scaleFactor,
                                      child: BlocDiaryCellWidget(
                                        diaryCell: diaryCells[index],
                                        gridKey: gridKey,
                                        cellKey: cellsKeys[index],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    scrolling: (scaleFactor, width, height,
                        verticalScrollController, horizontalScrollController) {
                      return SafeArea(
                        child: Listener(
                          onPointerDown: (details) {
                            context.read<GridDisplayBloc>().add(
                                  GridDisplayEvent.onPointerDown(
                                    details: details,
                                    selectedCellKey: cellsKeys[
                                        diaryCells.indexOf(selectedCell)],
                                  ),
                                );
                          },
                          onPointerUp: (details) {
                            context.read<GridDisplayBloc>().add(
                                GridDisplayEvent.onPointerUp(details: details));
                          },
                          onPointerMove: (details) {
                            context.read<GridDisplayBloc>().add(
                                  GridDisplayEvent.onPointerScrollMove(
                                    details: details,
                                  ),
                                );
                          },
                          child: SingleChildScrollView(
                            controller: horizontalScrollController,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: SingleChildScrollView(
                              controller: verticalScrollController,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              child: SizedBox(
                                height: height,
                                width: width,
                                child: AlignedGridView.count(
                                  key: gridKey,
                                  itemCount: diaryCells.length,
                                  crossAxisCount: crossAxisCount,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Transform.scale(
                                      filterQuality: FilterQuality.high,
                                      alignment: Alignment.topLeft,
                                      scale: scaleFactor,
                                      child: BlocDiaryCellWidget(
                                        diaryCell: diaryCells[index],
                                        gridKey: gridKey,
                                        cellKey: cellsKeys[index],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    scaling: (scaleFactor, width, height,
                        verticalScrollController, horizontalScrollController) {
                      return SafeArea(
                        child: Listener(
                          onPointerDown: (details) {
                            context.read<GridDisplayBloc>().add(
                                  GridDisplayEvent.onPointerDown(
                                    details: details,
                                    selectedCellKey: cellsKeys[
                                        diaryCells.indexOf(selectedCell)],
                                  ),
                                );
                          },
                          onPointerUp: (details) {
                            context.read<GridDisplayBloc>().add(
                                GridDisplayEvent.onPointerUp(details: details));
                          },
                          onPointerMove: (details) {
                            context.read<GridDisplayBloc>().add(
                                  GridDisplayEvent.onPointerScrollMove(
                                    details: details,
                                  ),
                                );
                          },
                          child: SingleChildScrollView(
                            controller: horizontalScrollController,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: SingleChildScrollView(
                              controller: verticalScrollController,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              child: SizedBox(
                                height: height,
                                width: width,
                                child: AlignedGridView.count(
                                  key: gridKey,
                                  itemCount: diaryCells.length,
                                  crossAxisCount: crossAxisCount,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Transform.scale(
                                      filterQuality: FilterQuality.high,
                                      alignment: Alignment.topLeft,
                                      scale: scaleFactor,
                                      child: BlocDiaryCellWidget(
                                        diaryCell: diaryCells[index],
                                        gridKey: gridKey,
                                        cellKey: cellsKeys[index],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
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

              // return SafeArea(
              //   child: Listener(
              //     onPointerMove: _updateLocation,
              //     child: InteractiveViewer(
              //       transformationController: transformationController,
              //       minScale: 0.1,
              //       maxScale: 4.0,
              //       constrained: false,
              //       child: SizedBox(
              //         height: height,
              //         width: width,
              //         child: AlignedGridView.count(
              //           key: gridKey,
              //           physics: const NeverScrollableScrollPhysics(),
              //           itemCount: diaryCells.length,
              //           crossAxisCount: crossAxisCount,
              //           // mainAxisSpacing: 0,
              //           // crossAxisSpacing: 0,
              //           itemBuilder: (context, index) {
              //             return BlocDiaryCellWidget(
              //               diaryCell: diaryCells[index],
              //               gridKey: gridKey,
              //               cellKey: cellsKeys[index],
              //             );
              //           },
              //         ),
              //       ),
              //     ),
              //   ),
              // );
            },
            orElse: () => const CircularProgressIndicator()),
      ),
    );
  }
}
