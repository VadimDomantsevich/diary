import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/core/constants/constants.dart';
import 'package:diary/core/constants/diary_cell_text_settings.dart';
import 'package:diary/core/constants/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_cell_text_settings.freezed.dart';
part 'diary_cell_text_settings.g.dart';

@freezed
class DiaryCellTextSettings with _$DiaryCellTextSettings {
  const factory DiaryCellTextSettings({
    required AlignmentsEnum alignment,
    required FontWeightEnum fontWeight,
    required TextDecorationEnum textDecoration,
    required FontStyleEnum fontStyle,
    required double fontSize,
    required String color,
  }) = _DiaryCellTextSettings;

  factory DiaryCellTextSettings.fromJson(Map<String, dynamic> json) =>
      _$DiaryCellTextSettingsFromJson(json);

  factory DiaryCellTextSettings.fromFirestore({
    required DocumentSnapshot doc,
    DiaryCellTextSettings? defaultSettings,
  }) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    if (doc.id == Constants.cellsDefaultSettingsDocName) {
      return DiaryCellTextSettings.fromJson(data);
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
