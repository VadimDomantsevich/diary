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
    required this.scaleFactor,
    required this.border,
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

  factory DiaryCellWidget.common({
    required Alignment alignment,
    required String content,
    required VoidCallback onTap,
    required GlobalObjectKey cellKey,
    required double height,
    required double scaleFactor,
    required Border border,
  }) =>
      DiaryCellWidget(
        cellKey: cellKey,
        alignment: alignment,
        contentWidget: Text(content),
        onTap: onTap,
        backgroundColor: Colors.white, //Цвет будет где-то храниться
        height: height,
        scaleFactor: scaleFactor,
        border: border,
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
            alignment: converterAlignmentFromAlignmentsEnum(
                diaryCell.settings.alignment),
            content: diaryCell.content.toString(),
            onTap: onTap,
            cellKey: cellKey,
            onPanUpdate: onPanUpdate!,
            height: height,
            scaleFactor: scaleFactor,
            border: border,
          )
        : isSelected
            ? DiaryCellWidget.selected(
                cellKey: cellKey,
                alignment: converterAlignmentFromAlignmentsEnum(
                    diaryCell.settings.alignment),
                content: diaryCell.content.toString(),
                onTap: onTap,
                // onPanUpdate: onPanUpdate!,
                height: height,
                scaleFactor: scaleFactor,
                border: border,
              )
            : DiaryCellWidget.common(
                cellKey: cellKey,
                alignment: converterAlignmentFromAlignmentsEnum(
                    diaryCell.settings.alignment),
                content: diaryCell.content.toString(),
                onTap: onTap,
                height: height,
                scaleFactor: scaleFactor,
                border: border,
              );
  }

  factory DiaryCellWidget.selected({
    required Alignment alignment,
    required String content,
    required VoidCallback onTap,
    required GlobalObjectKey cellKey,
    // required Function(DragUpdateDetails) onPanUpdate,
    required double height,
    required double scaleFactor,
    required Border border,
  }) =>
      DiaryCellWidget(
        cellKey: cellKey,
        alignment: alignment,
        contentWidget: Text(content),
        onTap: onTap,
        // onPanUpdate: onPanUpdate,
        backgroundColor: Color(0x314489FF), //Цвет будет где-то храниться
        height: height,
        scaleFactor: scaleFactor,
        border: border,
      );

  factory DiaryCellWidget.firstSelected({
    required Alignment alignment,
    required String content,
    required VoidCallback onTap,
    required GlobalObjectKey cellKey,
    required Function(DragUpdateDetails) onPanUpdate,
    required double height,
    required double scaleFactor,
    required Border border,
  }) =>
      DiaryCellWidget(
        contentWidget: Text(content),
        onTap: onTap,
        onPanUpdate: onPanUpdate,
        backgroundColor: Color(0x314489FF),
        alignment: alignment,
        cellKey: cellKey,
        height: height,
        scaleFactor: scaleFactor,
        border: border,
      );

  @override
  Widget build(BuildContext context) {
    //По-хорошему нужны все параметры, которые будут редактироваться
    return GestureDetector(
      onTap: onTap,
      onPanUpdate: onPanUpdate,
      child: Container(
        key: cellKey,
        height: height,
        alignment: alignment,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          //borderRadius: const BorderRadius.all(Radius.circular(2)),
        ),
        child: contentWidget,
        // child: Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 4.0),
        //   child: contentWidget,
        // ),
      ),
    );
  }
}
