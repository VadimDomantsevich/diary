import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/core/constants/collections.dart';
import 'package:diary/core/constants/constants.dart';
import 'package:diary/core/functions.dart';
import 'package:diary/model/diary_list.dart';
import 'package:diary/model/diary_list_settings.dart';
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
}
