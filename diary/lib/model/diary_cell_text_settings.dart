import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:diary/core/constants/constants.dart';
import 'package:diary/core/constants/diary_cell_text_settings.dart';
import 'package:diary/core/constants/enums.dart';

part 'diary_cell_text_settings.g.dart';

@CopyWith()
class DiaryCellTextSettings {
  final AlignmentsEnum alignment;
  final FontWeightEnum fontWeight;
  final TextDecorationEnum textDecoration;
  final FontStyleEnum fontStyle;
  final double fontSize;
  final String color;

  DiaryCellTextSettings({
    required this.alignment,
    required this.fontWeight,
    required this.textDecoration,
    required this.fontStyle,
    required this.fontSize,
    required this.color,
  });

  Map<String, dynamic> toFirestore() => {
        DiaryCellTextSettingsFields.alignment: alignment.name,
        DiaryCellTextSettingsFields.fontWeight: fontWeight.name,
        DiaryCellTextSettingsFields.textDecoration: textDecoration.name,
        DiaryCellTextSettingsFields.fontStyle: fontStyle.name,
        DiaryCellTextSettingsFields.fontSize: fontSize,
        DiaryCellTextSettingsFields.color: color,
      };

  factory DiaryCellTextSettings.fromFirestore({
    required DocumentSnapshot doc,
    DiaryCellTextSettings? defaultSettings,
  }) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    if (doc.id == Constants.cellsDefaultSettingsDocName) {
      return DiaryCellTextSettings(
        alignment: AlignmentsEnum.values.firstWhere((element) =>
            element.name == data[DiaryCellTextSettingsFields.alignment]),
        fontWeight: FontWeightEnum.values.firstWhere((element) =>
            element.name == data[DiaryCellTextSettingsFields.fontWeight]),
        textDecoration: TextDecorationEnum.values.firstWhere((element) =>
            element.name == data[DiaryCellTextSettingsFields.textDecoration]),
        fontStyle: FontStyleEnum.values.firstWhere((element) =>
            element.name == data[DiaryCellTextSettingsFields.fontStyle]),
        fontSize: data[DiaryCellTextSettingsFields.fontSize] as double,
        color: data[DiaryCellTextSettingsFields.color] as String,
      );
    } else {
      AlignmentsEnum alignment = defaultSettings!.alignment;
      FontWeightEnum fontWeight = defaultSettings.fontWeight;
      TextDecorationEnum textDecoration = defaultSettings.textDecoration;
      FontStyleEnum fontStyle = defaultSettings.fontStyle;
      double fontSize = defaultSettings.fontSize;
      String color = defaultSettings.color;
      data[DiaryCellTextSettingsFields.alignment] != null
          ? alignment = AlignmentsEnum.values.firstWhere(
              (element) =>
                  element.name == data[DiaryCellTextSettingsFields.alignment],
            )
          : alignment;
      data[DiaryCellTextSettingsFields.fontWeight] != null
          ? fontWeight = FontWeightEnum.values.firstWhere((element) =>
              element.name == data[DiaryCellTextSettingsFields.fontWeight])
          : fontWeight;
      data[DiaryCellTextSettingsFields.textDecoration] != null
          ? textDecoration = TextDecorationEnum.values.firstWhere((element) =>
              element.name == data[DiaryCellTextSettingsFields.textDecoration])
          : textDecoration;
      data[DiaryCellTextSettingsFields.fontStyle] != null
          ? fontStyle = FontStyleEnum.values.firstWhere((element) =>
              element.name == data[DiaryCellTextSettingsFields.fontStyle])
          : fontStyle;
      data[DiaryCellTextSettingsFields.fontSize] != null
          ? fontSize = data[DiaryCellTextSettingsFields.fontSize]
          : fontSize;
      data[DiaryCellTextSettingsFields.color] != null
          ? color = data[DiaryCellTextSettingsFields.color]
          : color;

      return DiaryCellTextSettings(
        alignment: alignment,
        fontWeight: fontWeight,
        textDecoration: textDecoration,
        fontStyle: fontStyle,
        fontSize: fontSize,
        color: color,
      );
    }
  }
}
