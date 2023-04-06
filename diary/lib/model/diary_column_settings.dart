import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/core/constants/constants.dart';
import 'package:diary/core/constants/diary_column_settings_fields.dart';
import 'package:diary/core/constants/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_column_settings.freezed.dart';
part 'diary_column_settings.g.dart';

@freezed
class DiaryColumnSettings with _$DiaryColumnSettings {
  const factory DiaryColumnSettings({
    required List<double> width,
    required double capitalCellBorderWidth,
    required String capitalCellBorderColor,
    required double capitalCellHeight,
    required String capitalCellBackgroundColor,
    required AlignmentsEnum capitalCellAlignment,
    required FontWeightEnum capitalCellFontWeight,
    required TextDecorationEnum capitalCellTextDecoration,
    required FontStyleEnum capitalCellFontStyle,
    required double capitalCellFontSize,
    required String capitalCellTextColor,
  }) = _DiaryColumnSettings;

  factory DiaryColumnSettings.fromJson(Map<String, dynamic> json) =>
      _$DiaryColumnSettingsFromJson(json);

  factory DiaryColumnSettings.fromFirestore({
    required DocumentSnapshot doc,
    DiaryColumnSettings? defaultSettings,
  }) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    if (doc.id == Constants.columnsDefaultSettingsDocName) {
      return DiaryColumnSettings.fromJson(data);
    } else {
      List<double> width = defaultSettings!.width;
      double capitalCellBorderWidth = defaultSettings.capitalCellBorderWidth;
      String capitalCellBorderColor = defaultSettings.capitalCellBorderColor;
      double capitalCellHeight = defaultSettings.capitalCellHeight;
      String capitalCellBackgroundColor =
          defaultSettings.capitalCellBackgroundColor;
      AlignmentsEnum capitalCellAlignment =
          defaultSettings.capitalCellAlignment;
      FontWeightEnum capitalCellFontWeight =
          defaultSettings.capitalCellFontWeight;
      TextDecorationEnum capitalCellTextDecoration =
          defaultSettings.capitalCellTextDecoration;
      FontStyleEnum capitalCellFontStyle = defaultSettings.capitalCellFontStyle;
      double capitalCellFontSize = defaultSettings.capitalCellFontSize;
      String capitalCellTextColor = defaultSettings.capitalCellTextColor;
      data[DiaryColumnSettingsFields.width] != null
          ? width = List<double>.from(data[DiaryColumnSettingsFields.width])
          : width;
      data[DiaryColumnSettingsFields.capitalCellBorderWidth] != null
          ? capitalCellBorderWidth =
              data[DiaryColumnSettingsFields.capitalCellBorderWidth]
          : capitalCellBorderWidth;
      data[DiaryColumnSettingsFields.capitalCellBorderColor] != null
          ? capitalCellBorderColor =
              data[DiaryColumnSettingsFields.capitalCellBorderColor]
          : capitalCellBorderColor;
      data[DiaryColumnSettingsFields.capitalCellHeight] != null
          ? capitalCellHeight =
              data[DiaryColumnSettingsFields.capitalCellHeight]
          : capitalCellHeight;
      data[DiaryColumnSettingsFields.capitalCellBackgroundColor] != null
          ? capitalCellBackgroundColor =
              data[DiaryColumnSettingsFields.capitalCellBackgroundColor]
          : capitalCellBackgroundColor;
      data[DiaryColumnSettingsFields.capitalCellAlignment] != null
          ? capitalCellAlignment = AlignmentsEnum.values.firstWhere((element) =>
              element.name ==
              data[DiaryColumnSettingsFields.capitalCellAlignment])
          : capitalCellAlignment;
      data[DiaryColumnSettingsFields.capitalCellFontWeight] != null
          ? capitalCellFontWeight = FontWeightEnum.values.firstWhere(
              (element) =>
                  element.name ==
                  data[DiaryColumnSettingsFields.capitalCellFontWeight])
          : capitalCellFontWeight;
      data[DiaryColumnSettingsFields.capitalCellTextDecoration] != null
          ? capitalCellTextDecoration = TextDecorationEnum.values.firstWhere(
              (element) =>
                  element.name ==
                  data[DiaryColumnSettingsFields.capitalCellTextDecoration])
          : capitalCellTextDecoration;
      data[DiaryColumnSettingsFields.capitalCellFontStyle] != null
          ? capitalCellFontStyle = FontStyleEnum.values.firstWhere((element) =>
              element.name ==
              data[DiaryColumnSettingsFields.capitalCellFontStyle])
          : capitalCellFontStyle;
      data[DiaryColumnSettingsFields.capitalCellFontSize] != null
          ? capitalCellFontSize =
              data[DiaryColumnSettingsFields.capitalCellFontSize]
          : capitalCellFontSize;
      data[DiaryColumnSettingsFields.capitalCellTextColor] != null
          ? capitalCellTextColor =
              data[DiaryColumnSettingsFields.capitalCellTextColor]
          : capitalCellTextColor;
      return DiaryColumnSettings(
        width: width,
        capitalCellBorderWidth: capitalCellBorderWidth,
        capitalCellBorderColor: capitalCellBorderColor,
        capitalCellHeight: capitalCellHeight,
        capitalCellBackgroundColor: capitalCellBackgroundColor,
        capitalCellAlignment: capitalCellAlignment,
        capitalCellFontWeight: capitalCellFontWeight,
        capitalCellTextDecoration: capitalCellTextDecoration,
        capitalCellFontStyle: capitalCellFontStyle,
        capitalCellFontSize: capitalCellFontSize,
        capitalCellTextColor: capitalCellTextColor,
      );
    }
  }

  factory DiaryColumnSettings.fromFirestoreToTheme({
    required DocumentSnapshot doc,
  }) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return DiaryColumnSettings.fromJson(data);
  }
}
