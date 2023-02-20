import 'package:diary/core/extentions.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:flutter/material.dart';

class DiaryCellContentWidget extends StatelessWidget {
  const DiaryCellContentWidget({
    super.key,
    required this.content,
    required this.fontWeight,
    required this.textDecoration,
    required this.fontStyle,
    required this.fontSize,
    required this.color,
  });

  final String content;
  final FontWeight fontWeight;
  final TextDecoration textDecoration;
  final FontStyle fontStyle;
  final double fontSize;
  final Color color;

  factory DiaryCellContentWidget.model({
    required DiaryCell diaryCell,
  }) {
    return DiaryCellContentWidget(
      content: diaryCell.content.toString(),
      fontWeight: diaryCell.textSettings.fontWeight.toFontWeight(),
      textDecoration: diaryCell.textSettings.textDecoration.toTextDecoration(),
      fontStyle: diaryCell.textSettings.fontStyle.toFontStyle(),
      fontSize: diaryCell.textSettings.fontSize,
      color: diaryCell.textSettings.color.toColor(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      maxLines: 1,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        decoration: textDecoration,
        fontSize: fontSize,
      ),
    );
  }
}
