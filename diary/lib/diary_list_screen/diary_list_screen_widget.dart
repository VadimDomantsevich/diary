import 'package:diary/model/diary_cell.dart';
import 'package:diary/model/diary_column.dart';
import 'package:diary/model/diary_list.dart';
import 'package:flutter/material.dart';

class DiaryListScreenWidget extends StatelessWidget {
  const DiaryListScreenWidget({
    super.key,
    required this.diaryList,
    required this.diaryColumns,
    required this.diaryCells,
  });

  final DiaryList diaryList;
  final List<DiaryColumn> diaryColumns;
  final List<DiaryCell> diaryCells;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
