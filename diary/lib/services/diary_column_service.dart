import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/core/constants/collections.dart';
import 'package:diary/core/functions.dart';
import 'package:diary/model/diary_column.dart';
import 'package:diary/model/diary_list.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DiaryColumnService {
  Future<void> create({
    required String name,
    required int count,
    required DiaryList diaryList,
  }) async {
    final columns = FirebaseFirestore.instance
        .collection(Collections.usersCollection)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(Collections.diaryListsCollection)
        .doc(getDiaryListName(diaryList))
        .collection(Collections.diaryColumnsCollection);
    final col =
        await columns.where('name', isEqualTo: name).get(); //const value
    if (col.docs.isEmpty) {
      final newColumn = DiaryColumn(name: name, columnsCount: count);
      await columns.add(newColumn.toFirestore());
    }
    //Error handler?
  }

  DiaryColumn read({required DocumentSnapshot doc}) =>
      DiaryColumn.fromFirestore(doc);

  Future<List<DiaryColumn>> getAll({
    required DiaryList diaryList,
  }) async {
    final columns = await FirebaseFirestore.instance
        .collection(Collections.usersCollection)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(Collections.diaryListsCollection)
        .doc(getDiaryListName(diaryList))
        .collection(Collections.diaryColumnsCollection)
        .get();

    List<DiaryColumn> diaryColumns = [];

    for (var doc in columns.docs) {
      diaryColumns.add(read(doc: doc));
    }
    return diaryColumns;
  }

  Future<void> update({
    required DiaryList diaryList,
    required DiaryColumn diaryColumn,
    required String name,
    required int count,
  }) async {
    final columns = FirebaseFirestore.instance
        .collection(Collections.usersCollection)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(Collections.diaryListsCollection)
        .doc(getDiaryListName(diaryList))
        .collection(Collections.diaryColumnsCollection);
    final column = await columns
        .where('name', isEqualTo: diaryColumn.name) //const value
        .get();
    final doc = await column.docs.first.reference.get();
    if (doc.data() != null) {
      final newColumn = diaryColumn.copyWith(name: name, columnsCount: count);
      await FirebaseFirestore.instance
          .doc(doc.reference.path)
          .update(newColumn.toFirestore());
    }
  }

  Future<void> delete({required DocumentSnapshot doc}) async {
    await FirebaseFirestore.instance.doc(doc.reference.path).delete();
  }

  Future<void> createDateColumn({
    required DiaryList diaryList,
  }) async {
    final doc = FirebaseFirestore.instance
        .collection(Collections.usersCollection)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(Collections.diaryListsCollection)
        .doc(getDiaryListName(diaryList))
        .collection(Collections.diaryColumnsCollection)
        .doc('Date');
    final dateColumn = DiaryColumn(name: 'Date', columnsCount: 2); //const value
    await doc.set(dateColumn.toFirestore());
  }
}
