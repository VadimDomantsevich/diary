import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:diary/core/constants/diary_list_fields.dart';

part 'diary_list.g.dart';

@CopyWith()
class DiaryList {
  final String name;
  final DateTime listDate;
  final String uid;

  DiaryList({
    required this.name,
    required this.listDate,
    required this.uid,
  });

  Map<String, dynamic> toFirestore() => {
        DiaryListFields.name: name,
        DiaryListFields.listDate: listDate,
        DiaryListFields.uid: uid,
      };

  factory DiaryList.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return DiaryList(
      name: data[DiaryListFields.name]! as String,
      listDate: (data[DiaryListFields.listDate]! as Timestamp).toDate(),
      uid: data[DiaryListFields.uid]! as String,
    );
  }
}
