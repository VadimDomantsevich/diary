import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:diary/core/constants/diary_cell_fields.dart';
import 'package:diary/model/diary_cell_settings.dart';
import 'package:diary/model/diary_cell_text_settings.dart';

part 'diary_cell.g.dart';

@CopyWith()
class DiaryCell extends Comparable {
  final String columnName;
  final int columnPosition;
  final int day;
  final dynamic content;
  final DiaryCellSettings settings;
  final DiaryCellTextSettings textSettings;
  final int capitalColumnPosition;

  DiaryCell({
    required this.columnName,
    required this.columnPosition,
    required this.day,
    required this.settings,
    required this.textSettings,
    required this.capitalColumnPosition,
    this.content,
  });

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

  Map<String, dynamic> toFirestore() => {
        DiaryCellFields.columnName: columnName,
        DiaryCellFields.columnPosition: columnPosition,
        DiaryCellFields.day: day,
        DiaryCellFields.content: content,
        DiaryCellFields.capitalColumnPosition: capitalColumnPosition,
      };

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
      content: data[DiaryCellFields.content],
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
