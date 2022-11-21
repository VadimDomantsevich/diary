import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:diary/core/constants/enums.dart';

part 'diary_cell.g.dart';

@CopyWith()
class DiaryCell {
  final String columnName;
  final int columnPosition;
  final int day;
  final DataTypesEnum dataType;
  final dynamic content;
  //alignments, textSizes, width, height?

  DiaryCell({
    required this.columnName,
    required this.columnPosition,
    required this.day,
    required this.dataType,
    this.content,
  });

  Map<String, dynamic> toFirestore() => {
        'columnName': columnName,
        'columnPosition': columnPosition,
        'day': day,
        'dataType': dataType.name,
        'content': content,
      };

  factory DiaryCell.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return DiaryCell(
      columnName: data['columnName']! as String,
      columnPosition: data['columnPosition']! as int,
      day: data['day']! as int,
      dataType: DataTypesEnum.values
          .firstWhere((element) => element.name == data['dataType']!),
      content: data['content'],
    );
  }
}
