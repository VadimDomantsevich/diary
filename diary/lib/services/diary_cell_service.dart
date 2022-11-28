import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/core/constants/collections.dart';
import 'package:diary/core/constants/constants.dart';
import 'package:diary/core/constants/enums.dart';
import 'package:diary/core/functions.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:diary/model/diary_column.dart';
import 'package:diary/model/diary_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DiaryCellService {
  Future<void> create({
    required DataTypesEnum dataType,
    required DiaryList diaryList,
    required DiaryColumn diaryColumn,
  }) async {
    final daysInMonth = DateUtils.getDaysInMonth(
        diaryList.listDate.year, diaryList.listDate.month);
    final cellsCollection = getDiaryColumnDoc(
      diaryList: diaryList,
      diaryColumnName: diaryColumn.name,
    ).collection(Collections.diaryCellsCollection);
    for (var i = 1; i < diaryColumn.columnsCount + 1; i++) {
      for (var j = 1; j <= daysInMonth; j++) {
        final newCell = DiaryCell(
            columnName: diaryColumn.name,
            columnPosition: j,
            day: i,
            dataType: dataType);
        await cellsCollection
            .doc(getDiaryCellName(newCell))
            .set(newCell.toFirestore());
      }
    }
  }

  DiaryCell read({required DocumentSnapshot doc}) =>
      DiaryCell.fromFirestore(doc);

  Future<List<DiaryCell>> getAll({
    required DiaryList diaryList,
    required DiaryColumn diaryColumn,
  }) async {
    final docWithName = await getDiaryListDoc(diaryList: diaryList)
        .collection(Collections.diaryColumnsCollection)
        .where(
          Constants.diaryColumnNameField,
          isEqualTo: diaryColumn.name,
        )
        .get();
    final columnDocPath = docWithName.docs.first.reference.path;
    final cells = await FirebaseFirestore.instance
        .doc(columnDocPath)
        .collection(Collections.diaryCellsCollection)
        .orderBy(
          Constants.diaryCellDayField,
        )
        .get();
    List<DiaryCell> diaryCells = [];

    for (var doc in cells.docs) {
      diaryCells.add(read(doc: doc));
    }
    diaryCells.sort(
      ((a, b) {
        int columnPosition = a.columnPosition.compareTo(b.columnPosition);
        if (columnPosition == 0) {
          return a.day.compareTo(b.day);
        }
        return columnPosition;
      }),
    );
    return diaryCells;
  }

  Future<void> update({
    required DiaryList diaryList,
    required DiaryCell diaryCell,
    required DataTypesEnum dataType,
    required dynamic content,
  }) async {
    final doc = await getDiaryCellDoc(
      diaryList: diaryList,
      diaryCell: diaryCell,
    ).get();
    if (doc.data() != null) {
      final newCell = diaryCell.copyWith(dataType: dataType, content: content);
      await FirebaseFirestore.instance
          .doc(doc.reference.path)
          .update(newCell.toFirestore());
    }
  }

  Future<void> createDateCells({
    required DiaryList diaryList,
  }) async {
    final cellsCollection = getDiaryColumnDoc(
      diaryList: diaryList,
      diaryColumnName: Constants.diaryColumnDateField,
    ).collection(Collections.diaryCellsCollection);
    final daysInMonth = DateUtils.getDaysInMonth(
        diaryList.listDate.year, diaryList.listDate.month);
    final firstDayOfMonth =
        DateTime(diaryList.listDate.year, diaryList.listDate.month, 1);
    for (var i = 1; i < 3; i++) {
      for (var j = 1; j <= daysInMonth; j++) {
        if (i == 1) {
          final newCell = DiaryCell(
            columnName: Constants.diaryColumnDateField,
            columnPosition: i,
            day: j,
            dataType: DataTypesEnum.integerNumber,
            content: j,
          );
          await cellsCollection
              .doc(getDiaryCellName(newCell))
              .set(newCell.toFirestore());
        } else {
          final day = DateUtils.addDaysToDate(firstDayOfMonth, j - 1);
          final String dayOfTheWeek = DateFormat('EEEE').format(day);
          final newCell = DiaryCell(
              columnName: Constants.diaryColumnDateField,
              columnPosition: i,
              day: j,
              dataType: DataTypesEnum.text,
              content: dayOfTheWeek);
          await cellsCollection
              .doc(getDiaryCellName(newCell))
              .set(newCell.toFirestore());
        }
      }
    }
  }
}
