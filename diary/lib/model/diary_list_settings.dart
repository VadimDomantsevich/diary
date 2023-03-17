import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:diary/core/constants/constants.dart';
import 'package:diary/core/constants/diary_list_settings_fields.dart';

part 'diary_list_settings.g.dart';

@CopyWith()
class DiaryListSettings {
  final String themeColor;
  final String themeBorderColor;
  final String themePanelBackgroundColor;

  DiaryListSettings({
    required this.themeColor,
    required this.themeBorderColor,
    required this.themePanelBackgroundColor,
  });

  Map<String, dynamic> toFirestore() => {
        DiaryListSettingsFields.themeColor: themeColor,
        DiaryListSettingsFields.themeBorderColor: themeBorderColor,
        DiaryListSettingsFields.themePanelBackgroundColor:
            themePanelBackgroundColor,
      };

  factory DiaryListSettings.fromFirestore({
    required DocumentSnapshot doc,
    DiaryListSettings? defaultSettings,
  }) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    if (doc.id == Constants.listsDefaultSettingsDocName) {
      return DiaryListSettings(
        themeColor: data[DiaryListSettingsFields.themeColor]! as String,
        themeBorderColor:
            data[DiaryListSettingsFields.themeBorderColor]! as String,
        themePanelBackgroundColor:
            data[DiaryListSettingsFields.themePanelBackgroundColor]! as String,
      );
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
    return DiaryListSettings(
      themeColor: data[DiaryListSettingsFields.themeColor]! as String,
      themeBorderColor:
          data[DiaryListSettingsFields.themeBorderColor]! as String,
      themePanelBackgroundColor:
          data[DiaryListSettingsFields.themePanelBackgroundColor]! as String,
    );
  }
}
