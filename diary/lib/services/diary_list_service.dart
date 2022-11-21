import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/core/constants/collections.dart';
import 'package:diary/model/diary_list.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DiaryListService {
  Future<void> create({required DateTime date}) async {
    final newList =
        DiaryList(listDate: date, uid: FirebaseAuth.instance.currentUser!.uid);
    await FirebaseFirestore.instance
        .collection(Collections.usersCollection)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(Collections.diaryListsCollection)
        .doc('${date.month}.${date.year}')
        .set(newList.toFirestore());
  }

  DiaryList read({required DocumentSnapshot doc}) =>
      DiaryList.fromFirestore(doc);

  Future<DiaryList> getByDate({required DateTime date}) async {
    final doc = await FirebaseFirestore.instance
        .collection(Collections.usersCollection)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(Collections.diaryListsCollection)
        .doc('${date.month}.${date.year}')
        .get();
    return read(doc: doc);
  }

  Future<List<DiaryList>> getAll() async {
    final lists = await FirebaseFirestore.instance
        .collection(Collections.usersCollection)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(Collections.diaryListsCollection)
        .get();

    List<DiaryList> diaryLists = [];

    for (var doc in lists.docs) {
      diaryLists.add(read(doc: doc));
    }
    return diaryLists;
  }
}
