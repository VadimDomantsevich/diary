// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_cell.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DiaryCell _$$_DiaryCellFromJson(Map<String, dynamic> json) => _$_DiaryCell(
      columnName: json['columnName'] as String,
      columnPosition: json['columnPosition'] as int,
      day: json['day'] as int,
      content: json['content'] as String,
      settings:
          DiaryCellSettings.fromJson(json['settings'] as Map<String, dynamic>),
      textSettings: DiaryCellTextSettings.fromJson(
          json['textSettings'] as Map<String, dynamic>),
      capitalColumnPosition: json['capitalColumnPosition'] as int,
    );

Map<String, dynamic> _$$_DiaryCellToJson(_$_DiaryCell instance) =>
    <String, dynamic>{
      'columnName': instance.columnName,
      'columnPosition': instance.columnPosition,
      'day': instance.day,
      'content': instance.content,
      'capitalColumnPosition': instance.capitalColumnPosition,
    };
