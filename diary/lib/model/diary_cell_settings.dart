import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:diary/core/constants/constants.dart';
import 'package:diary/core/constants/diary_cell_settings_fields.dart';
import 'package:diary/core/constants/enums.dart';

part 'diary_cell_settings.g.dart';

@CopyWith()
class DiaryCellSettings {
  final AlignmentsEnum alignment;
  final String topBorderColor;
  final double topBorderWidth;
  final String leftBorderColor;
  final double leftBorderWidth;
  final String rightBorderColor;
  final double rightBorderWidth;
  final String bottomBorderColor;
  final double bottomBorderWidth;
  final double height;

  DiaryCellSettings({
    required this.alignment,
    required this.topBorderColor,
    required this.topBorderWidth,
    required this.leftBorderColor,
    required this.leftBorderWidth,
    required this.rightBorderColor,
    required this.rightBorderWidth,
    required this.bottomBorderColor,
    required this.bottomBorderWidth,
    required this.height,
  });

  Map<String, dynamic> toFirestore() => {
        DiaryCellSettingsFields.alignment: alignment.name,
        DiaryCellSettingsFields.topBorderColor: topBorderColor,
        DiaryCellSettingsFields.topBorderWidth: topBorderWidth,
        DiaryCellSettingsFields.leftBorderColor: leftBorderColor,
        DiaryCellSettingsFields.leftBorderWidth: leftBorderWidth,
        DiaryCellSettingsFields.rightBorderColor: rightBorderColor,
        DiaryCellSettingsFields.rightBorderWidth: rightBorderWidth,
        DiaryCellSettingsFields.bottomBorderColor: bottomBorderColor,
        DiaryCellSettingsFields.bottomBorderWidth: bottomBorderWidth,
        DiaryCellSettingsFields.height: height,
      };

  factory DiaryCellSettings.fromFirestore({
    required DocumentSnapshot doc,
    DiaryCellSettings? defaultSettings,
  }) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    if (doc.id == Constants.cellsDefaultSettingsDocName) {
      return DiaryCellSettings(
        alignment: AlignmentsEnum.values.firstWhere((element) =>
            element.name == data[DiaryCellSettingsFields.alignment]),
        topBorderColor: data[DiaryCellSettingsFields.topBorderColor] as String,
        topBorderWidth: data[DiaryCellSettingsFields.topBorderWidth] as double,
        leftBorderColor:
            data[DiaryCellSettingsFields.leftBorderColor] as String,
        leftBorderWidth:
            data[DiaryCellSettingsFields.leftBorderWidth] as double,
        rightBorderColor:
            data[DiaryCellSettingsFields.rightBorderColor] as String,
        rightBorderWidth:
            data[DiaryCellSettingsFields.rightBorderWidth] as double,
        bottomBorderColor:
            data[DiaryCellSettingsFields.bottomBorderColor] as String,
        bottomBorderWidth:
            data[DiaryCellSettingsFields.bottomBorderWidth] as double,
        height: data[DiaryCellSettingsFields.height] as double,
      );
    } else {
      AlignmentsEnum alignment = defaultSettings!.alignment;
      String topBorderColor = defaultSettings.topBorderColor;
      double topBorderWidth = defaultSettings.topBorderWidth;
      String leftBorderColor = defaultSettings.leftBorderColor;
      double leftBorderWidth = defaultSettings.leftBorderWidth;
      String rightBorderColor = defaultSettings.rightBorderColor;
      double rightBorderWidth = defaultSettings.rightBorderWidth;
      String bottomBorderColor = defaultSettings.bottomBorderColor;
      double bottomBorderWidth = defaultSettings.bottomBorderWidth;
      double height = defaultSettings.height;
      data[DiaryCellSettingsFields.alignment] != null
          ? alignment = AlignmentsEnum.values.firstWhere(
              (element) =>
                  element.name == data[DiaryCellSettingsFields.alignment],
            )
          : alignment;
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
      return DiaryCellSettings(
        alignment: alignment,
        topBorderColor: topBorderColor,
        topBorderWidth: topBorderWidth,
        leftBorderColor: leftBorderColor,
        leftBorderWidth: leftBorderWidth,
        rightBorderColor: rightBorderColor,
        rightBorderWidth: rightBorderWidth,
        bottomBorderColor: bottomBorderColor,
        bottomBorderWidth: bottomBorderWidth,
        height: height,
      );
    }
  }
}
