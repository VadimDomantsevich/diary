import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:diary/core/constants/constants.dart';
import 'package:diary/core/constants/diary_column_settings_fields.dart';

part 'diary_column_settings.g.dart';

@CopyWith()
class DiaryColumnSettings {
  final double width;

  DiaryColumnSettings({
    required this.width,
  });

  Map<String, dynamic> toFirestore() => {
        DiaryColumnSettingsFields.width: width,
      };

  factory DiaryColumnSettings.fromFirestore({
    required DocumentSnapshot doc,
    DiaryColumnSettings? defaultSettings,
  }) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    if (doc.id == Constants.columnsDefaultSettingsDocName) {
      return DiaryColumnSettings(
        width: data[DiaryColumnSettingsFields.width],
      );
    } else {
      double width = defaultSettings!.width;
      if (data[DiaryColumnSettingsFields.width] != null) {
        width = data[DiaryColumnSettingsFields.width];
      }
      return DiaryColumnSettings(
        width: width,
      );
    }
  }
}
