import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/core/constants/collections.dart';
import 'package:diary/core/constants/enums.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:diary/model/diary_column.dart';
import 'package:diary/model/diary_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

String getDiaryListName(DiaryList diaryList) =>
    '${diaryList.listDate.month}.${diaryList.listDate.year}';

String getDiaryListNameByDate(DateTime date) => '${date.month}.${date.year}';

String getDiaryCellName(DiaryCell diaryCell) =>
    '${diaryCell.columnPosition}.${diaryCell.day}';

DocumentReference getUserDoc() => FirebaseFirestore.instance
    .collection(Collections.usersCollection)
    .doc(FirebaseAuth.instance.currentUser!.uid);

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
  required String diaryColumnName,
}) =>
    getDiaryListDoc(diaryList: diaryList)
        .collection(Collections.diaryColumnsCollection)
        .doc(diaryColumnName);

CollectionReference getDiaryColumnsCollection({
  required DiaryList diaryList,
}) =>
    getDiaryListDoc(diaryList: diaryList)
        .collection(Collections.diaryColumnsCollection);

DocumentReference getDiaryCellDoc({
  required DiaryList diaryList,
  required DiaryCell diaryCell,
}) =>
    getDiaryColumnDoc(
      diaryList: diaryList,
      diaryColumnName: diaryCell.columnName,
    )
        .collection(Collections.diaryCellsCollection)
        .doc(getDiaryCellName(diaryCell));

// TextInputType converterFromDataTypesEnum(DataTypesEnum dataType) {
//   switch (dataType) {
//     case DataTypesEnum.integerNumber:
//       return const TextInputType.numberWithOptions(decimal: false);
//     case DataTypesEnum.number:
//       return TextInputType.number;
//     case DataTypesEnum.text:
//       return TextInputType.text;
//     case DataTypesEnum.time:
//       return TextInputType.datetime;
//     case DataTypesEnum.timeInterval:
//       return TextInputType.text;
//     default:
//       return TextInputType.text;
//   }
// }
