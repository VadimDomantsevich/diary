import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/diary_list_screen/diary_cell_edit/diary_cell_edit_bloc.dart';
import 'package:diary/grid_display/bloc/grid_display_bloc.dart';
import 'package:diary/home/datagrid_sample.dart';
import 'package:diary/model/list_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocDataGridViewModeWidget extends StatelessWidget {
  const BlocDataGridViewModeWidget({
    super.key,
    required this.listTheme,
  });

  final ListTheme listTheme;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryListBloc, DiaryListState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (
            diaryList,
            diaryColumns,
            capitalCells,
            diaryCells,
            cellsKeys,
            lists,
            isListThemeViewMode,
            listTheme,
          ) {
            return BlocProvider(
              create: (context) => GridDisplayBloc(
                diaryList: diaryList,
                diaryColumns: diaryColumns,
                diaryCells: diaryCells,
                capitalCells: capitalCells,
                transformationController: TransformationController(),
              ),
              child: const DataGridSample(),
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
            isListThemeViewMode,
            listTheme,
          ) {
            return BlocProvider(
              create: (context) => GridDisplayBloc(
                diaryList: diaryList,
                diaryColumns: diaryColumns,
                diaryCells: diaryCells,
                capitalCells: capitalCells,
                transformationController: TransformationController(),
              ),
              child: BlocProvider(
                create: (context) => DiaryCellEditBloc(),
                child: const DataGridSample(),
              ),
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
            isListThemeViewMode,
            listTheme,
          ) {
            return BlocProvider(
              create: (context) => GridDisplayBloc(
                diaryList: diaryList,
                diaryColumns: diaryColumns,
                diaryCells: diaryCells,
                capitalCells: capitalCells,
                transformationController: TransformationController(),
              ),
              child: BlocProvider(
                create: (context) => DiaryCellEditBloc(),
                child: const DataGridSample(),
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
            isListThemeViewMode,
            listTheme,
          ) {
            return BlocProvider(
              create: (context) => GridDisplayBloc(
                diaryList: diaryList,
                diaryColumns: diaryColumns,
                diaryCells: diaryCells,
                capitalCells: capitalCells,
                transformationController: TransformationController(),
              ),
              child: BlocProvider(
                create: (context) => DiaryCellEditBloc(),
                child: const DataGridSample(),
              ),
            );
          },
          orElse: () {
            context.read<DiaryListBloc>().add(
                  DiaryListEvent.loadFromTheme(
                    listTheme: listTheme,
                  ),
                );
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
    );
  }
}
