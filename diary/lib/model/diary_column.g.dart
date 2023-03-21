// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_column.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DiaryColumn _$$_DiaryColumnFromJson(Map<String, dynamic> json) =>
    _$_DiaryColumn(
      id: json['id'] as String,
      name: json['name'] as String,
      columnsCount: json['columnsCount'] as int,
      creationTime: DateTime.parse(json['creationTime'] as String),
      settings: DiaryColumnSettings.fromJson(
          json['settings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DiaryColumnToJson(_$_DiaryColumn instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'columnsCount': instance.columnsCount,
      'creationTime': instance.creationTime.toIso8601String(),
    };
