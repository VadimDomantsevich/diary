import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:diary/core/constants/diary_list_fields.dart';
import 'package:diary/model/diary_list_settings.dart';

part 'diary_list.g.dart';

@CopyWith()
class DiaryList {
  final String name;
  final DateTime listDate;
  final String uid;
  final DiaryListSettings settings;

  DiaryList({
    required this.name,
    required this.listDate,
    required this.uid,
    required this.settings,
  });

  Map<String, dynamic> toFirestore() => {
        DiaryListFields.name: name,
        DiaryListFields.listDate: listDate,
        DiaryListFields.uid: uid,
      };

  factory DiaryList.fromFirestore({
    required DocumentSnapshot doc,
    required DiaryListSettings defaultSettings,
  }) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return DiaryList(
        name: data[DiaryListFields.name]! as String,
        listDate: (data[DiaryListFields.listDate]! as Timestamp).toDate(),
        uid: data[DiaryListFields.uid]! as String,
        settings: DiaryListSettings.fromFirestore(
          doc: doc,
          defaultSettings: defaultSettings,
        ));
  }
}
