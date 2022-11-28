import 'package:diary/diary_grid/bloc_diary_cell_widget.dart';
import 'package:diary/diary_grid/cell_edit_panel/bloc_diary_cell_edit_panel_widget.dart';
import 'package:diary/diary_grid/diary_cell_edit/diary_cell_edit_bloc.dart';
import 'package:diary/diary_grid/diary_cell_widget.dart';
import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:diary/model/diary_column.dart';
import 'package:diary/model/diary_list.dart';
import 'package:diary/services/diary_cell_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SampleWidget extends StatelessWidget {
  const SampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryListBloc, DiaryListState>(
      builder: ((context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          listLoaded: (diaryList) =>
              const Center(child: CircularProgressIndicator()),
          columnsLoaded:
              (DiaryList diaryList, List<DiaryColumn> diaryColumns) =>
                  const Center(child: CircularProgressIndicator()),
          loaded: (diaryList, diaryColumns, diaryCells) {
            List<DiaryCell> cells = List<DiaryCell>.empty(growable: true);
            List<DiaryCell> cellsTwo = List<DiaryCell>.empty(growable: true);
            for (var column in diaryColumns) {
              cells.addAll(diaryCells.where((element) =>
                  element.columnName == column.name &&
                  element.columnPosition == 1));
              cellsTwo.addAll(diaryCells.where((element) =>
                  element.columnName == column.name &&
                  element.columnPosition == 2));
            }
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Row(
                      children: [
                        Column(
                          children: cells
                              .map((e) => BlocDiaryCellWidget(
                                    diaryCell: e,
                                  ))
                              .toList(),
                        ),
                        Column(
                          children: cellsTwo
                              .map((e) => BlocDiaryCellWidget(
                                    diaryCell: e,
                                  ))
                              .toList(),
                        )
                      ],
                    ),
                  ),
                ),
                const BlocDiaryCellEditPanel()
              ],
            );
          },
          cellSelected: (
            DiaryList diaryList,
            List<DiaryColumn> diaryColumns,
            List<DiaryCell> diaryCells,
            DiaryCell selectedCell,
          ) {
            List<DiaryCell> cells = List<DiaryCell>.empty(growable: true);
            List<DiaryCell> cellsTwo = List<DiaryCell>.empty(growable: true);
            for (var column in diaryColumns) {
              cells.addAll(diaryCells.where((element) =>
                  element.columnName == column.name &&
                  element.columnPosition == 1));
              cellsTwo.addAll(diaryCells.where((element) =>
                  element.columnName == column.name &&
                  element.columnPosition == 2));
            }
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Row(
                      children: [
                        Column(
                          children: cells
                              .map((e) => BlocDiaryCellWidget(
                                    diaryCell: e,
                                  ))
                              .toList(),
                        ),
                        Column(
                          children: cellsTwo
                              .map((e) => BlocDiaryCellWidget(
                                    diaryCell: e,
                                  ))
                              .toList(),
                        )
                      ],
                    ),
                  ),
                ),
                BlocDiaryCellEditPanel(
                )
              ],
            );
          },
        );
      }),
    );
  }
}
