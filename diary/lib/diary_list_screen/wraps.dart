import 'package:diary/model/diary_cell_settings.dart';
import 'package:flutter/material.dart';

Border buildBorder(DiaryCellSettings settings) {
  return Border(
    top: BorderSide(
      color: Color(int.parse(settings.topBorderColor)),
      width: settings.topBorderWidth,
    ),
    left: BorderSide(
      color: Color(int.parse(settings.leftBorderColor)),
      width: settings.leftBorderWidth,
    ),
    right: BorderSide(
      color: Color(int.parse(settings.rightBorderColor)),
      width: settings.rightBorderWidth,
    ),
    bottom: BorderSide(
      color: Color(int.parse(settings.bottomBorderColor)),
      width: settings.bottomBorderWidth,
    ),
  );
}
