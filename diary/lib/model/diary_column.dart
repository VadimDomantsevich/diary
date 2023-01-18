import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:diary/core/constants/diary_column_fields.dart';
import 'package:diary/model/diary_column_settings.dart';

part 'diary_column.g.dart';

@CopyWith()
class DiaryColumn {
  final String id;
  final String name;
  final int columnsCount;
  final DiaryColumnSettings settings;

  DiaryColumn({
    required this.id,
    required this.name,
    required this.columnsCount,
    required this.settings,
  });

  Map<String, dynamic> toFirestore() => {
        DiaryColumnFields.id: id,
        DiaryColumnFields.name: name,
        DiaryColumnFields.columnsCount: columnsCount,
      };

  factory DiaryColumn.fromFirestore({
    required DocumentSnapshot doc,
    required DiaryColumnSettings defaultSettings,
  }) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return DiaryColumn(
      id: data[DiaryColumnFields.id]! as String,
      name: data[DiaryColumnFields.name]! as String,
      columnsCount: data[DiaryColumnFields.columnsCount]! as int,
      settings: DiaryColumnSettings.fromFirestore(
        doc: doc,
        defaultSettings: defaultSettings,
      ),
    );
  }
}
