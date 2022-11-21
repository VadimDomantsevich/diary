import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:diary/model/diary_cell.dart';

part 'diary_column.g.dart';

@CopyWith()
class DiaryColumn {
  final String name;
  final int columnsCount;
  //final List<List<DiaryCell>>? cells;
  //width?

  DiaryColumn({
    required this.name,
    required this.columnsCount,
    //this.cells,
  });

  Map<String, dynamic> toFirestore() => {
        'name': name,
        'columnsCount': columnsCount,
      };

  factory DiaryColumn.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return DiaryColumn(
      name: data['name']! as String,
      columnsCount: data['columnsCount']! as int,
    );
  }
}
