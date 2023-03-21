import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/core/constants/capital_cell_fields.dart';
import 'package:diary/model/diary_column_settings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'capital_cell.freezed.dart';

@Freezed(
  copyWith: true,
)
class CapitalCell with _$CapitalCell{
  const factory CapitalCell({
    required String name,
    required String columnId,
    @JsonKey(includeToJson: false)
    required DiaryColumnSettings settings,
  }) = _CapitalCell;

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
