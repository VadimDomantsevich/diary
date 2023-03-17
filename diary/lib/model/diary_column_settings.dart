import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:diary/core/constants/constants.dart';
import 'package:diary/core/constants/diary_column_settings_fields.dart';
import 'package:diary/core/constants/enums.dart';

part 'diary_column_settings.g.dart';

@CopyWith()
class DiaryColumnSettings {
  final List<double> width;
  final double capitalCellBorderWidth;
  final String capitalCellBorderColor;
  final double capitalCellHeight;
  final String capitalCellBackgroundColor;
  final AlignmentsEnum capitalCellAlignment;
  final FontWeightEnum capitalCellFontWeight;
  final TextDecorationEnum capitalCellTextDecoration;
  final FontStyleEnum capitalCellFontStyle;
  final double capitalCellFontSize;
  final String capitalCellTextColor;

  DiaryColumnSettings({
    required this.width,
    required this.capitalCellBorderWidth,
    required this.capitalCellBorderColor,
    required this.capitalCellHeight,
    required this.capitalCellBackgroundColor,
    required this.capitalCellAlignment,
    required this.capitalCellFontWeight,
    required this.capitalCellTextDecoration,
    required this.capitalCellFontStyle,
    required this.capitalCellFontSize,
    required this.capitalCellTextColor,
  });

  Map<String, dynamic> toFirestore() => {
        DiaryColumnSettingsFields.width: width,
        DiaryColumnSettingsFields.capitalCellBorderWidth:
            capitalCellBorderWidth,
        DiaryColumnSettingsFields.capitalCellBorderColor:
            capitalCellBorderColor,
        DiaryColumnSettingsFields.capitalCellHeight: capitalCellHeight,
        DiaryColumnSettingsFields.capitalCellBackgroundColor:
            capitalCellBackgroundColor,
        DiaryColumnSettingsFields.capitalCellAlignment:
            capitalCellAlignment.name,
        DiaryColumnSettingsFields.capitalCellFontWeight:
            capitalCellFontWeight.name,
        DiaryColumnSettingsFields.capitalCellTextDecoration:
            capitalCellTextDecoration.name,
        DiaryColumnSettingsFields.capitalCellFontStyle:
            capitalCellFontStyle.name,
        DiaryColumnSettingsFields.capitalCellFontSize: capitalCellFontSize,
        DiaryColumnSettingsFields.capitalCellTextColor: capitalCellTextColor,
      };

  factory DiaryColumnSettings.fromFirestore({
    required DocumentSnapshot doc,
    DiaryColumnSettings? defaultSettings,
  }) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    if (doc.id == Constants.columnsDefaultSettingsDocName) {
      return DiaryColumnSettings(
        width: List.from(data[DiaryColumnSettingsFields.width]),
        capitalCellBorderWidth:
            data[DiaryColumnSettingsFields.capitalCellBorderWidth] as double,
        capitalCellBorderColor:
            data[DiaryColumnSettingsFields.capitalCellBorderColor] as String,
        capitalCellHeight:
            data[DiaryColumnSettingsFields.capitalCellHeight] as double,
        capitalCellBackgroundColor:
            data[DiaryColumnSettingsFields.capitalCellBackgroundColor]
                as String,
        capitalCellAlignment: AlignmentsEnum.values.firstWhere((element) =>
            element.name ==
            data[DiaryColumnSettingsFields.capitalCellAlignment]),
        capitalCellFontWeight: FontWeightEnum.values.firstWhere((element) =>
            element.name ==
            data[DiaryColumnSettingsFields.capitalCellFontWeight]),
        capitalCellTextDecoration: TextDecorationEnum.values.firstWhere(
            (element) =>
                element.name ==
                data[DiaryColumnSettingsFields.capitalCellTextDecoration]),
        capitalCellFontStyle: FontStyleEnum.values.firstWhere((element) =>
            element.name ==
            data[DiaryColumnSettingsFields.capitalCellFontStyle]),
        capitalCellFontSize:
            data[DiaryColumnSettingsFields.capitalCellFontSize] as double,
        capitalCellTextColor:
            data[DiaryColumnSettingsFields.capitalCellTextColor] as String,
      );
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
    return DiaryColumnSettings(
      width: List.from(data[DiaryColumnSettingsFields.width]),
      capitalCellBorderWidth:
          data[DiaryColumnSettingsFields.capitalCellBorderWidth] as double,
      capitalCellBorderColor:
          data[DiaryColumnSettingsFields.capitalCellBorderColor] as String,
      capitalCellHeight:
          data[DiaryColumnSettingsFields.capitalCellHeight] as double,
      capitalCellBackgroundColor:
          data[DiaryColumnSettingsFields.capitalCellBackgroundColor] as String,
      capitalCellAlignment: AlignmentsEnum.values.firstWhere((element) =>
          element.name == data[DiaryColumnSettingsFields.capitalCellAlignment]),
      capitalCellFontWeight: FontWeightEnum.values.firstWhere((element) =>
          element.name ==
          data[DiaryColumnSettingsFields.capitalCellFontWeight]),
      capitalCellTextDecoration: TextDecorationEnum.values.firstWhere(
          (element) =>
              element.name ==
              data[DiaryColumnSettingsFields.capitalCellTextDecoration]),
      capitalCellFontStyle: FontStyleEnum.values.firstWhere((element) =>
          element.name == data[DiaryColumnSettingsFields.capitalCellFontStyle]),
      capitalCellFontSize:
          data[DiaryColumnSettingsFields.capitalCellFontSize] as double,
      capitalCellTextColor:
          data[DiaryColumnSettingsFields.capitalCellTextColor] as String,
    );
  }
}
