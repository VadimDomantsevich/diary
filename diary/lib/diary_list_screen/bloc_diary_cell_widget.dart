import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/diary_list_screen/diary_cell_widget.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocDiaryCellWidget extends StatelessWidget {
  const BlocDiaryCellWidget({
    super.key,
    required this.diaryCell,
  });

  final DiaryCell diaryCell;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<DiaryListBloc, DiaryListState>(
        builder: (context, state) {
          return state.maybeWhen(
            cellSelected: (diaryList, diaryColumns, diaryCells, selectedCell) {
              bool isSelected = false;
              if (selectedCell == diaryCell) {
                isSelected = true;
              }
              return DiaryCellWidget.model(
                isSelected: isSelected,
                diaryCell: diaryCell,
                onTap: () => context.read<DiaryListBloc>().add(
                      DiaryListEvent.selectDiaryCell(
                        diaryCell: diaryCell,
                      ),
                    ),
              );
            },
            orElse: (() {
              return DiaryCellWidget.model(
                isSelected: false,
                diaryCell: diaryCell,
                onTap: () => context.read<DiaryListBloc>().add(
                      DiaryListEvent.selectDiaryCell(
                        diaryCell: diaryCell,
                      ),
                    ),
              );
            }),
          );
        },
      );

  //How to build selected cell?
}
