import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:diary/model/diary_column.dart';

part 'diary_list.g.dart';

@CopyWith()
class DiaryList {
  final DateTime listDate;
  final String uid;

  DiaryList({
    required this.listDate,
    required this.uid,
  });

  Map<String, dynamic> toFirestore() => {
        'listDate': listDate,
        'uid': uid,
      };

  factory DiaryList.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return DiaryList(
      listDate: (data['listDate']! as Timestamp).toDate(),
      uid: data['uid']! as String,
    );
  }
}
