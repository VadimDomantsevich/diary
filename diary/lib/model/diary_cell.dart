import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/core/constants/diary_cell_fields.dart';
import 'package:diary/model/diary_cell_settings.dart';
import 'package:diary/model/diary_cell_text_settings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_cell.freezed.dart';
part 'diary_cell.g.dart';

@freezed
class DiaryCell extends Comparable with _$DiaryCell{
  const factory DiaryCell({
    required String columnName,
    required int columnPosition,
    required int day,
    required String content,
    @JsonKey(includeToJson: false)
    required DiaryCellSettings settings,
    @JsonKey(includeToJson: false)
    required DiaryCellTextSettings textSettings,
    required int capitalColumnPosition,
  }) = _DiaryCell;

  factory DiaryCell.fromJson(Map<String, dynamic> json) =>
      _$DiaryCellFromJson(json);

  @override
  int compareTo(other) {
    if (day < other.day ||
        day == other.day &&
            columnPosition < other.columnPosition &&
            capitalColumnPosition == other.capitalColumnPosition ||
        day == other.day &&
            capitalColumnPosition < other.capitalColumnPosition) {
      return -1;
    }
    if (day > other.day ||
        day == other.day &&
            columnPosition > other.columnPosition &&
            capitalColumnPosition == other.capitalColumnPosition ||
        day == other.day &&
            capitalColumnPosition > other.capitalColumnPosition) {
      return 1;
    }

    return 0;
  }

  factory DiaryCell.fromFirestore({
    required DocumentSnapshot doc,
    required DiaryCellSettings defaultSettings,
    required DiaryCellTextSettings defaultTextSettings,
  }) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return DiaryCell(
      columnName: data[DiaryCellFields.columnName]! as String,
      columnPosition: data[DiaryCellFields.columnPosition]! as int,
      day: data[DiaryCellFields.day]! as int,
      content: data[DiaryCellFields.content] as String,
      settings: DiaryCellSettings.fromFirestore(
        doc: doc,
        defaultSettings: defaultSettings,
      ),
      textSettings: DiaryCellTextSettings.fromFirestore(
        doc: doc,
        defaultSettings: defaultTextSettings,
      ),
      capitalColumnPosition:
          data[DiaryCellFields.capitalColumnPosition]! as int,
    );
  }
}
