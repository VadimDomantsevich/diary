import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/diary_list_screen/bloc_diary_cell_widget.dart';
import 'package:diary/diary_list_screen/cell_edit_panel/bloc_diary_cell_edit_panel_widget.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:diary/model/diary_column.dart';
import 'package:diary/model/diary_list.dart';
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
          loaded: (diaryList, diaryColumns, diaryCells, diaryCellsSettings) {
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
            List<BlocDiaryCellWidget> cellWidgets =
                List<BlocDiaryCellWidget>.empty(growable: true);
            for (var i = 0; i < cells.length; i++) {
              cellWidgets.add(
                BlocDiaryCellWidget(
                  diaryCell: cells[i],
                  diaryCellSettings: diaryCellsSettings[i],
                ),
              );
            }
            List<BlocDiaryCellWidget> cellWidgetsTwo =
                List<BlocDiaryCellWidget>.empty(growable: true);
            for (var i = 0; i < cellsTwo.length; i++) {
              cellWidgets.add(
                BlocDiaryCellWidget(
                  diaryCell: cellsTwo[i],
                  diaryCellSettings: diaryCellsSettings[i + cells.length],
                ),
              );
            }
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Row(
                      children: [
                        Column(
                          children: cellWidgets.toList(),
                          // cells
                          //     .map((e) => BlocDiaryCellWidget(diaryCell: e, diaryCellSettings: diaryCellsSettings[0],))
                          //     .toList(),
                        ),
                        Column(
                          children: cellWidgetsTwo.toList(),
                          // cellsTwo
                          //     .map((e) => BlocDiaryCellWidget(diaryCell: e))
                          //     .toList(),
                        )
                      ],
                    ),
                  ),
                ),
                const BlocDiaryCellEditPanel()
              ],
            );
          },
          cellSelected: (diaryList, diaryColumns, diaryCells,
              diaryCellsSettings, selectedCell) {
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
            List<BlocDiaryCellWidget> cellWidgets =
                List<BlocDiaryCellWidget>.empty(growable: true);
            for (var i = 0; i < cells.length; i++) {
              cellWidgets.add(
                BlocDiaryCellWidget(
                  diaryCell: cells[i],
                  diaryCellSettings: diaryCellsSettings[i],
                ),
              );
            }
            List<BlocDiaryCellWidget> cellWidgetsTwo =
                List<BlocDiaryCellWidget>.empty(growable: true);
            for (var i = 0; i < cellsTwo.length; i++) {
              cellWidgets.add(
                BlocDiaryCellWidget(
                  diaryCell: cellsTwo[i],
                  diaryCellSettings: diaryCellsSettings[i + cells.length],
                ),
              );
            }
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Row(
                      children: [
                        Column(
                          children: cellWidgets.toList(),
                          //  cells
                          //     .map((e) => BlocDiaryCellWidget(diaryCell: e))
                          //     .toList(),
                        ),
                        Column(
                          children: cellWidgetsTwo.toList(),
                          // cellsTwo
                          //     .map((e) => BlocDiaryCellWidget(diaryCell: e))
                          //     .toList(),
                        )
                      ],
                    ),
                  ),
                ),
                BlocDiaryCellEditPanel()
              ],
            );
          },
        );
      }),
    );
  }
}
