import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/core/constants/list_theme_fields.dart';
import 'package:diary/model/capital_cell.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:diary/model/diary_cell_settings.dart';
import 'package:diary/model/diary_cell_text_settings.dart';
import 'package:diary/model/diary_column.dart';
import 'package:diary/model/diary_list.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_theme.freezed.dart';
part 'list_theme.g.dart';

@Freezed(
  copyWith: true,
  toJson: true,
)
class ListTheme with _$ListTheme {
  const factory ListTheme({
    @JsonKey(includeToJson: false, includeFromJson: false)
        required DiaryList diaryList,
    @JsonKey(includeToJson: false, includeFromJson: false)
        required List<DiaryColumn> diaryColumns,
    @JsonKey(includeToJson: false, includeFromJson: false)
        required List<DiaryCell> diaryCells,
    @JsonKey(includeToJson: false, includeFromJson: false)
        required List<CapitalCell> capitalCells,
    @JsonKey(includeToJson: false, includeFromJson: false)
        required DiaryCellSettings cellSettings,
    @JsonKey(includeToJson: false, includeFromJson: false)
        required DiaryCellTextSettings cellTextSettings,
    required String listThemeName,
    required String description,
  }) = _ListTheme;

  factory ListTheme.fromFirestore({
    required DocumentSnapshot doc,
    required DiaryList diaryList,
    required List<DiaryColumn> diaryColumns,
    required List<DiaryCell> diaryCells,
    required List<CapitalCell> capitalCells,
    required DiaryCellSettings cellSettings,
    required DiaryCellTextSettings cellTextSettings,
  }) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return ListTheme(
      diaryList: diaryList,
      diaryColumns: diaryColumns,
      diaryCells: diaryCells,
      capitalCells: capitalCells,
      cellSettings: cellSettings,
      cellTextSettings: cellTextSettings,
      listThemeName: data[ListThemeFields.listThemeName]! as String,
      description: data[ListThemeFields.description]! as String,
    );
  }
}
