import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:diary/core/constants/diary_cell_fields.dart';
import 'package:diary/core/constants/enums.dart';
import 'package:diary/model/diary_cell_settings.dart';

part 'diary_cell.g.dart';

@CopyWith()
class DiaryCell {
  final String columnName;
  final int columnPosition;
  final int day;
  final DataTypesEnum dataType;
  final dynamic content;
  final DiaryCellSettings settings;

  DiaryCell({
    required this.columnName,
    required this.columnPosition,
    required this.day,
    required this.dataType,
    required this.settings,
    this.content,
  });

  Map<String, dynamic> toFirestore() => {
        DiaryCellFields.columnName: columnName,
        DiaryCellFields.columnPosition: columnPosition,
        DiaryCellFields.day: day,
        DiaryCellFields.dataType: dataType.name,
        DiaryCellFields.content: content,
      };

  factory DiaryCell.fromFirestore({
    required DocumentSnapshot doc,
    required DiaryCellSettings defaultSettings,
  }) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return DiaryCell(
      columnName: data[DiaryCellFields.columnName]! as String,
      columnPosition: data[DiaryCellFields.columnPosition]! as int,
      day: data[DiaryCellFields.day]! as int,
      dataType: DataTypesEnum.values
          .firstWhere((element) => element.name == data[DiaryCellFields.dataType]!),
      content: data[DiaryCellFields.content],
      settings: DiaryCellSettings.fromFirestore(
        doc: doc,
        defaultSettings: defaultSettings,
      ),
    );
  }
}
