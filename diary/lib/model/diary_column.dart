import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/core/constants/diary_column_fields.dart';
import 'package:diary/model/diary_column_settings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_column.freezed.dart';
part 'diary_column.g.dart';

@freezed
class DiaryColumn with _$DiaryColumn {
  const factory DiaryColumn({
    required String id,
    required String name,
    required int columnsCount,
    required DateTime creationTime,
    @JsonKey(includeToJson: false) required DiaryColumnSettings settings,
  }) = _DiaryColumn;

  factory DiaryColumn.fromJson(Map<String, dynamic> json) =>
      _$DiaryColumnFromJson(json);

  factory DiaryColumn.fromFirestore({
    required DocumentSnapshot doc,
    required DiaryColumnSettings defaultSettings,
  }) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return DiaryColumn(
      id: data[DiaryColumnFields.id]! as String,
      name: data[DiaryColumnFields.name]! as String,
      columnsCount: data[DiaryColumnFields.columnsCount]! as int,
      creationTime:
          DateTime.parse(data[DiaryColumnFields.creationTime]! as String),
      settings: DiaryColumnSettings.fromFirestore(
        doc: doc,
        defaultSettings: defaultSettings,
      ),
    );
  }
}
