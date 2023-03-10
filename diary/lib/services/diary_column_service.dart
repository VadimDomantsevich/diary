import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/core/constants/colors/black_color_constants.dart';
import 'package:diary/core/constants/constants.dart';
import 'package:diary/core/constants/enums.dart';
import 'package:diary/core/extentions.dart';
import 'package:diary/core/functions.dart';
import 'package:diary/model/capital_cell.dart';
import 'package:diary/model/diary_column.dart';
import 'package:diary/model/diary_column_settings.dart';
import 'package:diary/model/diary_list.dart';

class DiaryColumnService {
  Future<String> create({
    required String name,
    required int count,
    required DiaryList diaryList,
  }) async {
    final columnsCollection = getDiaryColumnsCollection(diaryList: diaryList);
    final col = await columnsCollection
        .where(Constants.diaryColumnIdField, isEqualTo: name)
        .get();
    final columnsDefaultSettingsDoc = await columnsCollection
        .doc(Constants.columnsDefaultSettingsDocName)
        .get();
    if (columnsDefaultSettingsDoc.data() == null) {
      await columnsCollection.doc(Constants.columnsDefaultSettingsDocName).set(
            createSettings(columnsCount: 1).toFirestore(),
          );
    }

    DiaryColumnSettings defaultColumnSettings = await getDefaultColumnSettings(
      diaryList: diaryList,
    );
    List<double> width = List.empty(growable: true);
    int i = 0;
    while (i < count) {
      width.add(Constants.defaultColumnWidth);
      i++;
    }
    DiaryColumnSettings columnSettings = DiaryColumnSettings(
      width: width,
      capitalCellBorderWidth: defaultColumnSettings.capitalCellBorderWidth,
      capitalCellBorderColor: defaultColumnSettings.capitalCellBorderColor,
      capitalCellHeight: defaultColumnSettings.capitalCellHeight,
      capitalCellBackgroundColor:
          defaultColumnSettings.capitalCellBackgroundColor,
      capitalCellAlignment: defaultColumnSettings.capitalCellAlignment,
      capitalCellFontWeight: defaultColumnSettings.capitalCellFontWeight,
      capitalCellTextDecoration:
          defaultColumnSettings.capitalCellTextDecoration,
      capitalCellFontStyle: defaultColumnSettings.capitalCellFontStyle,
      capitalCellFontSize: defaultColumnSettings.capitalCellFontSize,
      capitalCellTextColor: defaultColumnSettings.capitalCellTextColor,
    );
    if (col.docs.isEmpty) {
      final newColumn = DiaryColumn(
        id: name,
        name: name,
        columnsCount: count,
        settings: columnSettings,
      );
      await columnsCollection.doc(name).set(newColumn.toFirestore());

      await updateSettings(
        diaryList: diaryList,
        diaryColumn: newColumn,
        settings: columnSettings,
      );

      return name;
    } else {
      final id = '${name}1';
      final newColumn = DiaryColumn(
        id: id,
        name: name,
        columnsCount: count,
        settings: columnSettings,
      );
      await columnsCollection.doc(id).set(newColumn.toFirestore());

      await updateSettings(
        diaryList: diaryList,
        diaryColumn: newColumn,
        settings: columnSettings,
      );

      return id;
    }
  }

  DiaryColumn read({
    required DocumentSnapshot doc,
    required DiaryColumnSettings defaultSettings,
  }) =>
      DiaryColumn.fromFirestore(
        doc: doc,
        defaultSettings: defaultSettings,
      );

  DiaryColumnSettings readSettings({
    required DocumentSnapshot doc,
    DiaryColumnSettings? defaultSettings,
  }) =>
      DiaryColumnSettings.fromFirestore(
        doc: doc,
        defaultSettings: defaultSettings,
      );

  Future<DiaryColumnSettings> getDefaultColumnSettings({
    required DiaryList diaryList,
  }) async {
    final columnsCollection = getDiaryColumnsCollection(diaryList: diaryList);
    return readSettings(
      doc: await columnsCollection
          .doc(Constants.columnsDefaultSettingsDocName)
          .get(),
    );
  }

  Future<List<DiaryColumn>> getAll({
    required DiaryList diaryList,
  }) async {
    final columnsCollection =
        await getDiaryColumnsCollection(diaryList: diaryList).get();

    List<DiaryColumn> diaryColumns = [];

    final defaultSettings = await getDefaultColumnSettings(
      diaryList: diaryList,
    );

    for (var doc in columnsCollection.docs) {
      if (doc.id != Constants.columnsDefaultSettingsDocName) {
        diaryColumns.add(
          read(
            doc: doc,
            defaultSettings: defaultSettings,
          ),
        );
      }
    }
    return diaryColumns;
  }

  Future<DiaryColumn> getColumnById({
    required DiaryList diaryList,
    required String columnId,
  }) async {
    final columnDoc = await getDiaryColumnDoc(
      diaryList: diaryList,
      diaryColumnId: columnId,
    ).get();
    final defaultSettings = await getDefaultColumnSettings(
      diaryList: diaryList,
    );
    return read(
      doc: columnDoc,
      defaultSettings: defaultSettings,
    );
  }

  Future<DiaryColumn> getDateColumn({
    required DiaryList diaryList,
  }) async {
    final dateColumnDoc = await getDiaryColumnDoc(
      diaryList: diaryList,
      diaryColumnId: Constants.diaryColumnDateField,
    ).get();
    final defaultSettings = await getDefaultColumnSettings(
      diaryList: diaryList,
    );
    return read(
      doc: dateColumnDoc,
      defaultSettings: defaultSettings,
    );
  }

  Future<void> update({
    required DiaryList diaryList,
    required DiaryColumn diaryColumn,
    required String name,
    required int count,
  }) async {
    final columnsCollection = getDiaryColumnsCollection(diaryList: diaryList);
    final column = await columnsCollection
        .where(
          Constants.diaryColumnIdField,
          isEqualTo: diaryColumn.id,
        )
        .get();
    final doc = await column.docs.first.reference.get();
    if (doc.data() != null) {
      final newColumn = diaryColumn.copyWith(name: name, columnsCount: count);
      await FirebaseFirestore.instance.doc(doc.reference.path).update(
            newColumn.toFirestore(),
          );
    }
  }

  Future<void> delete({required DocumentSnapshot doc}) async {
    await FirebaseFirestore.instance.doc(doc.reference.path).delete();
  }

  DiaryColumnSettings createSettings({
    required int columnsCount,
  }) {
    List<double> width = List.empty(growable: true);
    int i = 0;
    while (i < columnsCount) {
      width.add(Constants.defaultColumnWidth);
      i++;
    }
    return DiaryColumnSettings(
      width: width,
      capitalCellBorderWidth: BordersStyleEnum.thick.toDoubleWidth(),
      capitalCellBorderColor: BlackColorConstants.black1,
      capitalCellHeight: Constants.defaultCapitalCellHeight,
      capitalCellBackgroundColor: BlackColorConstants.black6,
      capitalCellAlignment: AlignmentsEnum.center,
      capitalCellFontWeight: FontWeightEnum.bold,
      capitalCellTextDecoration: TextDecorationEnum.none,
      capitalCellFontStyle: FontStyleEnum.normal,
      capitalCellFontSize: Constants.defaultCapitalCellFontSize,
      capitalCellTextColor: BlackColorConstants.black1,
    );
  }

  Future<void> updateSettings({
    required DiaryList diaryList,
    required DiaryColumn diaryColumn,
    required DiaryColumnSettings settings,
  }) async {
    final doc = await getDiaryColumnDoc(
      diaryList: diaryList,
      diaryColumnId: diaryColumn.id,
    ).get();
    if (doc.data() != null) {
      await FirebaseFirestore.instance.doc(doc.reference.path).update(
            settings.toFirestore(),
          );
    }
  }

  Future<void> updateDefaultSettings({
    required DiaryList diaryList,
    required DiaryColumnSettings settings,
  }) async {
    final columnsCollection = getDiaryColumnsCollection(
      diaryList: diaryList,
    );
    final doc = await columnsCollection
        .doc(Constants.columnsDefaultSettingsDocName)
        .get();
    if (doc.data() != null) {
      await FirebaseFirestore.instance.doc(doc.reference.path).update(
            settings.toFirestore(),
          );
    }
  }

  Future<List<CapitalCell>> getCapitalCells({
    required DiaryList diaryList,
    required List<DiaryColumn> diaryColumns,
  }) async {
    final defaultSettings =
        await getDefaultColumnSettings(diaryList: diaryList);
    List<CapitalCell> capitalCells = List<CapitalCell>.empty(growable: true);
    for (var column in diaryColumns) {
      final diaryColumnDoc = await getDiaryColumnDoc(
        diaryList: diaryList,
        diaryColumnId: column.id,
      ).get();
      final newCell = CapitalCell.fromFirestore(
        doc: diaryColumnDoc,
        defaultSettings: defaultSettings,
      );
      capitalCells.add(
        newCell,
      );
    }
    return capitalCells;
  }

  Future<void> createDateColumn({
    required DiaryList diaryList,
  }) async {
    final doc = getDiaryColumnsCollection(diaryList: diaryList)
        .doc(Constants.diaryColumnDateField);

    final columnsCollection = getDiaryColumnsCollection(diaryList: diaryList);
    await columnsCollection.doc(Constants.columnsDefaultSettingsDocName).set(
          createSettings(columnsCount: 1).toFirestore(),
        );
    final dateSettings = createSettings(columnsCount: 2);
    final dateColumn = DiaryColumn(
      id: Constants.diaryColumnDateField,
      name: Constants.diaryColumnDateField,
      columnsCount: 2,
      settings: dateSettings,
    );
    await doc.set(
      dateColumn.toFirestore(),
    );
    await updateSettings(
      diaryList: diaryList,
      diaryColumn: dateColumn,
      settings: dateSettings,
    );
  }
}
