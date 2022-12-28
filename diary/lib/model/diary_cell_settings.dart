import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:diary/core/constants/constants.dart';
import 'package:diary/core/constants/enums.dart';

part 'diary_cell_settings.g.dart';

@CopyWith()
class DiaryCellSettings {
  final AlignmentsEnum alignment;
  final double height;

  DiaryCellSettings({
    required this.alignment,
    required this.height,
  });

  Map<String, dynamic> toFirestore() => {
        'alignment': alignment.name,
        'height': height,
      };

  factory DiaryCellSettings.fromFirestore({
    required DocumentSnapshot doc,
    DiaryCellSettings? defaultSettings,
  }) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    if (doc.id == Constants.cellsDefaultSettingsDocName) {
      return DiaryCellSettings(
        alignment: AlignmentsEnum.values
            .firstWhere((element) => element.name == data['alignment']),
        height: data['height'],
      );
    } else {
      AlignmentsEnum alignment = defaultSettings!.alignment;
      double height = defaultSettings.height;
      if (data['alignment'] != null) {
        alignment = AlignmentsEnum.values.firstWhere(
          (element) => element.name == data['alignment'],
        );
      }
      if (data['height'] != null) {
        height = data['height'];
      }
      return DiaryCellSettings(
        alignment: alignment,
        height: height,
      );
    }
  }
}
