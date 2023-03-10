import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/home/edit_panel/edit_list/delete_column_alert_dialog.dart';
import 'package:diary/model/diary_column.dart';
import 'package:diary/model/diary_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocDeleteColumnAlertDialog extends StatelessWidget {
  const BlocDeleteColumnAlertDialog({
    super.key,
    required this.title,
    required this.diaryColumn,
    required this.diaryList,
  });

  final String title;
  final DiaryList diaryList;
  final DiaryColumn diaryColumn;

  @override
  Widget build(BuildContext context) {
    return DeleteColumnAlertDialog(
      diaryList: diaryList,
      name: diaryColumn.name,
      title: title,
      onPressedSubmitButton: () {
        context.read<DiaryListBloc>().add(
              DiaryListEvent.deleteDiaryColumn(
                diaryList: diaryList,
                columnId: diaryColumn.id,
              ),
            );
      },
    );
  }
}
