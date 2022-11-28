import 'package:diary/core/constants/enums.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:diary/model/diary_list.dart';
import 'package:flutter/material.dart';

String getDiaryListName(DiaryList diaryList) =>
    '${diaryList.listDate.month}.${diaryList.listDate.year}';

String getDiaryListNameByDate(DateTime date) => '${date.month}.${date.year}';

String getDiaryCellName(DiaryCell diaryCell) =>
    '${diaryCell.columnPosition}.${diaryCell.day}';

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
