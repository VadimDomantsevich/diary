import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/core/constants/collections.dart';
import 'package:diary/core/constants/colors/black_color_constants.dart';
import 'package:diary/core/constants/constants.dart';
import 'package:diary/core/constants/enums.dart';
import 'package:diary/core/extentions.dart';
import 'package:diary/core/functions.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:diary/model/diary_cell_settings.dart';
import 'package:diary/model/diary_cell_text_settings.dart';
import 'package:diary/model/diary_column.dart';
import 'package:diary/model/diary_list.dart';
import 'package:diary/model/list_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DiaryCellService {
  Future<void> create({
    required DiaryList diaryList,
    required DiaryColumn diaryColumn,
    required List<DiaryColumn> diaryColumns,
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
          createDefaultSettings().toJson(),
        );
    await cellsCollection.doc(Constants.cellsDefaultSettingsDocName).update(
          createDefaultTextSettings().toJson(),
        );

    final defaultSettings = await getDefaultCellSettings(
      diaryList: diaryList,
      diaryColumn: diaryColumn,
    );
    final defaultTextSettings = await getDefaultCellTextSettings(
      diaryList: diaryList,
      diaryColumn: diaryColumn,
    );
    for (var i = 1; i < diaryColumn.columnsCount + 1; i++) {
      for (var j = 1; j <= daysInMonth; j++) {
        final newCell = DiaryCell(
          columnName: diaryColumnDoc.id,
          columnPosition: i,
          day: j,
          settings: defaultSettings,
          textSettings: defaultTextSettings,
          content: '',
          capitalColumnPosition: diaryColumns.indexOf(
            diaryColumns
                .firstWhere((element) => element.id == diaryColumnDoc.id),
          ),
        );
        await cellsCollection.doc(getDiaryCellName(newCell)).set(
              newCell.toJson(),
            );
      }
    }
  }

  Future<List<DiaryCell>> getColumnCells({
    required DiaryList diaryList,
    required DiaryColumn diaryColumn,
    required List<DiaryColumn> diaryColumns,
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
          createDefaultSettings().toJson(),
        );
    await cellsCollection.doc(Constants.cellsDefaultSettingsDocName).update(
          createDefaultTextSettings().toJson(),
        );

    final defaultSettings = await getDefaultCellSettings(
      diaryList: diaryList,
      diaryColumn: diaryColumn,
    );
    final defaultTextSettings = await getDefaultCellTextSettings(
      diaryList: diaryList,
      diaryColumn: diaryColumn,
    );
    List<DiaryCell> diaryCells = List<DiaryCell>.empty(growable: true);
    for (var i = 1; i < diaryColumn.columnsCount + 1; i++) {
      for (var j = 1; j <= daysInMonth; j++) {
        final newCell = DiaryCell(
          columnName: diaryColumnDoc.id,
          columnPosition: i,
          day: j,
          settings: defaultSettings,
          textSettings: defaultTextSettings,
          content: '',
          capitalColumnPosition: diaryColumns.indexOf(
            diaryColumns
                .firstWhere((element) => element.id == diaryColumnDoc.id),
          ),
        );
        diaryCells.add(newCell);
      }
    }
    return diaryCells;
  }

  DiaryCell read({
    required DocumentSnapshot doc,
    required DiaryCellSettings defaultSettings,
    required DiaryCellTextSettings defaultTextSettings,
  }) =>
      DiaryCell.fromFirestore(
        doc: doc,
        defaultSettings: defaultSettings,
        defaultTextSettings: defaultTextSettings,
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

  DiaryCellTextSettings readTextSettings({
    required DocumentSnapshot doc,
    DiaryCellTextSettings? defaultSettings,
  }) =>
      DiaryCellTextSettings.fromFirestore(
        doc: doc,
        defaultSettings: defaultSettings,
      );

  Future<DiaryCellTextSettings> getDefaultCellTextSettings({
    required DiaryList diaryList,
    required DiaryColumn diaryColumn,
  }) async {
    final cellsCollection = await getDiaryCellsCollection(
      diaryList: diaryList,
      diaryColumn: diaryColumn,
    );
    return readTextSettings(
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
    final defaultTextSettings = await getDefaultCellTextSettings(
      diaryList: diaryList,
      diaryColumn: diaryColumn,
    );

    for (var doc in cells.docs) {
      if (doc.id != Constants.cellsDefaultSettingsDocName) {
        diaryCells.add(
          read(
            doc: doc,
            defaultSettings: defaultSettings,
            defaultTextSettings: defaultTextSettings,
          ),
        );
      }
    }
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
      final defaultTextSettings = await getDefaultCellTextSettings(
        diaryList: diaryList,
        diaryColumn: diaryColumn,
      );
      return read(
        doc: doc,
        defaultSettings: defaultSettings,
        defaultTextSettings: defaultTextSettings,
      );
    } else {
      return diaryCell;
    }
  }

  Future<void> update({
    required DiaryList diaryList,
    required DiaryCell diaryCell,
    required dynamic content,
  }) async {
    final doc = await getDiaryCellDoc(
      diaryList: diaryList,
      diaryCell: diaryCell,
    ).get();
    if (doc.data() != null) {
      final newCell = diaryCell.copyWith(content: content);
      await FirebaseFirestore.instance.doc(doc.reference.path).update(
            newCell.toJson(),
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
            newCell.settings.toJson(),
          );
    }
  }

  Future<void> updateDefaultSettings({
    required DiaryList diaryList,
    required DiaryColumn diaryColumn,
    required DiaryCellSettings settings,
  }) async {
    final cellsCollection = await getDiaryCellsCollection(
      diaryList: diaryList,
      diaryColumn: diaryColumn,
    );
    final doc =
        await cellsCollection.doc(Constants.cellsDefaultSettingsDocName).get();
    if (doc.data() != null) {
      await FirebaseFirestore.instance.doc(doc.reference.path).update(
            settings.toJson(),
          );
    }
  }

  Future<void> updateTextSettings({
    required DiaryList diaryList,
    required DiaryCell diaryCell,
    required DiaryCellTextSettings settings,
  }) async {
    final doc = await getDiaryCellDoc(
      diaryList: diaryList,
      diaryCell: diaryCell,
    ).get();
    if (doc.data() != null) {
      final newCell = diaryCell.copyWith(textSettings: settings);
      await FirebaseFirestore.instance.doc(doc.reference.path).update(
            newCell.textSettings.toJson(),
          );
    }
  }

  Future<void> updateDefaultTextSettings({
    required DiaryList diaryList,
    required DiaryColumn diaryColumn,
    required DiaryCellTextSettings settings,
  }) async {
    final cellsCollection = await getDiaryCellsCollection(
      diaryList: diaryList,
      diaryColumn: diaryColumn,
    );
    final doc =
        await cellsCollection.doc(Constants.cellsDefaultSettingsDocName).get();
    if (doc.data() != null) {
      await FirebaseFirestore.instance.doc(doc.reference.path).update(
            settings.toJson(),
          );
    }
  }

  Future<void> createDateCells({
    required DiaryList diaryList,
    required DiaryColumn diaryColumn,
  }) async {
    final cellsCollection = getDiaryColumnDoc(
      diaryList: diaryList,
      diaryColumnId: Constants.diaryColumnDateField,
    ).collection(Collections.diaryCellsCollection);
    await cellsCollection
        .doc(Constants.cellsDefaultSettingsDocName)
        .set(createDefaultSettings().toJson());
    await cellsCollection
        .doc(Constants.cellsDefaultSettingsDocName)
        .update(createDefaultTextSettings().toJson());
    final defaultSettings = await getDefaultCellSettings(
      diaryList: diaryList,
      diaryColumn: diaryColumn,
    );
    final defaultTextSettings = await getDefaultCellTextSettings(
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
            content: j.toString(),
            settings: defaultSettings,
            textSettings: defaultTextSettings,
            capitalColumnPosition: 0,
          );
          await cellsCollection.doc(getDiaryCellName(newCell)).set(
                newCell.toJson(),
              );
        } else {
          final day = DateUtils.addDaysToDate(firstDayOfMonth, j - 1);
          final String dayOfTheWeek = DateFormat('EEEE').format(day);
          final newCell = DiaryCell(
            columnName: Constants.diaryColumnDateField,
            columnPosition: i,
            day: j,
            content: dayOfTheWeek,
            settings: defaultSettings,
            textSettings: defaultTextSettings,
            capitalColumnPosition: 0,
          );
          await cellsCollection.doc(getDiaryCellName(newCell)).set(
                newCell.toJson(),
              );
        }
      }
    }
  }

  DiaryCellSettings createDefaultSettings() {
    return DiaryCellSettings(
      topBorderColor: Constants.defaultDiaryCellBorderColor,
      topBorderWidth: Constants.defaultBordersStyleEnum.toDoubleWidth(),
      leftBorderColor: Constants.defaultDiaryCellBorderColor,
      leftBorderWidth: Constants.defaultBordersStyleEnum.toDoubleWidth(),
      rightBorderColor: Constants.defaultDiaryCellBorderColor,
      rightBorderWidth: Constants.defaultBordersStyleEnum.toDoubleWidth(),
      bottomBorderColor: Constants.defaultDiaryCellBorderColor,
      bottomBorderWidth: Constants.defaultBordersStyleEnum.toDoubleWidth(),
      height: Constants.defaultCellHeight,
      backgroundColor: Constants.defaultDiaryCellBackgroundColor,
    );
  }

  DiaryCellTextSettings createDefaultTextSettings() {
    return const DiaryCellTextSettings(
      alignment: AlignmentsEnum.center,
      fontWeight: FontWeightEnum.normal,
      textDecoration: TextDecorationEnum.none,
      fontStyle: FontStyleEnum.normal,
      fontSize: Constants.defaultTextFontSize,
      color: BlackColorConstants.black1,
    );
  }

  Future<void> createFromTheme({
    required ListTheme listTheme,
  }) async {
    final daysInMonth = DateUtils.getDaysInMonth(
        listTheme.diaryList.listDate.year, listTheme.diaryList.listDate.month);
    for (var diaryColumn in listTheme.diaryColumns) {
      if (diaryColumn.id == Constants.diaryColumnDateField) {
        createDateCells(
          diaryList: listTheme.diaryList,
          diaryColumn: diaryColumn,
        );
      } else {
        final diaryColumnDoc = getDiaryColumnDoc(
          diaryList: listTheme.diaryList,
          diaryColumnId: diaryColumn.id,
        );
        final cellsCollection = diaryColumnDoc.collection(
          Collections.diaryCellsCollection,
        );
        await cellsCollection.doc(Constants.cellsDefaultSettingsDocName).set(
              listTheme.cellSettings.toJson(),
            );
        await cellsCollection.doc(Constants.cellsDefaultSettingsDocName).update(
              listTheme.cellTextSettings.toJson(),
            );
        for (var i = 1; i < diaryColumn.columnsCount + 1; i++) {
          for (var j = 1; j <= daysInMonth; j++) {
            final newCell = DiaryCell(
              columnName: diaryColumnDoc.id,
              columnPosition: i,
              day: j,
              settings: listTheme.cellSettings,
              textSettings: listTheme.cellTextSettings,
              content: '',
              capitalColumnPosition: listTheme.diaryColumns.indexOf(
                listTheme.diaryColumns
                    .firstWhere((element) => element.id == diaryColumnDoc.id),
              ),
            );
            await cellsCollection.doc(getDiaryCellName(newCell)).set(
                  newCell.toJson(),
                );
          }
        }
      }
    }
  }

  AlignmentsEnum convertAlignments({
    required HorizontalAlignmentsEnum horizontal,
    required VerticalAlignmentsEnum vertical,
  }) {
    String alignment = '';
    switch (vertical) {
      case VerticalAlignmentsEnum.top:
        alignment += 'top';
        break;
      case VerticalAlignmentsEnum.center:
        alignment += 'center';
        break;
      case VerticalAlignmentsEnum.bottom:
        alignment += 'bottom';
        break;
    }
    switch (horizontal) {
      case HorizontalAlignmentsEnum.left:
        alignment += 'Left';
        break;
      case HorizontalAlignmentsEnum.center:
        alignment != 'center' ? alignment += 'Center' : alignment;
        break;
      case HorizontalAlignmentsEnum.right:
        alignment += 'Right';
        break;
    }

    return alignment.toAlignmentsEnum();
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
    final cellRightPosition =
        cellPosition.dx + cellBox.size.width * scaleFactor;
    final cellTopPosition = cellPosition.dy;
    final cellBottomPosition =
        cellPosition.dy + cellBox.size.height * scaleFactor;
    if (cellRightPosition <= leftPosition ||
        cellLeftPosition >= rightPosition) {
      return false;
    }
    if (cellTopPosition >= bottomPosition ||
        cellBottomPosition <= topPosition) {
      return false;
    }

    return true;
  }

  bool isTopBorderNeedToBeDrawn({
    required List<DiaryCell> diaryCells,
    required DiaryCell diaryCell,
    required int columnsCount,
    required BordersStyleEnum bordersStyleEnum,
    required Color color,
  }) {
    bool isTopBorderNeedToBeDrawn = true;
    final index = diaryCells.indexOf(diaryCell);
    if (index - columnsCount >= 0) {
      final topCell = diaryCells[index - columnsCount];
      final topCellBottomBorderWidth = topCell.settings.bottomBorderWidth;
      final topCellBottomBorderColor =
          topCell.settings.bottomBorderColor.toColor();
      topCellBottomBorderWidth == bordersStyleEnum.toDoubleWidth() &&
              topCellBottomBorderColor == color
          ? isTopBorderNeedToBeDrawn = false
          : isTopBorderNeedToBeDrawn = true;
    }
    return isTopBorderNeedToBeDrawn;
  }

  bool isBottomBorderNeedToBeDrawn({
    required List<DiaryCell> diaryCells,
    required DiaryCell diaryCell,
    required int columnsCount,
    required BordersStyleEnum bordersStyleEnum,
    required Color color,
  }) {
    bool isBottomBorderNeedToBeDrawn = true;
    final index = diaryCells.indexOf(diaryCell);
    final cellsLength = diaryCells.length;
    if (index + columnsCount < cellsLength) {
      final bottomCell = diaryCells[index + columnsCount];
      final bottomCellTopBorderWidth = bottomCell.settings.topBorderWidth;
      final bottomCellTopBorderColor =
          bottomCell.settings.topBorderColor.toColor();
      bottomCellTopBorderWidth == bordersStyleEnum.toDoubleWidth() &&
              bottomCellTopBorderColor == color
          ? isBottomBorderNeedToBeDrawn = false
          : isBottomBorderNeedToBeDrawn = true;
    }
    return isBottomBorderNeedToBeDrawn;
  }

  bool isLeftBorderNeedToBeDrawn({
    required List<DiaryCell> diaryCells,
    required DiaryCell diaryCell,
    required int columnsCount,
    required BordersStyleEnum bordersStyleEnum,
    required Color color,
  }) {
    bool isLeftBorderNeedToBeDrawn = true;
    final index = diaryCells.indexOf(diaryCell);
    bool isCellTheMostLeft = false;
    index % columnsCount == 0
        ? isCellTheMostLeft = true
        : isCellTheMostLeft = false;
    if (!isCellTheMostLeft) {
      final leftCell = diaryCells[index - 1];
      final leftCellRightBorderWidth = leftCell.settings.rightBorderWidth;
      final leftCellRightBorderColor =
          leftCell.settings.rightBorderColor.toColor();
      leftCellRightBorderWidth == bordersStyleEnum.toDoubleWidth() &&
              leftCellRightBorderColor == color
          ? isLeftBorderNeedToBeDrawn = false
          : isLeftBorderNeedToBeDrawn = true;
    }
    return isLeftBorderNeedToBeDrawn;
  }

  bool isRightBorderNeedToBeDrawn({
    required List<DiaryCell> diaryCells,
    required DiaryCell diaryCell,
    required int columnsCount,
    required BordersStyleEnum bordersStyleEnum,
    required Color color,
  }) {
    bool isRightBorderNeedToBeDrawn = true;
    final index = diaryCells.indexOf(diaryCell);
    bool isCellTheMostRight = false;
    index % columnsCount == columnsCount - 1
        ? isCellTheMostRight = true
        : isCellTheMostRight = false;
    if (!isCellTheMostRight) {
      final rightCell = diaryCells[index + 1];
      final rightCellLeftBorderWidth = rightCell.settings.leftBorderWidth;
      final rightCellLeftBorderColor =
          rightCell.settings.leftBorderColor.toColor();
      rightCellLeftBorderWidth == bordersStyleEnum.toDoubleWidth() &&
              rightCellLeftBorderColor == color
          ? isRightBorderNeedToBeDrawn = false
          : isRightBorderNeedToBeDrawn = true;
    }
    return isRightBorderNeedToBeDrawn;
  }
}
