import 'package:diary/core/extentions.dart';
import 'package:diary/diary_list_screen/diary_cell_content_widget.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:diary/model/diary_column.dart';
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
    required this.width,
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
  final double width;

  factory DiaryCellWidget.common({
    required Alignment alignment,
    required VoidCallback onTap,
    required GlobalObjectKey cellKey,
    required double height,
    required double width,
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
        backgroundColor: backgroundColor,
        height: height,
        width: width,
        scaleFactor: scaleFactor,
        border: border,
        shadowColor: Colors.transparent,
      );

  factory DiaryCellWidget.model({
    required DiaryCell diaryCell,
    required DiaryColumn diaryColumn,
    required VoidCallback onTap,
    required bool isFirstSelected,
    required bool isSelected,
    required GlobalObjectKey cellKey,
    Function(DragUpdateDetails)? onPanUpdate,
    required double height,
    required double scaleFactor,
    required Border border,
  }) {
    final width =
        diaryColumn.settings.width[diaryCell.columnPosition - 1];
    return isFirstSelected
        ? DiaryCellWidget.firstSelected(
            alignment: diaryCell.textSettings.alignment.toAlignment(),
            onTap: onTap,
            cellKey: cellKey,
            onPanUpdate: onPanUpdate!,
            height: height,
            width: width,
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
                width: width,
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
                width: width,
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
    required double width,
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
        backgroundColor: backgroundColor,
        height: height,
        width: width,
        scaleFactor: scaleFactor,
        border: border,
        shadowColor: const Color.fromARGB(70, 68, 137, 255), //const value
      );

  factory DiaryCellWidget.firstSelected({
    required Alignment alignment,
    required VoidCallback onTap,
    required GlobalObjectKey cellKey,
    required Function(DragUpdateDetails) onPanUpdate,
    required double height,
    required double width,
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
        width: width,
        scaleFactor: scaleFactor,
        border: border,
        shadowColor: Color.fromARGB(70, 68, 137, 255), //const value
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onPanUpdate: onPanUpdate,
      child: Stack(
        children: [
          Container(
            key: cellKey,
            height: height,
            width: width,
            alignment: alignment,
            decoration: BoxDecoration(
              border: border,
              color: backgroundColor,
            ),
            child: contentWidget,
          ),
          Positioned(
            child: Container(
              height: height,
              width: width,
              color: shadowColor,
            ),
          ),
        ],
      ),
    );
  }
}
