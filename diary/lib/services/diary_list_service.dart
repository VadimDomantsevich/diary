import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/core/constants/collections.dart';
import 'package:diary/core/constants/constants.dart';
import 'package:diary/core/functions.dart';
import 'package:diary/model/capital_cell.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:diary/model/diary_cell_settings.dart';
import 'package:diary/model/diary_cell_text_settings.dart';
import 'package:diary/model/diary_column.dart';
import 'package:diary/model/diary_column_settings.dart';
import 'package:diary/model/diary_list.dart';
import 'package:diary/model/diary_list_settings.dart';
import 'package:diary/model/list_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DiaryListService {
  Future<void> create({required DateTime date}) async {
    final defaultSettingsDoc = await getDiaryListCollection()
        .doc(Constants.listsDefaultSettingsDocName)
        .get();
    if (defaultSettingsDoc.data() == null) {
      getDiaryListCollection().doc(Constants.listsDefaultSettingsDocName).set(
            createDefaultSettings().toFirestore(),
          );
    }
    final defaultSettings = await getDefaultListSettings();
    final newList = DiaryList(
      name: getDiaryListNameByDate(date),
      listDate: date,
      uid: FirebaseAuth.instance.currentUser!.uid,
      settings: defaultSettings,
    );
    await getDiaryListDoc(diaryList: newList).set(
      newList.toFirestore(),
    );
  }

  DiaryList read({
    required DocumentSnapshot doc,
    required DiaryListSettings defaultSettings,
  }) =>
      DiaryList.fromFirestore(
        doc: doc,
        defaultSettings: defaultSettings,
      );

  Future<DiaryList> getByDate({required DateTime date}) async {
    final doc = await getDiaryListDocByDate(date: date).get();
    final defaultSettings = await getDefaultListSettings();
    return read(
      doc: doc,
      defaultSettings: defaultSettings,
    );
  }

  Future<bool> isNewUser() async {
    final lists =
        await getUserDoc().collection(Collections.diaryListsCollection).get();
    return lists.docs.isEmpty ? true : false;
  }

  Future<List<DiaryList>> getAll() async {
    final lists =
        await getUserDoc().collection(Collections.diaryListsCollection).get();
    final defaultSettings = await getDefaultListSettings();
    List<DiaryList> diaryLists = [];

    for (var doc in lists.docs) {
      if (doc.id != Constants.listsDefaultSettingsDocName) {
        diaryLists.add(
          read(
            doc: doc,
            defaultSettings: defaultSettings,
          ),
        );
      }
    }
    return diaryLists;
  }

  Future<DiaryListSettings> getDefaultListSettings() async {
    final listsCollection = getDiaryListCollection();
    return readSettings(
      doc: await listsCollection
          .doc(Constants.listsDefaultSettingsDocName)
          .get(),
    );
  }

  DiaryListSettings createDefaultSettings() {
    return DiaryListSettings(
      themeColor: Constants.defaultDiaryListThemeColor,
      themeBorderColor: Constants.defaultDiaryListThemeBorderColor,
      themePanelBackgroundColor:
          Constants.defaultDiaryListThemePanelBackgroundColor,
    );
  }

  DiaryListSettings readSettings({
    required DocumentSnapshot doc,
    DiaryListSettings? defaultSettings,
  }) =>
      DiaryListSettings.fromFirestore(
        doc: doc,
        defaultSettings: defaultSettings,
      );

  Future<void> update({
    required DiaryList diaryList,
    required String newName,
  }) async {
    final doc = await getDiaryListDoc(diaryList: diaryList).get();
    if (doc.data() != null) {
      final newList = diaryList.copyWith(name: newName);
      await FirebaseFirestore.instance.doc(doc.reference.path).update(
            newList.toFirestore(),
          );
    }
  }

  Future<void> updateSettings({
    required DiaryList diaryList,
    required DiaryListSettings settings,
  }) async {
    final doc = await getDiaryListDoc(diaryList: diaryList).get();
    if (doc.data() != null) {
      await FirebaseFirestore.instance.doc(doc.reference.path).update(
            settings.toFirestore(),
          );
    }
  }

  Future<void> updateDefaultSettings({
    required DiaryListSettings settings,
  }) async {
    final listsCollection = getDiaryListCollection();
    final doc =
        await listsCollection.doc(Constants.listsDefaultSettingsDocName).get();
    if (doc.data() != null) {
      await FirebaseFirestore.instance.doc(doc.reference.path).update(
            settings.toFirestore(),
          );
    }
  }

  ListTheme createListTheme({
    required DiaryList diaryList,
    required List<DiaryColumn> diaryColumns,
    required List<DiaryCell> diaryCells,
    required List<CapitalCell> capitalCells,
    required DiaryCellSettings cellSettings,
    required DiaryCellTextSettings cellTextSettings,
    required String name,
    required String description,
  }) {
    return ListTheme(
      diaryList: diaryList,
      diaryColumns: diaryColumns,
      diaryCells: diaryCells,
      capitalCells: capitalCells,
      cellSettings: cellSettings,
      cellTextSettings: cellTextSettings,
      listThemeName: name,
      description: description,
    );
  }

  Future<void> createFromTheme({
    required ListTheme listTheme,
  }) async {
    final defaultSettings = listTheme.diaryList.settings;
    updateDefaultSettings(settings: defaultSettings);
    final newList = DiaryList(
      name: getDiaryListNameByDate(DateTime.now()),
      listDate: DateTime.now(),
      uid: FirebaseAuth.instance.currentUser!.uid,
      settings: defaultSettings,
    );
    await getDiaryListDoc(diaryList: newList).set(
      newList.toFirestore(),
    );
  }

  Future<void> saveListThemeToFirestore({
    required ListTheme listTheme,
  }) async {
    final themesCollection = getThemesCollection();
    final themeDoc = themesCollection.doc(getListThemeName(listTheme));
    await themeDoc.set(
      listTheme.toFirestore(),
    );
    await themeDoc.update(listTheme.diaryList.settings.toFirestore());
    final columnsCollection =
        themeDoc.collection(Collections.diaryColumnsCollection);
    for (var diaryColumn in listTheme.diaryColumns) {
      final columnDoc = columnsCollection.doc(diaryColumn.id);
      await columnDoc.set(
        diaryColumn.toFirestore(),
      );
      await columnDoc.update(diaryColumn.settings.toFirestore());
      final cellsCollection =
          columnDoc.collection(Collections.diaryCellsCollection);
      final defaultCellSettingsDoc =
          cellsCollection.doc(Constants.cellsDefaultSettingsDocName);
      await defaultCellSettingsDoc.set(listTheme.cellSettings.toFirestore());
      await defaultCellSettingsDoc
          .update(listTheme.cellTextSettings.toFirestore());
      final columnCells = listTheme.diaryCells
          .where((element) => element.columnName == diaryColumn.id);
      for (var cell in columnCells) {
        if (cell.columnName != Constants.diaryColumnDateField) {
          final clearCell = cell.copyWith(content: '');
          await cellsCollection.doc(getDiaryCellName(cell)).set(
                clearCell.toFirestore(),
              );
        } else {
          await cellsCollection.doc(getDiaryCellName(cell)).set(
                cell.toFirestore(),
              );
        }
      }
    }
  }

  Future<List<ListTheme>> getListThemesFromFirestore() async {
    List<ListTheme> listThemes = List<ListTheme>.empty(growable: true);
    final themesCollection = await getThemesCollection().get();
    for (var themeDoc in themesCollection.docs) {
      final diaryListSettings =
          DiaryListSettings.fromFirestoreToTheme(doc: themeDoc);
      final diaryList = DiaryList(
        listDate: DateTime.now(),
        uid: FirebaseAuth.instance.currentUser!.uid,
        name: getDiaryListNameByDate(DateTime.now()),
        settings: diaryListSettings,
      );
      final columnsCollection = await themeDoc.reference
          .collection(Collections.diaryColumnsCollection)
          .get();

      final defaultCellSettingsDoc = await columnsCollection
          .docs.first.reference
          .collection(Collections.diaryCellsCollection)
          .doc(Constants.cellsDefaultSettingsDocName)
          .get();
      final defaultCellSettings =
          DiaryCellSettings.fromFirestore(doc: defaultCellSettingsDoc);
      final defaultCellTextSettings =
          DiaryCellTextSettings.fromFirestore(doc: defaultCellSettingsDoc);

      List<DiaryColumn> diaryColumns = List<DiaryColumn>.empty(growable: true);
      List<DiaryCell> diaryCells = List<DiaryCell>.empty(growable: true);
      for (var columnDoc in columnsCollection.docs) {
        final diaryColumnSettings =
            DiaryColumnSettings.fromFirestoreToTheme(doc: columnDoc);
        final diaryColumn = DiaryColumn.fromFirestore(
          doc: columnDoc,
          defaultSettings: diaryColumnSettings,
        );
        diaryColumns.add(diaryColumn);
        final cellsCollection = await columnDoc.reference
            .collection(Collections.diaryCellsCollection)
            .get();

        for (var cellDoc in cellsCollection.docs) {
          if (cellDoc.id != Constants.cellsDefaultSettingsDocName) {
            final diaryCell = DiaryCell.fromFirestore(
              doc: cellDoc,
              defaultSettings: defaultCellSettings,
              defaultTextSettings: defaultCellTextSettings,
            );
            diaryCells.add(diaryCell);
          }
        }
        diaryCells.sort();
      }
      List<CapitalCell> capitalCells = List<CapitalCell>.empty(growable: true);
      for (var column in diaryColumns) {
        final capitalCell = CapitalCell(
          name: column.name,
          columnId: column.id,
          settings: column.settings,
        );
        capitalCells.add(capitalCell);
      }
      final listTheme = ListTheme.fromFirestore(
        doc: themeDoc,
        diaryList: diaryList,
        diaryColumns: diaryColumns,
        capitalCells: capitalCells,
        diaryCells: diaryCells,
        cellSettings: defaultCellSettings,
        cellTextSettings: defaultCellTextSettings,
      );
      listThemes.add(listTheme);
    }
    return listThemes;
  }

  Future<void> deleteListTheme({
    required ListTheme listTheme,
  }) async {
    final doc = await getListThemeDocByName(
      name: getListThemeName(listTheme),
    ).get();
    await FirebaseFirestore.instance.doc(doc.reference.path).delete();
  }
}
