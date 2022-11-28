import 'package:diary/model/diary_cell.dart';
import 'package:flutter/material.dart';

class DiaryCellWidget extends StatelessWidget {
  const DiaryCellWidget({
    super.key,
    required this.contentWidget,
    required this.onTap,
  });

  final Widget contentWidget;
  final VoidCallback onTap;

  factory DiaryCellWidget.common({
    required String content,
    required VoidCallback onTap,
  }) =>
      DiaryCellWidget(
        contentWidget: Text(content),
        onTap: onTap,
      );

  factory DiaryCellWidget.model({
    required DiaryCell diaryCell,
    required VoidCallback onTap,
  }) =>
      DiaryCellWidget.common(
        content: diaryCell.content.toString(),
        onTap: onTap,
      );

  @override
  Widget build(BuildContext context) {
    //По-хорошему нужны все параметры, которые будут редактироваться
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 100,
            maxHeight: 20,
            minWidth: 10,
          ),
          alignment: Alignment.center,
          //height: 20, //Should depend on content
          //width: 40, //ColumnWidth
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(2)),
            //color: Color.fromARGB(255, 136, 178, 252),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: contentWidget,
          ),
        ),
      ),
    );
    //return DecoratedBox(decoration: BoxDecoration(border: Border()),);
  }
}
