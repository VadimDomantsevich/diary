import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/core/constants/constants.dart';
import 'package:diary/core/constants/diary_cell_settings_fields.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_cell_settings.freezed.dart';
part 'diary_cell_settings.g.dart';

@freezed
class DiaryCellSettings with _$DiaryCellSettings {
  const factory DiaryCellSettings({
    required String topBorderColor,
    required double topBorderWidth,
    required String leftBorderColor,
    required double leftBorderWidth,
    required String rightBorderColor,
    required double rightBorderWidth,
    required String bottomBorderColor,
    required double bottomBorderWidth,
    required double height,
    required String backgroundColor,
  }) = _DiaryCellSettings;

  factory DiaryCellSettings.fromJson(Map<String, dynamic> json) =>
      _$DiaryCellSettingsFromJson(json);

  factory DiaryCellSettings.fromFirestore({
    required DocumentSnapshot doc,
    DiaryCellSettings? defaultSettings,
  }) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    if (doc.id == Constants.cellsDefaultSettingsDocName) {
      return DiaryCellSettings.fromJson(data);
    } else {
      String topBorderColor = defaultSettings!.topBorderColor;
      double topBorderWidth = defaultSettings.topBorderWidth;
      String leftBorderColor = defaultSettings.leftBorderColor;
      double leftBorderWidth = defaultSettings.leftBorderWidth;
      String rightBorderColor = defaultSettings.rightBorderColor;
      double rightBorderWidth = defaultSettings.rightBorderWidth;
      String bottomBorderColor = defaultSettings.bottomBorderColor;
      double bottomBorderWidth = defaultSettings.bottomBorderWidth;
      double height = defaultSettings.height;
      String backgroundColor = defaultSettings.backgroundColor;
      
      data[DiaryCellSettingsFields.topBorderColor] != null
          ? topBorderColor = data[DiaryCellSettingsFields.topBorderColor]
          : topBorderColor;
      data[DiaryCellSettingsFields.topBorderWidth] != null
          ? topBorderWidth = data[DiaryCellSettingsFields.topBorderWidth]
          : topBorderWidth;
      data[DiaryCellSettingsFields.leftBorderColor] != null
          ? leftBorderColor = data[DiaryCellSettingsFields.leftBorderColor]
          : leftBorderColor;
      data[DiaryCellSettingsFields.leftBorderWidth] != null
          ? leftBorderWidth = data[DiaryCellSettingsFields.leftBorderWidth]
          : leftBorderWidth;
      data[DiaryCellSettingsFields.rightBorderColor] != null
          ? rightBorderColor = data[DiaryCellSettingsFields.rightBorderColor]
          : rightBorderColor;
      data[DiaryCellSettingsFields.rightBorderWidth] != null
          ? rightBorderWidth = data[DiaryCellSettingsFields.rightBorderWidth]
          : rightBorderWidth;
      data[DiaryCellSettingsFields.bottomBorderColor] != null
          ? bottomBorderColor = data[DiaryCellSettingsFields.bottomBorderColor]
          : bottomBorderColor;
      data[DiaryCellSettingsFields.bottomBorderWidth] != null
          ? bottomBorderWidth = data[DiaryCellSettingsFields.bottomBorderWidth]
          : bottomBorderWidth;
      data[DiaryCellSettingsFields.height] != null
          ? height = data[DiaryCellSettingsFields.height]
          : height;
      data[DiaryCellSettingsFields.backgroundColor] != null
          ? backgroundColor = data[DiaryCellSettingsFields.backgroundColor]
          : backgroundColor;
      return DiaryCellSettings(
        topBorderColor: topBorderColor,
        topBorderWidth: topBorderWidth,
        leftBorderColor: leftBorderColor,
        leftBorderWidth: leftBorderWidth,
        rightBorderColor: rightBorderColor,
        rightBorderWidth: rightBorderWidth,
        bottomBorderColor: bottomBorderColor,
        bottomBorderWidth: bottomBorderWidth,
        height: height,
        backgroundColor: backgroundColor,
      );
    }
  }
}
