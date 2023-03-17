import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/diary_list_screen/divider_icon_widget.dart';
import 'package:diary/grid_display/bloc/grid_display_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocDividerIconWidget extends StatelessWidget {
  const BlocDividerIconWidget({
    super.key,
    required this.isSelected,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryListBloc, DiaryListState>(
      builder: (context, state) {
        return state.maybeWhen(
          capitalCellSelected: (
            diaryList,
            diaryColumns,
            capitalCells,
            diaryCells,
            selectedCapitalCell,
            isEditing,
            isTextEditing,
            isColorEditing,
            isBordersEditing,
            isBordersStyleEditing,
            cellsKeys,
            lists,
            defaultSettings,
            isListThemeViewMode,
            listTheme,
          ) {
            return BlocBuilder<GridDisplayBloc, GridDisplayState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loaded: (
                    scaleFactor,
                    gridDiaryColumns,
                    width,
                    height,
                    transformationController,
                    translateX,
                    translateY,
                    isAppBarShown,
                    isPanelShown,
                    isEditCellPanelShown,
                  ) {
                    return isSelected
                        ? DividerIconWidget(
                            onPointerMove: (details) {
                              context.read<DiaryListBloc>().add(
                                    DiaryListEvent.updateCapitalCellWidth(
                                      details: details,
                                    ),
                                  );
                              context.read<GridDisplayBloc>().add(
                                    GridDisplayEvent.getConstraints(
                                      scaleFactor: scaleFactor,
                                      diaryList: diaryList,
                                      diaryColumns: diaryColumns,
                                      diaryCells: diaryCells,
                                      capitalCells: capitalCells,
                                      isAppBarShown: isAppBarShown,
                                      isEditCellPanelShown:
                                          isEditCellPanelShown,
                                      isPanelShown: isPanelShown,
                                    ),
                                  );
                            },
                            onPointerUp: (details) {
                              context.read<DiaryListBloc>().add(
                                    DiaryListEvent
                                        .updateCapitalCellWidthInFirebase(
                                      details: details,
                                    ),
                                  );
                              context.read<DiaryListBloc>().add(
                                    DiaryListEvent.selectCapitalCell(
                                      capitalCell: selectedCapitalCell,
                                    ),
                                  );
                            },
                          )
                        : Container();
                  },
                  orElse: () => Container(),
                );
              },
            );
          },
          orElse: () => Container(),
        );
      },
    );
  }
}
