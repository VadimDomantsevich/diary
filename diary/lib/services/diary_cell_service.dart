import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/core/constants/collections.dart';
import 'package:diary/core/constants/constants.dart';
import 'package:diary/core/constants/enums.dart';
import 'package:diary/core/functions.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:diary/model/diary_cell_settings.dart';
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
    final diaryColumnDoc = getDiaryColumnDoc(
      diaryList: diaryList,
      diaryColumnId: diaryColumn.id,
    );
    final cellsCollection = diaryColumnDoc.collection(
      Collections.diaryCellsCollection,
    );
    await cellsCollection.doc(Constants.cellsDefaultSettingsDocName).set(
          createDefaultSettings().toFirestore(),
        ); //Оно всегда будет переписывать дефолт сеттинги на прописанные
    //меня это не устраивает
    final defaultSettings = await getDefaultCellSettings(
      diaryList: diaryList,
      diaryColumn: diaryColumn,
    );

    for (var i = 1; i < diaryColumn.columnsCount + 1; i++) {
      for (var j = 1; j <= daysInMonth; j++) {
        final newCell = DiaryCell(
          columnName: diaryColumnDoc.id, //It seems to be the right way
          columnPosition: j,
          day: i,
          dataType: dataType,
          settings: defaultSettings,
        );
        await cellsCollection.doc(getDiaryCellName(newCell)).set(
              newCell.toFirestore(),
            );
      }
    }
  }

  DiaryCell read({
    required DocumentSnapshot doc,
    required DiaryCellSettings defaultSettings,
  }) =>
      DiaryCell.fromFirestore(
        doc: doc,
        defaultSettings: defaultSettings,
      );

  DiaryCellSettings readSettings({
    required DocumentSnapshot doc,
    DiaryCellSettings? defaultSettings,
  }) =>
      DiaryCellSettings.fromFirestore(
        doc: doc,
        defaultSettings: defaultSettings,
      );

  Future<DiaryCellSettings> getDefaultCellSettings({
    required DiaryList diaryList,
    required DiaryColumn diaryColumn,
  }) async {
    final cellsCollection = await getDiaryCellsCollection(
      diaryList: diaryList,
      diaryColumn: diaryColumn,
    );
    return readSettings(
      doc: await cellsCollection
          .doc(Constants.cellsDefaultSettingsDocName)
          .get(),
    );
  }

  Future<List<DiaryCell>> getAll({
    required DiaryList diaryList,
    required DiaryColumn diaryColumn,
  }) async {
    final cellsCollection = await getDiaryCellsCollection(
      diaryList: diaryList,
      diaryColumn: diaryColumn,
    );
    final cells = await cellsCollection.get();

    List<DiaryCell> diaryCells = List<DiaryCell>.empty(growable: true);

    final defaultSettings = await getDefaultCellSettings(
      diaryList: diaryList,
      diaryColumn: diaryColumn,
    );

    for (var doc in cells.docs) {
      if (doc.id != Constants.cellsDefaultSettingsDocName) {
        diaryCells.add(
          read(
            doc: doc,
            defaultSettings: defaultSettings,
          ),
        );
      }
    }
    diaryCells.sort(
      ((a, b) {
        int day = a.day.compareTo(b.day);
        if (day == 0) {
          return a.columnPosition.compareTo(b.columnPosition);
        }
        return day;
      }),
    );
    return diaryCells;
  }

  Future<DiaryCell> getDiaryCell({
    required DiaryList diaryList,
    required DiaryColumn diaryColumn,
    required DiaryCell diaryCell,
  }) async {
    final doc = await getDiaryCellDoc(
      diaryList: diaryList,
      diaryCell: diaryCell,
    ).get();
    if (doc.data() != null) {
      final defaultSettings = await getDefaultCellSettings(
        diaryList: diaryList,
        diaryColumn: diaryColumn,
      );
      return read(doc: doc, defaultSettings: defaultSettings);
    } else {
      return diaryCell;
    }
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
      await FirebaseFirestore.instance.doc(doc.reference.path).update(
            newCell.toFirestore(),
          );
    }
  }

  Future<void> updateSettings({
    required DiaryList diaryList,
    required DiaryCell diaryCell,
    required DiaryCellSettings settings,
  }) async {
    final doc = await getDiaryCellDoc(
      diaryList: diaryList,
      diaryCell: diaryCell,
    ).get();
    if (doc.data() != null) {
      final newCell = diaryCell.copyWith(settings: settings);
      await FirebaseFirestore.instance.doc(doc.reference.path).update(
            newCell.settings.toFirestore(),
          );
    }
  }

  Future<void> createDateCells({
    //ПЕРЕДЕЛАТЬ
    required DiaryList diaryList,
    required DiaryColumn diaryColumn,
  }) async {
    final cellsCollection = getDiaryColumnDoc(
      diaryList: diaryList,
      diaryColumnId: Constants.diaryColumnDateField,
    ).collection(Collections.diaryCellsCollection);
    await cellsCollection
        .doc(Constants.cellsDefaultSettingsDocName)
        .set(createDefaultSettings().toFirestore());
    final defaultSettings = await getDefaultCellSettings(
      diaryList: diaryList,
      diaryColumn: diaryColumn,
    );
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
            settings: defaultSettings,
          );
          await cellsCollection.doc(getDiaryCellName(newCell)).set(
                newCell.toFirestore(),
              );
        } else {
          final day = DateUtils.addDaysToDate(firstDayOfMonth, j - 1);
          final String dayOfTheWeek = DateFormat('EEEE').format(day);
          final newCell = DiaryCell(
            columnName: Constants.diaryColumnDateField,
            columnPosition: i,
            day: j,
            dataType: DataTypesEnum.text,
            content: dayOfTheWeek,
            settings: defaultSettings,
          );
          await cellsCollection.doc(getDiaryCellName(newCell)).set(
                newCell.toFirestore(),
              );
        }
      }
    }
  }

  DiaryCellSettings createDefaultSettings() {
    return DiaryCellSettings(
      alignment: AlignmentsEnum.center,
      height: 30,
    );
  }

  double getSummaryHeight({
    required List<DiaryCell> cells,
  }) {
    double height = 0;
    for (var cell in cells) {
      height += cell.settings.height;
    }
    return height;
  }

  bool isRectTouchTheCell({
    required double leftPosition,
    required double rightPosition,
    required double topPosition,
    required double bottomPosition,
    required GlobalObjectKey cellKey,
    required double scaleFactor,
  }) {
    final cellBox = cellKey.currentContext!.findRenderObject() as RenderBox;
    final cellPosition = cellBox.localToGlobal(Offset.zero);
    final cellLeftPosition = cellPosition.dx;
    final cellRightPosition = cellPosition.dx + cellBox.size.width*scaleFactor;
    final cellTopPosition = cellPosition.dy;
    final cellBottomPosition = cellPosition.dy + cellBox.size.height*scaleFactor;
    if (cellRightPosition <= leftPosition ||
        cellLeftPosition >= rightPosition) {
      //     print('Start right');
      // print('cellTop: ${cellTopPosition}');
      // print('cellBottom: ${cellBottomPosition}');
      // print('cellLeft: ${cellLeftPosition}');
      // print('cellRight: ${cellRightPosition}');
      // print('----');
      // print('TopPosition: ${topPosition}');
      // print('BottomPosition: ${bottomPosition}');
      // print('LeftPosition: ${leftPosition}');
      // print('RightPosition: ${rightPosition}');
      // print('END');
      return false;
    }
    if (cellTopPosition >= bottomPosition ||
        cellBottomPosition <= topPosition) {
      // print('Start top');
      // print('cellTop: ${cellTopPosition}');
      // print('cellBottom: ${cellBottomPosition}');
      // print('cellLeft: ${cellLeftPosition}');
      // print('cellRight: ${cellRightPosition}');
      // print('----');
      // print('TopPosition: ${topPosition}');
      // print('BottomPosition: ${bottomPosition}');
      // print('LeftPosition: ${leftPosition}');
      // print('RightPosition: ${rightPosition}');
      // print('END');
      return false;
    }

    return true;
  }
}
