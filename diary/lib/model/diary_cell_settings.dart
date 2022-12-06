import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:diary/core/constants/constants.dart';
import 'package:diary/core/constants/enums.dart';

part 'diary_cell_settings.g.dart';

@CopyWith()
class DiaryCellSettings {
  final AlignmentsEnum alignment;

  DiaryCellSettings({
    required this.alignment,
  });

  Map<String, dynamic> toFirestore() => {
        'alignment': alignment.name,
      };

  factory DiaryCellSettings.fromFirestore({
    required DocumentSnapshot doc,
    DiaryCellSettings? defaultSettings,
  }) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    if (doc.id == Constants.cellsDefaultSettingsDocName) {
      return DiaryCellSettings(
          alignment: AlignmentsEnum.values
              .firstWhere((element) => element.name == data['alignment']));
    } else {
      AlignmentsEnum alignment = defaultSettings!.alignment;
      if (data['alignment'] != null) {
        alignment = AlignmentsEnum.values.firstWhere(
          (element) => element.name == data['alignment'],
        );
      }
      return DiaryCellSettings(
        alignment: alignment,
      );
    }
  }
}
