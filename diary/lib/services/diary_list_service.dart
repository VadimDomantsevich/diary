import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/core/constants/collections.dart';
import 'package:diary/core/functions.dart';
import 'package:diary/model/diary_list.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DiaryListService {
  Future<void> create({required DateTime date}) async {
    final newList =
        DiaryList(listDate: date, uid: FirebaseAuth.instance.currentUser!.uid);
    await getDiaryListDoc(diaryList: newList).set(
      newList.toFirestore(),
    );
  }

  DiaryList read({required DocumentSnapshot doc}) =>
      DiaryList.fromFirestore(doc);

  Future<DiaryList> getByDate({required DateTime date}) async {
    final doc = await getDiaryListDocByDate(date: date).get();
    return read(doc: doc);
  }

  Future<List<DiaryList>> getAll() async {
    final lists =
        await getUserDoc().collection(Collections.diaryListsCollection).get();

    List<DiaryList> diaryLists = [];

    for (var doc in lists.docs) {
      diaryLists.add(
        read(doc: doc),
      );
    }
    return diaryLists;
  }
}
