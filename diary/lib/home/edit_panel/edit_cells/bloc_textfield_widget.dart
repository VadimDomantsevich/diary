import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/home/edit_panel/edit_cells/textfield_widget.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocTextFieldWidget extends StatelessWidget {
  const BlocTextFieldWidget({
    super.key,
    required this.diaryCell,
    required this.themeBorderColor,
    required this.themePanelBackgroundColor,
  });

  final DiaryCell diaryCell;
  final Color themeBorderColor;
  final Color themePanelBackgroundColor;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    controller.text = diaryCell.content.toString();
    controller.selection = TextSelection.fromPosition(
      TextPosition(
        offset: controller.text.length,
      ),
    );
    return TextFieldWidget(
      controller: controller,
      onChanged: (value) => context.read<DiaryListBloc>().add(
            DiaryListEvent.changeDiaryCell(
              diaryCell: diaryCell,
              textFieldText: value,
            ),
          ),
          themeBorderColor: themeBorderColor,
          themePanelBackgroundColor: themePanelBackgroundColor,
    );
  }
}
