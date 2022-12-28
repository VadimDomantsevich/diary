import 'package:diary/core/functions.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:flutter/material.dart';

class DiaryCellWidget extends StatelessWidget {
  const DiaryCellWidget({
    super.key,
    required this.contentWidget,
    required this.onTap,
    required this.backgroundColor,
    required this.alignment,
    required this.cellKey,
    this.onPanUpdate,
    required this.height,
  });

  final Widget contentWidget;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Alignment alignment;
  final GlobalObjectKey cellKey;
  final Function(DragUpdateDetails)? onPanUpdate;
  final double height;

  factory DiaryCellWidget.common({
    required Alignment alignment,
    required String content,
    required VoidCallback onTap,
    required GlobalObjectKey cellKey,
    required double height,
  }) =>
      DiaryCellWidget(
        cellKey: cellKey,
        alignment: alignment,
        contentWidget: Text(content),
        onTap: onTap,
        backgroundColor: Colors.white, //Цвет будет где-то храниться
        height: height,
      );

  factory DiaryCellWidget.model({
    required DiaryCell diaryCell,
    required VoidCallback onTap,
    required bool isSelected,
    required GlobalObjectKey cellKey,
    Function(DragUpdateDetails)? onPanUpdate,
    required double height,
  }) {
    return isSelected
        ? DiaryCellWidget.selected(
            cellKey: cellKey,
            alignment: converterAlignmentFromAlignmentsEnum(
                diaryCell.settings.alignment),
            content: diaryCell.content.toString(),
            onTap: onTap,
            onPanUpdate: (p0) => onPanUpdate!(p0),
            height: height,
          )
        : DiaryCellWidget.common(
            cellKey: cellKey,
            alignment: converterAlignmentFromAlignmentsEnum(
                diaryCell.settings.alignment),
            content: diaryCell.content.toString(),
            onTap: onTap,
            height: height,
            //onPanUpdate: (p0) => onPanUpdate(p0),
          );
  }

  factory DiaryCellWidget.selected({
    required Alignment alignment,
    required String content,
    required VoidCallback onTap,
    required GlobalObjectKey cellKey,
    required Function(DragUpdateDetails) onPanUpdate,
    required double height,
  }) =>
      DiaryCellWidget(
        cellKey: cellKey,
        alignment: alignment,
        contentWidget: Text(content),
        onTap: onTap,
        onPanUpdate: (p0) => onPanUpdate(p0),
        backgroundColor: Colors.blueAccent, //Цвет будет где-то храниться
        height: height,
      );

  @override
  Widget build(BuildContext context) {
    //По-хорошему нужны все параметры, которые будут редактироваться
    return Card(
      key: cellKey, //GlobalObjectKey to get cell position
      child: GestureDetector(
        //Попробую заменить InkWell на GestureDetector
        onTap: onTap, //добавить onDoubleTap, onLongPress
        onPanUpdate:
            onPanUpdate != null ? (details) => onPanUpdate!(details) : null,
        child: Container(
          height: height,
          // Весь контейнер вынести в отдельный виджет
          // constraints: const BoxConstraints(
          //   maxWidth: 100,
          //   maxHeight: 20,
          //   minWidth: 10,
          // ),
          alignment: alignment,
          //height: 20, //Should depend on content
          //width: 40, //ColumnWidth
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(2)),
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
