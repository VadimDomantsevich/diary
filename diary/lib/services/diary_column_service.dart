import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/core/constants/constants.dart';
import 'package:diary/core/functions.dart';
import 'package:diary/model/diary_column.dart';
import 'package:diary/model/diary_list.dart';

class DiaryColumnService {
  Future<void> create({
    required String name,
    required int count,
    required DiaryList diaryList,
  }) async {
    final columns = getDiaryColumnsCollection(diaryList: diaryList);
    final col = await columns
        .where(Constants.diaryColumnNameField, isEqualTo: name)
        .get();
    if (col.docs.isEmpty) {
      final newColumn = DiaryColumn(name: name, columnsCount: count);
      await columns.add(
        newColumn.toFirestore(),
      );
    }
  }

  DiaryColumn read({required DocumentSnapshot doc}) =>
      DiaryColumn.fromFirestore(doc);

  Future<List<DiaryColumn>> getAll({
    required DiaryList diaryList,
  }) async {
    final columns = await getDiaryColumnsCollection(diaryList: diaryList).get();

    List<DiaryColumn> diaryColumns = [];

    for (var doc in columns.docs) {
      diaryColumns.add(
        read(doc: doc),
      );
    }
    return diaryColumns;
  }

  Future<DiaryColumn> getDateColumn({
    required DiaryList diaryList,
  }) async {
    final dateColumnDoc = await getDiaryColumnDoc(
      diaryList: diaryList,
      diaryColumnName: Constants.diaryColumnDateField,
    ).get();
    return read(doc: dateColumnDoc);
  }

  Future<void> update({
    required DiaryList diaryList,
    required DiaryColumn diaryColumn,
    required String name,
    required int count,
  }) async {
    final columns = getDiaryColumnsCollection(diaryList: diaryList);
    final column = await columns
        .where(
          Constants.diaryColumnNameField,
          isEqualTo: diaryColumn.name,
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

  Future<void> createDateColumn({
    required DiaryList diaryList,
  }) async {
    final doc = getDiaryColumnsCollection(diaryList: diaryList)
        .doc(Constants.diaryColumnDateField);
    final dateColumn =
        DiaryColumn(name: Constants.diaryColumnDateField, columnsCount: 2);
    await doc.set(
      dateColumn.toFirestore(),
    );
  }
}
