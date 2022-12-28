import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/core/constants/collections.dart';
import 'package:diary/core/constants/constants.dart';
import 'package:diary/core/constants/enums.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:diary/model/diary_column.dart';
import 'package:diary/model/diary_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  required String diaryColumnId,
}) =>
    getDiaryListDoc(diaryList: diaryList)
        .collection(Collections.diaryColumnsCollection)
        .doc(diaryColumnId);

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
    )
        .collection(Collections.diaryCellsCollection)
        .doc(getDiaryCellName(diaryCell));

Alignment converterAlignmentFromAlignmentsEnum(AlignmentsEnum alignment) {
  switch (alignment) {
    case AlignmentsEnum.bottomCenter:
      return Alignment.bottomCenter;
    case AlignmentsEnum.bottomLeft:
      return Alignment.bottomLeft;
    case AlignmentsEnum.bottomRight:
      return Alignment.bottomRight;
    case AlignmentsEnum.center:
      return Alignment.center;
    case AlignmentsEnum.centerLeft:
      return Alignment.centerLeft;
    case AlignmentsEnum.centerRight:
      return Alignment.centerRight;
    case AlignmentsEnum.topCenter:
      return Alignment.topCenter;
    case AlignmentsEnum.topLeft:
      return Alignment.topLeft;
    case AlignmentsEnum.topRight:
      return Alignment.topRight;
  }
}

String converterLocalizationStringFromAlignment(
    BuildContext context, AlignmentsEnum alignment) {
  switch (alignment) {
    case AlignmentsEnum.bottomCenter:
      return AppLocalizations.of(context).bottomCenter;
    case AlignmentsEnum.bottomLeft:
      return AppLocalizations.of(context).bottomLeft;
    case AlignmentsEnum.bottomRight:
      return AppLocalizations.of(context).bottomRight;
    case AlignmentsEnum.center:
      return AppLocalizations.of(context).center;
    case AlignmentsEnum.centerLeft:
      return AppLocalizations.of(context).centerLeft;
    case AlignmentsEnum.centerRight:
      return AppLocalizations.of(context).centerRight;
    case AlignmentsEnum.topCenter:
      return AppLocalizations.of(context).topCenter;
    case AlignmentsEnum.topLeft:
      return AppLocalizations.of(context).topLeft;
    case AlignmentsEnum.topRight:
      return AppLocalizations.of(context).topRight;
  }
}
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
