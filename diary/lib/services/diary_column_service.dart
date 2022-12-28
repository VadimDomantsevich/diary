import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/core/constants/constants.dart';
import 'package:diary/core/functions.dart';
import 'package:diary/model/diary_column.dart';
import 'package:diary/model/diary_column_settings.dart';
import 'package:diary/model/diary_list.dart';

class DiaryColumnService {
  Future<void> create({
    required String name,
    required int count,
    required DiaryList diaryList,
  }) async {
    final columnsCollection = getDiaryColumnsCollection(diaryList: diaryList);
    final col = await columnsCollection
        .where(Constants.diaryColumnIdField, isEqualTo: name)
        .get();
    await columnsCollection.doc(Constants.columnsDefaultSettingsDocName).set(
          createDefaultSettings().toFirestore(),
        );
    final defaultSettings = await getDefaultColumnSettings(
      diaryList: diaryList,
    );
    if (col.docs.isEmpty) {
      final newColumn = DiaryColumn(
        id: name,
        name: name,
        columnsCount: count,
        settings: defaultSettings,
      );
      await columnsCollection.add(
        newColumn.toFirestore(),
      );
    } else {
      final id = '${name}1';
      final newColumn = DiaryColumn(
        id: id,
        name: name,
        columnsCount: count,
        settings: defaultSettings,
      );
      await columnsCollection.add(
        newColumn.toFirestore(),
      );
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
    //При изменении count надо будет запускать create or delete cells
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
    //Возможно это не удалит все ячейки внутри, check
    await FirebaseFirestore.instance.doc(doc.reference.path).delete();
  }

  //Const values
  DiaryColumnSettings createDefaultSettings() {
    return DiaryColumnSettings(width: 300);
  }

  Future<void> createDateColumn({
    required DiaryList diaryList,
  }) async {
    final doc = getDiaryColumnsCollection(diaryList: diaryList)
        .doc(Constants.diaryColumnDateField);

    final columnsCollection = getDiaryColumnsCollection(diaryList: diaryList);
    await columnsCollection.doc(Constants.columnsDefaultSettingsDocName).set(
          createDefaultSettings().toFirestore(),
        );
    final defaultSettings = await getDefaultColumnSettings(
      diaryList: diaryList,
    );
    final dateColumn = DiaryColumn(
      id: Constants.diaryColumnDateField,
      name: Constants.diaryColumnDateField,
      columnsCount: 2,
      settings: defaultSettings,
    );
    await doc.set(
      dateColumn.toFirestore(),
    );
  }
}
