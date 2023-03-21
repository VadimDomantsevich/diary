import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/core/constants/diary_list_fields.dart';
import 'package:diary/model/diary_list_settings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_list.freezed.dart';
part 'diary_list.g.dart';

@Freezed(
  copyWith: true,
  toJson: true,
  fromJson: true,
)
class DiaryList with _$DiaryList {
  const factory DiaryList({
    required String name,
    required DateTime listDate,
    required String uid,
    @JsonKey(includeToJson: false) required DiaryListSettings settings,
  }) = _DiaryList;

  factory DiaryList.fromJson(Map<String, dynamic> json) =>
      _$DiaryListFromJson(json);

  factory DiaryList.fromFirestore({
    required DocumentSnapshot doc,
    required DiaryListSettings defaultSettings,
  }) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return DiaryList(
      name: data[DiaryListFields.name]! as String,
      listDate: DateTime.parse(data[DiaryListFields.listDate]! as String),
      uid: data[DiaryListFields.uid]! as String,
      settings: DiaryListSettings.fromFirestore(
        doc: doc,
        defaultSettings: defaultSettings,
      ),
    );
  }
}
