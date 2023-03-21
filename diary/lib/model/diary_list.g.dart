// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DiaryList _$$_DiaryListFromJson(Map<String, dynamic> json) => _$_DiaryList(
      name: json['name'] as String,
      listDate: DateTime.parse(json['listDate'] as String),
      uid: json['uid'] as String,
      settings:
          DiaryListSettings.fromJson(json['settings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DiaryListToJson(_$_DiaryList instance) =>
    <String, dynamic>{
      'name': instance.name,
      'listDate': instance.listDate.toIso8601String(),
      'uid': instance.uid,
    };
