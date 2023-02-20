import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/diary_list_screen/diary_cell_edit/diary_cell_edit_bloc.dart';
import 'package:diary/grid_display/bloc/grid_display_bloc.dart';
import 'package:diary/home/datagrid_sample.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocDataGridSample extends StatelessWidget {
  const BlocDataGridSample({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryListBloc, DiaryListState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (diaryList, diaryColumns, diaryCells, cellsKeys, lists) {
            return BlocProvider(
              create: (context) => GridDisplayBloc(
                diaryList: diaryList,
                diaryColumns: diaryColumns,
                diaryCells: diaryCells,
                transformationController: TransformationController(),
              ),
              child: const DataGridSample(),
            );
          },
          listEditing: (diaryList, diaryColumns, diaryCells, cellsKeys, lists,
              selectedList) {
            return BlocProvider(
              create: (context) => GridDisplayBloc(
                diaryList: diaryList,
                diaryColumns: diaryColumns,
                diaryCells: diaryCells,
                transformationController: TransformationController(),
              ),
              child: const DataGridSample(),
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
            return BlocProvider(
              create: (context) => GridDisplayBloc(
                diaryList: diaryList,
                diaryColumns: diaryColumns,
                diaryCells: diaryCells,
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
            diaryCells,
            firstSelectedCell,
            selectedCells,
            cellsKeys,
            lists,
            defaultTextSettings,
            defaultSettings,
          ) {
            return BlocProvider(
              create: (context) => GridDisplayBloc(
                diaryList: diaryList,
                diaryColumns: diaryColumns,
                diaryCells: diaryCells,
                transformationController: TransformationController(),
              ),
              child: BlocProvider(
                create: (context) => DiaryCellEditBloc(),
                child: const DataGridSample(),
              ),
            );
          },
          orElse: () => Container(),
        );
      },
    );
  }
}
