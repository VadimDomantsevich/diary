import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/home/edit_panel/edit_cells/textfield_widget.dart';
import 'package:diary/model/capital_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocTextFieldCapitalCellWidget extends StatelessWidget {
  const BlocTextFieldCapitalCellWidget({
    super.key,
    required this.capitalCell,
    required this.themeBorderColor,
    required this.themePanelBackgroundColor,
  });

  final CapitalCell capitalCell;
  final Color themeBorderColor;
  final Color themePanelBackgroundColor;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    controller.text = capitalCell.name;
    controller.selection = TextSelection.fromPosition(
      TextPosition(
        offset: controller.text.length,
      ),
    );
    return TextFieldWidget(
      controller: controller,
      onChanged: (value) => context.read<DiaryListBloc>().add(
            DiaryListEvent.changeCapitalCell(
              capitalCell: capitalCell,
              textFieldText: value,
            ),
          ),
      themeBorderColor: themeBorderColor,
      themePanelBackgroundColor: themePanelBackgroundColor,
    );
  }
}
