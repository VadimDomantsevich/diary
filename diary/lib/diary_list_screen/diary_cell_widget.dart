import 'package:diary/core/extentions.dart';
import 'package:diary/diary_list_screen/diary_cell_content_widget.dart';
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
    required this.scaleFactor,
    required this.border,
    required this.shadowColor,
  });

  final Widget contentWidget;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Alignment alignment;
  final GlobalObjectKey cellKey;
  final Function(DragUpdateDetails)? onPanUpdate;
  final double height;
  final double scaleFactor;
  final Border border;
  final Color shadowColor;

  factory DiaryCellWidget.common({
    required Alignment alignment,
    required VoidCallback onTap,
    required GlobalObjectKey cellKey,
    required double height,
    required double scaleFactor,
    required Border border,
    required Widget contentWidget,
    required Color backgroundColor,
  }) =>
      DiaryCellWidget(
        cellKey: cellKey,
        alignment: alignment,
        contentWidget: contentWidget,
        onTap: onTap,
        backgroundColor: backgroundColor, //Цвет будет где-то храниться
        height: height,
        scaleFactor: scaleFactor,
        border: border,
        shadowColor: Colors.transparent,
      );

  factory DiaryCellWidget.model({
    required DiaryCell diaryCell,
    required VoidCallback onTap,
    required bool isFirstSelected,
    required bool isSelected,
    required GlobalObjectKey cellKey,
    Function(DragUpdateDetails)? onPanUpdate,
    required double height,
    required double scaleFactor,
    required Border border,
  }) {
    return isFirstSelected
        ? DiaryCellWidget.firstSelected(
            alignment: diaryCell.textSettings.alignment.toAlignment(),
            onTap: onTap,
            cellKey: cellKey,
            onPanUpdate: onPanUpdate!,
            height: height,
            scaleFactor: scaleFactor,
            border: border,
            contentWidget: DiaryCellContentWidget.model(diaryCell: diaryCell),
            backgroundColor: diaryCell.settings.backgroundColor.toColor(),
          )
        : isSelected
            ? DiaryCellWidget.selected(
                cellKey: cellKey,
                alignment: diaryCell.textSettings.alignment.toAlignment(),
                onTap: onTap,
                height: height,
                scaleFactor: scaleFactor,
                border: border,
                contentWidget:
                    DiaryCellContentWidget.model(diaryCell: diaryCell),
                backgroundColor: diaryCell.settings.backgroundColor.toColor(),
              )
            : DiaryCellWidget.common(
                cellKey: cellKey,
                alignment: diaryCell.textSettings.alignment.toAlignment(),
                onTap: onTap,
                height: height,
                scaleFactor: scaleFactor,
                border: border,
                contentWidget:
                    DiaryCellContentWidget.model(diaryCell: diaryCell),
                backgroundColor: diaryCell.settings.backgroundColor.toColor(),
              );
  }

  factory DiaryCellWidget.selected({
    required Alignment alignment,
    required VoidCallback onTap,
    required GlobalObjectKey cellKey,
    required double height,
    required double scaleFactor,
    required Border border,
    required Widget contentWidget,
    required Color backgroundColor,
  }) =>
      DiaryCellWidget(
        cellKey: cellKey,
        alignment: alignment,
        contentWidget: contentWidget,
        onTap: onTap,
        backgroundColor: backgroundColor, //Цвет будет где-то храниться
        height: height,
        scaleFactor: scaleFactor,
        border: border,
        shadowColor: const Color.fromARGB(70, 68, 137, 255),//от темы зависит
      );

  factory DiaryCellWidget.firstSelected({
    required Alignment alignment,
    required VoidCallback onTap,
    required GlobalObjectKey cellKey,
    required Function(DragUpdateDetails) onPanUpdate,
    required double height,
    required double scaleFactor,
    required Border border,
    required Widget contentWidget,
    required Color backgroundColor,
  }) =>
      DiaryCellWidget(
        contentWidget: contentWidget,
        onTap: onTap,
        onPanUpdate: onPanUpdate,
        backgroundColor: backgroundColor,
        alignment: alignment,
        cellKey: cellKey,
        height: height,
        scaleFactor: scaleFactor,
        border: border,
        shadowColor: Color.fromARGB(70, 68, 137, 255),//от темы зависит
      );

  @override
  Widget build(BuildContext context) {
    //По-хорошему нужны все параметры, которые будут редактироваться
    return GestureDetector(
      onTap: onTap,
      onPanUpdate: onPanUpdate,
      child: Stack(
        children: [
          Container(
            key: cellKey,
            height: height,
            alignment: alignment,
            decoration: BoxDecoration(
              border: border,
              color: backgroundColor,
              //borderRadius: const BorderRadius.all(Radius.circular(2)),
            ),
            child: contentWidget,
          ),
          Positioned(
            child: Container(
              height: height,
              width: 300, //need to be in settings
              color: shadowColor,
            ),
          ),
        ],
      ),
    );
  }
}
