import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/diary_list_screen/cell_edit_panel/diary_cell_edit_panel.dart';
import 'package:diary/diary_list_screen/diary_cell_edit/diary_cell_edit_bloc.dart';
import 'package:diary/services/diary_cell_service.dart';
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
          cellsSelected: (diaryList, diaryColumns, diaryCells,
              firstSelectedCell, selectedCells, cellsKeys, lists,) {
            controller.text = firstSelectedCell.content.toString();
            controller.selection = TextSelection.fromPosition(
                TextPosition(offset: controller.text.length));
            return BlocProvider(
              create: (context) => DiaryCellEditBloc(
                RepositoryProvider.of<DiaryCellService>(context),
                firstSelectedCell,
                diaryList,
              ),
              child: DiaryCellEditPanel(
                diaryCell: firstSelectedCell,
                controller: controller,
                onChanged: (p0) => context.read<DiaryListBloc>().add(
                      ChangeDiaryCellEvent(
                        diaryCell: firstSelectedCell,
                        textFieldText: p0,
                      ),
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
