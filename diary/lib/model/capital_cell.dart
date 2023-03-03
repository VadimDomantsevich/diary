import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:diary/core/constants/capital_cell_fields.dart';
import 'package:diary/model/diary_column_settings.dart';

part 'capital_cell.g.dart';

@CopyWith()
class CapitalCell {
  final String name;
  final String columnId;
  final DiaryColumnSettings settings;

  CapitalCell({
    required this.name,
    required this.columnId,
    required this.settings,
  });

  factory CapitalCell.fromFirestore({
    required DocumentSnapshot doc,
    required DiaryColumnSettings defaultSettings,
  }) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return CapitalCell(
      name: data[CapitalCellFields.name] as String,
      columnId: data[CapitalCellFields.columnId] as String,
      settings: DiaryColumnSettings.fromFirestore(
        doc: doc,
        defaultSettings: defaultSettings,
      ),
    );
  }
}
