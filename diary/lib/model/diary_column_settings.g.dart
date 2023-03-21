// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_column_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DiaryColumnSettings _$$_DiaryColumnSettingsFromJson(
        Map<String, dynamic> json) =>
    _$_DiaryColumnSettings(
      width: (json['width'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      capitalCellBorderWidth:
          (json['capitalCellBorderWidth'] as num).toDouble(),
      capitalCellBorderColor: json['capitalCellBorderColor'] as String,
      capitalCellHeight: (json['capitalCellHeight'] as num).toDouble(),
      capitalCellBackgroundColor: json['capitalCellBackgroundColor'] as String,
      capitalCellAlignment:
          $enumDecode(_$AlignmentsEnumEnumMap, json['capitalCellAlignment']),
      capitalCellFontWeight:
          $enumDecode(_$FontWeightEnumEnumMap, json['capitalCellFontWeight']),
      capitalCellTextDecoration: $enumDecode(
          _$TextDecorationEnumEnumMap, json['capitalCellTextDecoration']),
      capitalCellFontStyle:
          $enumDecode(_$FontStyleEnumEnumMap, json['capitalCellFontStyle']),
      capitalCellFontSize: (json['capitalCellFontSize'] as num).toDouble(),
      capitalCellTextColor: json['capitalCellTextColor'] as String,
    );

Map<String, dynamic> _$$_DiaryColumnSettingsToJson(
        _$_DiaryColumnSettings instance) =>
    <String, dynamic>{
      'width': instance.width,
      'capitalCellBorderWidth': instance.capitalCellBorderWidth,
      'capitalCellBorderColor': instance.capitalCellBorderColor,
      'capitalCellHeight': instance.capitalCellHeight,
      'capitalCellBackgroundColor': instance.capitalCellBackgroundColor,
      'capitalCellAlignment':
          _$AlignmentsEnumEnumMap[instance.capitalCellAlignment]!,
      'capitalCellFontWeight':
          _$FontWeightEnumEnumMap[instance.capitalCellFontWeight]!,
      'capitalCellTextDecoration':
          _$TextDecorationEnumEnumMap[instance.capitalCellTextDecoration]!,
      'capitalCellFontStyle':
          _$FontStyleEnumEnumMap[instance.capitalCellFontStyle]!,
      'capitalCellFontSize': instance.capitalCellFontSize,
      'capitalCellTextColor': instance.capitalCellTextColor,
    };

const _$AlignmentsEnumEnumMap = {
  AlignmentsEnum.bottomCenter: 'bottomCenter',
  AlignmentsEnum.bottomLeft: 'bottomLeft',
  AlignmentsEnum.bottomRight: 'bottomRight',
  AlignmentsEnum.center: 'center',
  AlignmentsEnum.centerLeft: 'centerLeft',
  AlignmentsEnum.centerRight: 'centerRight',
  AlignmentsEnum.topCenter: 'topCenter',
  AlignmentsEnum.topLeft: 'topLeft',
  AlignmentsEnum.topRight: 'topRight',
};

const _$FontWeightEnumEnumMap = {
  FontWeightEnum.bold: 'bold',
  FontWeightEnum.normal: 'normal',
};

const _$TextDecorationEnumEnumMap = {
  TextDecorationEnum.lineThrough: 'lineThrough',
  TextDecorationEnum.underline: 'underline',
  TextDecorationEnum.none: 'none',
};

const _$FontStyleEnumEnumMap = {
  FontStyleEnum.italic: 'italic',
  FontStyleEnum.normal: 'normal',
};
