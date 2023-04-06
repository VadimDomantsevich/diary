import 'package:diary/diary_list_screen/bloc_widgets/bloc_diary_cell_widget.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:diary/model/diary_column.dart';
import 'package:diary/model/diary_list.dart';
import 'package:flutter/material.dart';

class BlocDiaryCellsGridWidget extends StatelessWidget {
  const BlocDiaryCellsGridWidget({
    super.key,
    required this.cellsRows,
  });

  final List<Widget> cellsRows;

  factory BlocDiaryCellsGridWidget.cells({
    required DiaryList diaryList,
    required List<DiaryCell> diaryCells,
    required List<GlobalObjectKey> cellsKeys,
    required List<DiaryColumn> diaryColumns,
    required double scaleFactor,
  }) {
    int columnsCount = 0;
    for (var column in diaryColumns) {
      columnsCount += column.columnsCount;
    }
    List<Widget> rowsList = List<Widget>.empty(growable: true);
    List<Widget> cellsList = List<Widget>.empty(growable: true);
    for (var cell in diaryCells) {
      final index = diaryCells.indexOf(cell);
      if (index % columnsCount != 0 || index == 0) {
        cellsList.add(
          BlocDiaryCellWidget(
            diaryList: diaryList,
            diaryCell: cell,
            diaryColumns: diaryColumns,
            cellKey: cellsKeys[index],
            scaleFactor: scaleFactor,
          ),
        );
      } else {
        rowsList.add(
          Row(
            children: cellsList,
          ),
        );
        cellsList = List.empty(growable: true);
        cellsList.add(
          BlocDiaryCellWidget(
            diaryList: diaryList,
            diaryCell: cell,
            diaryColumns: diaryColumns,
            cellKey: cellsKeys[index],
            scaleFactor: scaleFactor,
          ),
        );
      }
    }
    rowsList.add(
      Row(
        children: cellsList,
      ),
    );
    return BlocDiaryCellsGridWidget(
      cellsRows: rowsList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: cellsRows,
    );
  }
}
