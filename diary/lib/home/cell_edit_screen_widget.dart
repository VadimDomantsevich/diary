import 'package:diary/diary_list_screen/diary_cell_widget.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:flutter/material.dart';

class CellEditScreenWidget extends StatelessWidget {
  const CellEditScreenWidget({
    super.key,
    required this.diaryCell,
  });

  final DiaryCell diaryCell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Flexible(child: FractionallySizedBox(heightFactor: 0.3,child: DiaryCellWidget.common(content: diaryCell.content, onTap: (){}, settings: settings),))
            // Container(),
          ],
        ),
      ),
    );
  }
}
