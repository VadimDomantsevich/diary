import 'package:diary/core/functions.dart';
import 'package:diary/diary_grid/cell_edit_panel/textfield_widget.dart';
import 'package:diary/diary_grid/diary_cell_edit/diary_cell_edit_bloc.dart';
import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class BlocTextFieldWidget extends StatelessWidget {
  const BlocTextFieldWidget({
    super.key,
    required this.controller,
    required this.diaryCell,
  });

  final TextEditingController controller;
  final DiaryCell diaryCell;

  @override
  Widget build(BuildContext context) {
    // Он от блока вообще не зависит и нахуй не нужен пока
    return TextFieldWidget.cell(
      diaryCell: diaryCell,
      controller: controller,
      onChanged: (p0) => context.read<DiaryListBloc>().add(
            ChangeDiaryCellEvent(
              diaryCell: diaryCell,
              textFieldText: p0,
            ),
          ),
    );
    // return BlocBuilder<DiaryCellEditBloc, DiaryCellEditState>(
    //   builder: ((context, state) => state.maybeMap(
    //       cellSelected: (value) {
    //         return TextFieldWidget(diaryCell: value.diaryCell);
    //       },
    //       editing: (value) => TextFieldWidget(diaryCell: value.diaryCell),
    //       orElse: () => Container())),
    // );
  }
}
