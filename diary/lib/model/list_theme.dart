import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/core/constants/list_theme_fields.dart';
import 'package:diary/model/capital_cell.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:diary/model/diary_cell_settings.dart';
import 'package:diary/model/diary_cell_text_settings.dart';
import 'package:diary/model/diary_column.dart';
import 'package:diary/model/diary_list.dart';

class ListTheme {
  final DiaryList diaryList;
  final List<DiaryColumn> diaryColumns;
  final List<DiaryCell> diaryCells;
  final List<CapitalCell> capitalCells;
  final DiaryCellSettings cellSettings;
  final DiaryCellTextSettings cellTextSettings;
  final String listThemeName;
  final String description;

  ListTheme({
    required this.diaryList,
    required this.diaryColumns,
    required this.diaryCells,
    required this.capitalCells,
    required this.cellSettings,
    required this.cellTextSettings,
    required this.listThemeName,
    required this.description,
  });

  Map<String, dynamic> toFirestore() => {
        ListThemeFields.listThemeName: listThemeName,
        ListThemeFields.description: description,
      };

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
