import 'package:diary/core/functions.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:diary/model/diary_cell_settings.dart';
import 'package:flutter/material.dart';

class DiaryCellWidget extends StatelessWidget {
  const DiaryCellWidget({
    super.key,
    required this.contentWidget,
    required this.onTap,
    required this.backgroundColor,
    required this.settings, //alignment and others? Just settings
  });

  final Widget contentWidget;
  final VoidCallback onTap;
  final Color backgroundColor;
  final DiaryCellSettings settings;

  factory DiaryCellWidget.common({
    required String content,
    required VoidCallback onTap,
    required DiaryCellSettings settings,
  }) =>
      DiaryCellWidget(
        settings: settings,
        contentWidget: Text(content),
        onTap: onTap,
        backgroundColor: Colors.white, //Цвет будет где-то храниться
      );

  factory DiaryCellWidget.model({
    required DiaryCell diaryCell,
    required VoidCallback onTap,
    required bool isSelected,
    required DiaryCellSettings settings,
  }) {
    return isSelected
        ? DiaryCellWidget.selected(
            settings: settings,
            content: diaryCell.content.toString(),
            onTap: onTap,
          )
        : DiaryCellWidget.common(
            settings: settings,
            content: diaryCell.content.toString(),
            onTap: onTap,
          );
  }

  factory DiaryCellWidget.selected({
    required String content,
    required VoidCallback onTap,
    required DiaryCellSettings settings,
  }) =>
      DiaryCellWidget(
        settings: settings,
        contentWidget: Text(content),
        onTap: onTap,
        backgroundColor: Colors.blueAccent, //Цвет будет где-то храниться
      );

  @override
  Widget build(BuildContext context) {
    //По-хорошему нужны все параметры, которые будут редактироваться
    return Card(
      child: InkWell(
        onTap: onTap, //добавить onDoubleTap, onLongPress
        child: Container( // Весь контейнер вынести в отдельный виджет
          constraints: const BoxConstraints(
            maxWidth: 100,
            maxHeight: 20,
            minWidth: 10,
          ),
          alignment: converterAlignmentFromAlignmentsEnum(settings.alignment),
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
