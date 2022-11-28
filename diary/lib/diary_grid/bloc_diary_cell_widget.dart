import 'package:diary/diary_grid/diary_cell_edit/diary_cell_edit_bloc.dart';
import 'package:diary/diary_grid/diary_cell_widget.dart';
import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocDiaryCellWidget extends StatelessWidget {
  const BlocDiaryCellWidget({
    super.key,
    required this.diaryCell,
    this.textFieldText,
  });

  final DiaryCell diaryCell;
  final String? textFieldText;

  @override
  Widget build(BuildContext context) => DiaryCellWidget.model(
        //Selected diaryCell
        diaryCell: diaryCell,
        onTap: () {
          textFieldText != null
              ? context.read<DiaryListBloc>().add(
                    DiaryListEvent.selectDiaryCell(
                      diaryCell: diaryCell,
                    ),
                  )
              : context.read<DiaryListBloc>().add(
                    DiaryListEvent.selectDiaryCell(
                      diaryCell: diaryCell,
                    ),
                  ); //А сюда то и не передать никак эту строку
        },
      );

  //How to build selected cell?
}
