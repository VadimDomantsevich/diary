import 'package:diary/diary_cell_edit_screen/dropdown_alignment_widget.dart';
import 'package:diary/diary_list_screen/diary_cell_edit/diary_cell_edit_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocDropdownAlignmentWidget extends StatelessWidget {
  const BlocDropdownAlignmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryCellEditBloc, DiaryCellEditState>(
      builder: (context, state) {
        return state.maybeWhen(
          cellSelected: ((diaryList, diaryCell) {
            return DropdownAlignmentWidget.allAlignments(
              context: context,
              onChanged: (p0) => context.read<DiaryCellEditBloc>().add(
                    ChangeCellAlignmentEvent(
                      diaryList: diaryList,
                      diaryCell: diaryCell,
                      alignment: p0!,
                    ),
                  ),
            );
          }),
          editing: ((diaryList, diaryCell) {
            return DropdownAlignmentWidget.allAlignments(
              context: context,
              onChanged: (p0) => context.read<DiaryCellEditBloc>().add(
                    ChangeCellAlignmentEvent(
                      diaryList: diaryList,
                      diaryCell: diaryCell,
                      alignment: p0!,
                    ),
                  ),
            );
          }),
          orElse: () => Container(),
        );
      },
    );
  }
}
