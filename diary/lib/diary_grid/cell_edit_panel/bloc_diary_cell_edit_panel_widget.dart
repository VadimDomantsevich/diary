import 'package:diary/diary_grid/cell_edit_panel/diary_cell_edit_panel.dart';
import 'package:diary/diary_grid/diary_cell_edit/diary_cell_edit_bloc.dart';
import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocDiaryCellEditPanel extends StatelessWidget {
  const BlocDiaryCellEditPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return BlocBuilder<DiaryListBloc, DiaryListState>(
        builder: ((context, state) {
      return state.maybeWhen(
          cellSelected: (diaryList, diaryColumns, diaryCells, selectedCell) {
            controller.text = selectedCell.content.toString();
            controller.selection = TextSelection.fromPosition(
                TextPosition(offset: controller.text.length));
            return DiaryCellEditPanel(
              diaryCell: selectedCell,
              controller: controller,
              onChanged: (p0) => context.read<DiaryListBloc>().add(
                    ChangeDiaryCellEvent(
                      diaryCell: selectedCell,
                      textFieldText: p0,
                    ),
                  ),
            );
          },
          orElse: () => Container());
    }));
    //final controller = TextEditingController();
    // return BlocBuilder<DiaryCellEditBloc, DiaryCellEditState>(
    //   builder: (context, state) => state.when(
    //       initial: (() => Container()),
    //       cellSelected: ((diaryCell) => DiaryCellEditPanel.model(
    //             diaryCell: diaryCell,
    //           )),
    //       editing: ((diaryCell) => DiaryCellEditPanel.model(
    //             diaryCell: diaryCell,
    //           )),
    //       cellsSelected: ((diaryCells) => Container())),
    // );
  }
}