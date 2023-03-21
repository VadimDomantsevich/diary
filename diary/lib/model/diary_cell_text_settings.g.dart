// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_cell_text_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DiaryCellTextSettings _$$_DiaryCellTextSettingsFromJson(
        Map<String, dynamic> json) =>
    _$_DiaryCellTextSettings(
      alignment: $enumDecode(_$AlignmentsEnumEnumMap, json['alignment']),
      fontWeight: $enumDecode(_$FontWeightEnumEnumMap, json['fontWeight']),
      textDecoration:
          $enumDecode(_$TextDecorationEnumEnumMap, json['textDecoration']),
      fontStyle: $enumDecode(_$FontStyleEnumEnumMap, json['fontStyle']),
      fontSize: (json['fontSize'] as num).toDouble(),
      color: json['color'] as String,
    );

Map<String, dynamic> _$$_DiaryCellTextSettingsToJson(
        _$_DiaryCellTextSettings instance) =>
    <String, dynamic>{
      'alignment': _$AlignmentsEnumEnumMap[instance.alignment]!,
      'fontWeight': _$FontWeightEnumEnumMap[instance.fontWeight]!,
      'textDecoration': _$TextDecorationEnumEnumMap[instance.textDecoration]!,
      'fontStyle': _$FontStyleEnumEnumMap[instance.fontStyle]!,
      'fontSize': instance.fontSize,
      'color': instance.color,
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
