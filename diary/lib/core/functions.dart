import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/core/constants/collections.dart';
import 'package:diary/core/constants/constants.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:diary/model/diary_column.dart';
import 'package:diary/model/diary_list.dart';
import 'package:firebase_auth/firebase_auth.dart';

String getDiaryListName(DiaryList diaryList) =>
    '${diaryList.listDate.month}.${diaryList.listDate.year}';

String getDiaryListNameByDate(DateTime date) => '${date.month}.${date.year}';

String getDiaryCellName(DiaryCell diaryCell) =>
    '${diaryCell.columnPosition}.${diaryCell.day}';

DocumentReference getUserDoc() => FirebaseFirestore.instance
    .collection(Collections.usersCollection)
    .doc(FirebaseAuth.instance.currentUser!.uid);

CollectionReference getDiaryListCollection() =>
    getUserDoc().collection(Collections.diaryListsCollection);

DocumentReference getDiaryListDoc({required DiaryList diaryList}) =>
    getUserDoc()
        .collection(Collections.diaryListsCollection)
        .doc(getDiaryListName(diaryList));

DocumentReference getDiaryListDocByDate({required DateTime date}) =>
    getUserDoc()
        .collection(Collections.diaryListsCollection)
        .doc(getDiaryListNameByDate(date));

DocumentReference getDiaryColumnDoc({
  required DiaryList diaryList,
  required String diaryColumnId,
}) =>
    getDiaryColumnsCollection(diaryList: diaryList).doc(diaryColumnId);

CollectionReference getDiaryColumnsCollection({
  required DiaryList diaryList,
}) =>
    getDiaryListDoc(diaryList: diaryList)
        .collection(Collections.diaryColumnsCollection);

Future<CollectionReference> getDiaryCellsCollection({
  required DiaryList diaryList,
  required DiaryColumn diaryColumn,
}) async {
  final docByName = await getDiaryColumnsCollection(diaryList: diaryList)
      .where(
        Constants.diaryColumnIdField,
        isEqualTo: diaryColumn.id,
      )
      .get();
  final columnDocPath = docByName.docs.first.reference.path;
  return FirebaseFirestore.instance
      .doc(columnDocPath)
      .collection(Collections.diaryCellsCollection);
}

DocumentReference getDiaryCellDoc({
  required DiaryList diaryList,
  required DiaryCell diaryCell,
}) =>
    getDiaryColumnDoc(
      diaryList: diaryList,
      diaryColumnId: diaryCell.columnName,
    ).collection(Collections.diaryCellsCollection).doc(
          getDiaryCellName(diaryCell),
        );
