import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/grid_display/bloc/grid_display_bloc.dart';
import 'package:diary/home/edit_panel/edit_cells/edit_cells_panel_bottom_column_widget.dart';
import 'package:diary/home/edit_panel/edit_cells/edit_cells_panel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocEditCellsPanelWidget extends StatelessWidget {
  const BlocEditCellsPanelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryListBloc, DiaryListState>(
      builder: (context, state) {
        return state.maybeWhen(
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
                    return isEditCellPanelShown &&
                            isTextEditing &&
                            !isColorEditing
                        ? EditCellsPanelWidget.textEditing()
                        : isEditCellPanelShown &&
                                isTextEditing &&
                                isColorEditing
                            ? EditCellsPanelWidget(
                                bottomColumn:
                                    EditCellsPanelBottomColumnWidget.color(),
                              )
                            : isEditCellPanelShown &&
                                    !isTextEditing &&
                                    !isColorEditing &&
                                    !isBordersEditing
                                ? EditCellsPanelWidget.cellEditing()
                                : isEditCellPanelShown &&
                                        !isTextEditing &&
                                        isColorEditing &&
                                        !isBordersEditing
                                    ? EditCellsPanelWidget(
                                        bottomColumn:
                                            EditCellsPanelBottomColumnWidget
                                                .color(),
                                      )
                                    : isEditCellPanelShown &&
                                            !isTextEditing &&
                                            !isColorEditing &&
                                            isBordersEditing &&
                                            !isBordersStyleEditing
                                        ? EditCellsPanelWidget(
                                            bottomColumn:
                                                EditCellsPanelBottomColumnWidget
                                                    .borders(),
                                          )
                                        : isEditCellPanelShown &&
                                                !isTextEditing &&
                                                isColorEditing &&
                                                isBordersEditing
                                            ? EditCellsPanelWidget(
                                                bottomColumn:
                                                    EditCellsPanelBottomColumnWidget
                                                        .color(),
                                              )
                                            : EditCellsPanelWidget(
                                                bottomColumn:
                                                    EditCellsPanelBottomColumnWidget
                                                        .bordersStyle(),
                                              );
                  },
                  orElse: () => Container(),
                );
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
            isBordersEditing,
            isBordersStyleEditing,
            cellsKeys,
            lists,
            defaultSettings,
          ) {
            return BlocBuilder<GridDisplayBloc, GridDisplayState>(
              builder: (context, state) => state.maybeWhen(
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
                  return isEditCellPanelShown &&
                          isEditing &&
                          isTextEditing &&
                          !isColorEditing
                      ? EditCellsPanelWidget.textEditing()
                      : isEditCellPanelShown &&
                              isEditing &&
                              isTextEditing &&
                              isColorEditing
                          ? EditCellsPanelWidget(
                              bottomColumn:
                                  EditCellsPanelBottomColumnWidget.color(),
                            )
                          : isEditCellPanelShown &&
                                  isEditing &&
                                  !isTextEditing &&
                                  !isColorEditing &&
                                  !isBordersEditing
                              ? EditCellsPanelWidget.cellEditing()
                              : isEditCellPanelShown &&
                                      !isTextEditing &&
                                      isColorEditing &&
                                      !isBordersEditing
                                  ? EditCellsPanelWidget(
                                      bottomColumn:
                                          EditCellsPanelBottomColumnWidget
                                              .color(),
                                    )
                                  : isEditCellPanelShown &&
                                          !isTextEditing &&
                                          !isColorEditing &&
                                          isBordersEditing &&
                                          !isBordersStyleEditing
                                      ? EditCellsPanelWidget(
                                          bottomColumn:
                                              EditCellsPanelBottomColumnWidget
                                                  .borders(),
                                        )
                                      : isEditCellPanelShown &&
                                              !isTextEditing &&
                                              isColorEditing &&
                                              isBordersEditing
                                          ? EditCellsPanelWidget(
                                              bottomColumn:
                                                  EditCellsPanelBottomColumnWidget
                                                      .color(),
                                            )
                                          : isEditCellPanelShown &&
                                                  !isTextEditing &&
                                                  !isColorEditing &&
                                                  isBordersEditing &&
                                                  isBordersStyleEditing
                                              ? EditCellsPanelWidget(
                                                  bottomColumn:
                                                      EditCellsPanelBottomColumnWidget
                                                          .bordersStyle(),
                                                )
                                              : Container();
                },
                orElse: () => Container(),
              ),
            );
          },
          orElse: () => Container(),
        );
      },
    );
  }
}
