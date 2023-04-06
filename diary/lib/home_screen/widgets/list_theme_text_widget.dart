import 'package:diary/core/constants/constants.dart';
import 'package:diary/core/extentions.dart';
import 'package:flutter/material.dart';

class ListThemeTextWidget extends StatelessWidget {
  const ListThemeTextWidget({
    super.key,
    required this.content,
    required this.color,
    required this.fontSize,
  });

  final String content;
  final Color color;
  final double fontSize;

  factory ListThemeTextWidget.name({
    required String content,
  }) =>
      ListThemeTextWidget(
        content: content,
        color: Constants.listThemeTextWidgetNameColor.toColor(),
        fontSize: Constants.listThemeTextWidgetNameFontSize,
      );

  factory ListThemeTextWidget.description({
    required String content,
  }) =>
      ListThemeTextWidget(
        content: content,
        color: Constants.listThemeTextWidgetDescriptionColor.toColor(),
        fontSize: Constants.listThemeTextWidgetDescriptionFontSize,
      );

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}
