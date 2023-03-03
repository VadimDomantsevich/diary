import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/diary_list_screen/diary_cell_edit/diary_cell_edit_bloc.dart';
import 'package:diary/grid_display/bloc/grid_display_bloc.dart';
import 'package:diary/home/edit_panel/edit_panel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocEditPanelWidget extends StatelessWidget {
  const BlocEditPanelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryListBloc, DiaryListState>(
      builder: (context, state) => state.maybeWhen(
        loaded: (diaryList, diaryColumns, capitalCells, diaryCells, cellsKeys,
            lists) {
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
                  return isPanelShown
                      ? EditPanelWidget.selectList(
                          selectedList: diaryList,
                          lists: lists,
                          onTap: (list) => list.listDate == diaryList.listDate
                              ? context.read<DiaryListBloc>().add(
                                    DiaryListEvent.startEditingList(
                                      selectedList: diaryList,
                                    ),
                                  )
                              : context.read<DiaryListBloc>().add(
                                    DiaryListEvent.getDiaryList(
                                      date: list.listDate,
                                    ),
                                  ),
                          onPressedIconButton: () =>
                              context.read<DiaryListBloc>().add(
                                    const DiaryListEvent.startEditingList(),
                                  ),
                        )
                      : Container();
                },
                orElse: () => Container(),
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
                return EditPanelWidget.editCell(
                  diaryCell: firstSelectedCell,
                  onPressedIconButton: () {
                    context.read<GridDisplayBloc>().add(
                          const GridDisplayEvent.showEditCellPanel(),
                        );
                    context.read<DiaryListBloc>().add(
                          const DiaryListEvent.startEditingCells(
                            isTextEditing: true,
                          ),
                        );
                    context.read<DiaryCellEditBloc>().add(
                          DiaryCellEditEvent.startTextEditing(
                            firstSelectedCell: firstSelectedCell,
                            defaultTextSettings: defaultTextSettings,
                            defaultSettings: defaultSettings,
                          ),
                        );
                  },
                );
              },
              orElse: () => Container(),
            ),
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
                return !isEditing
                    ? EditPanelWidget.editCapitalCell(
                        capitalCell: selectedCapitalCell,
                        onPressedIconButton: () {
                          context.read<GridDisplayBloc>().add(
                                const GridDisplayEvent.showEditCellPanel(),
                              );
                          context.read<DiaryListBloc>().add(
                                const DiaryListEvent.startEditingCells(
                                  isTextEditing: true,
                                ),
                              );
                          context.read<DiaryCellEditBloc>().add(
                                StartCapitalCellTextEditingEvent(
                                  selectedCapitalCell: selectedCapitalCell,
                                  defaultSettings: defaultSettings,
                                ),
                              );
                        },
                      )
                    : Container();
              },
              orElse: () => Container(),
            ),
          );
        },
        orElse: () => Container(),
      ),
    );
  }
}
