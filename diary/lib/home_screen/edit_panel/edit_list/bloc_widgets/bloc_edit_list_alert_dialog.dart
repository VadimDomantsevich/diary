import 'package:diary/blocs/diary_list_bloc/diary_list_bloc.dart';
import 'package:diary/home_screen/edit_panel/edit_list/widgets/edit_list_alert_dialog.dart';
import 'package:diary/model/diary_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocEditListAlertDialog extends StatelessWidget {
  const BlocEditListAlertDialog({
    super.key,
    required this.diaryList,
    required this.title,
    required this.hintText,
  });

  final String title;
  final String hintText;
  final DiaryList diaryList;

  @override
  Widget build(BuildContext context) {
    return EditListAlertDialog(
      diaryList: diaryList,
      title: title,
      hintText: hintText,
      onPressedSubmitButton: (name) {
        context.read<DiaryListBloc>().add(
              UpdateDiaryListNameEvent(
                diaryList: diaryList,
                newName: name,
              ),
            );
      },
    );
  }
}
