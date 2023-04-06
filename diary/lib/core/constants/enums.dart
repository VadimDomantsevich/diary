import 'package:flutter/material.dart';

enum AlignmentsEnum {
  bottomCenter(Alignment.bottomCenter),
  bottomLeft(Alignment.bottomLeft),
  bottomRight(Alignment.bottomRight),
  center(Alignment.center),
  centerLeft(Alignment.centerLeft),
  centerRight(Alignment.centerRight),
  topCenter(Alignment.topCenter),
  topLeft(Alignment.topLeft),
  topRight(Alignment.topRight);

  const AlignmentsEnum(
    this.alignment,
  );

  final Alignment alignment;

  static AlignmentsEnum getAlignmentsEnumByName(String title) =>
      AlignmentsEnum.values.firstWhere((element) => element.name == title);
}

enum HorizontalAlignmentsEnum {
  left,
  center,
  right,
}

enum VerticalAlignmentsEnum {
  top,
  center,
  bottom,
}

enum FontWeightEnum {
  bold,
  normal,
}

enum FontStyleEnum {
  italic,
  normal,
}

enum TextDecorationEnum {
  lineThrough,
  underline,
  none,
}

enum MainColorsEnum {
  black,
  red,
  orange,
  yellow,
  green,
  blue,
  purple,
}

enum ColorEditingEnum {
  text,
  fill,
  border,
}

enum BordersEditingEnum {
  all,
  outer,
  inner,
  vertical,
  horizontal,
  left,
  right,
  top,
  bottom,
  clear,
  none,
}

enum BordersStyleEnum {
  thin,
  medium,
  thick,
}

enum ThemeColorsEnum {
  themeColor,
  themeBorderColor,
  themePanelBackgroundColor,
}
