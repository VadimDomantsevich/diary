import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/grid_display/bloc/grid_display_bloc.dart';
import 'package:diary/home/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocAppBarWidget extends StatelessWidget {
  const BlocAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryListBloc, DiaryListState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (diaryList, diaryColumns, diaryCells, cellsKeys, lists) {
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
                    isAppBarShown,
                    isPanelShown,
                    isEditCellPanelShown,
                  ) {
                    return isAppBarShown
                        ? AppBarWidget.listLoaded(
                            backgroundColor: Colors.white24,
                            foregroundColor: Colors.black,
                          )
                        : PreferredSize(
                            preferredSize: const Size(0.0, 0.0),
                            child: Container(),
                          );
                  },
                  orElse: () => PreferredSize(
                    preferredSize: const Size(0.0, 0.0),
                    child: Container(),
                  ),
                );
              },
            );
          },
          cellsSelected: (
            diaryList,
            diaryColumns,
            diaryCells,
            firstSelectedCell,
            selectedCells,
            cellsKeys,
            lists,
            defaultTextSettings,
            defaultSettings,
          ) {
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
                    isAppBarShown,
                    isPanelShown,
                    isEditCellPanelShown,
                  ) {
                    return isAppBarShown
                        ? AppBarWidget.cellsSelected(
                            backgroundColor: Colors.white24, //const value
                            foregroundColor: Colors.blueAccent, //const value
                            onPressedLeadingIcon: () {
                              //HERE
                              context.read<DiaryListBloc>().add(
                                    const ReturnToLoadedEvent(),
                                  );
                            },
                          )
                        : PreferredSize(
                            preferredSize: const Size(0.0, 0.0),
                            child: Container(),
                          );
                  },
                  selectedMoving: (
                    scaleFactor,
                    width,
                    height,
                    transformationController,
                    translateX,
                    translateY,
                    firstSelectedCell,
                    isAppBarShown,
                  ) {
                    return isAppBarShown
                        ? AppBarWidget.cellsSelected(
                            backgroundColor: Colors.white24, //const value
                            foregroundColor: Colors.blueAccent, //const value
                            onPressedLeadingIcon: () {
                              //HERE
                              context.read<DiaryListBloc>().add(
                                    const ReturnToLoadedEvent(),
                                  );
                            },
                          )
                        : PreferredSize(
                            preferredSize: const Size(0.0, 0.0),
                            child: Container(),
                          );
                  },
                  orElse: () => PreferredSize(
                    preferredSize: const Size(0.0, 0.0),
                    child: Container(),
                  ),
                );
              },
            );
          },
          cellsEditing: (
            diaryList,
            diaryColumns,
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
                    isAppBarShown,
                    isPanelShown,
                    isEditCellPanelShown,
                  ) {
                    return isAppBarShown
                        ? AppBarWidget.cellsSelected(
                            backgroundColor: Colors.white24, //const value
                            foregroundColor: Colors.blueAccent, //const value
                            onPressedLeadingIcon: () {
                              //HERE
                              context.read<DiaryListBloc>().add(
                                    const ReturnToLoadedEvent(),
                                  );
                            },
                          )
                        : PreferredSize(
                            preferredSize: const Size(0.0, 0.0),
                            child: Container(),
                          );
                  },
                  orElse: () => PreferredSize(
                    preferredSize: const Size(0.0, 0.0),
                    child: Container(),
                  ),
                );
              },
            );
          },
          orElse: () => PreferredSize(
            preferredSize: const Size(0.0, 0.0),
            child: Container(),
          ),
        );
      },
    );
  }
}
