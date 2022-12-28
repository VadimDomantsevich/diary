import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:diary/core/constants/constants.dart';

part 'diary_column_settings.g.dart';

@CopyWith()
class DiaryColumnSettings {
  final double width;

  DiaryColumnSettings({
    required this.width,
  });

  Map<String, dynamic> toFirestore() => {
        'width': width,
      };

  factory DiaryColumnSettings.fromFirestore({
    required DocumentSnapshot doc,
    DiaryColumnSettings? defaultSettings,
  }) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    if (doc.id == Constants.columnsDefaultSettingsDocName) {
      return DiaryColumnSettings(
        width: data['width'],
      );
    } else {
      double width = defaultSettings!.width;
      if (data['width'] != null) {
        width = data['width'];
      }
      return DiaryColumnSettings(
        width: width,
      );
    }
  }
}
