import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/core/constants/constants.dart';
import 'package:diary/core/constants/diary_list_settings_fields.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_list_settings.freezed.dart';
part 'diary_list_settings.g.dart';

@Freezed(
  copyWith: true,
  toJson: true,
  fromJson: true,
)
class DiaryListSettings with _$DiaryListSettings {
  const factory DiaryListSettings({
    required String themeColor,
    required String themeBorderColor,
    required String themePanelBackgroundColor,
  }) = _DiaryListSettings;

  factory DiaryListSettings.fromJson(Map<String, dynamic> json) =>
      _$DiaryListSettingsFromJson(json);

  factory DiaryListSettings.fromFirestore({
    required DocumentSnapshot doc,
    DiaryListSettings? defaultSettings,
  }) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    if (doc.id == Constants.listsDefaultSettingsDocName) {
      return DiaryListSettings.fromJson(data);
    } else {
      String themeColor = defaultSettings!.themeColor;
      String themeBorderColor = defaultSettings.themeBorderColor;
      String themePanelBackgroundColor =
          defaultSettings.themePanelBackgroundColor;

      data[DiaryListSettingsFields.themeColor] != null
          ? themeColor = data[DiaryListSettingsFields.themeColor]
          : themeColor;
      data[DiaryListSettingsFields.themeBorderColor] != null
          ? themeBorderColor = data[DiaryListSettingsFields.themeBorderColor]
          : themeBorderColor;
      data[DiaryListSettingsFields.themePanelBackgroundColor] != null
          ? themePanelBackgroundColor =
              data[DiaryListSettingsFields.themePanelBackgroundColor]
          : themePanelBackgroundColor;

      return DiaryListSettings(
        themeColor: themeColor,
        themeBorderColor: themeBorderColor,
        themePanelBackgroundColor: themePanelBackgroundColor,
      );
    }
  }

  factory DiaryListSettings.fromFirestoreToTheme({
    required DocumentSnapshot doc,
  }) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return DiaryListSettings.fromJson(data);
  }
}
