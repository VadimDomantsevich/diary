import 'package:diary/core/functions.dart';
import 'package:diary/diary_cell_edit_screen/cell_edit_screen_widget.dart';
import 'package:diary/diary_list_screen/diary_cell_edit/diary_cell_edit_bloc.dart';
import 'package:diary/diary_list_screen/diary_cell_widget.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:diary/model/diary_list.dart';
import 'package:diary/services/diary_cell_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocCellEditScreenWidget extends StatelessWidget {
  const BlocCellEditScreenWidget({
    super.key,
    required this.diaryCell,
    required this.diaryList,
  });

  final DiaryList diaryList;
  final DiaryCell diaryCell;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => DiaryCellService(),
      child: BlocProvider(
        create: (context) => DiaryCellEditBloc(
          RepositoryProvider.of<DiaryCellService>(context),
          diaryCell,
          diaryList,
        ),
        child: BlocBuilder<DiaryCellEditBloc, DiaryCellEditState>(
          builder: (context, state) {
            return state.map(
              //будут и другие стейты, тип изменения сразу нескольких ячеек
              cellSelected: (value) {
                return CellEditScreenWidget(
                  diaryCell: DiaryCellWidget.common(
                    height: value.diaryCell.settings.height,
                    cellKey: GlobalObjectKey(value.diaryCell),
                    alignment: converterAlignmentFromAlignmentsEnum(
                      value.diaryCell.settings.alignment,
                    ),
                    content: diaryCell.content.toString(),
                    onTap: () {},
                    scaleFactor: 1,
                  ),
                );
              },
              editing: (value) {
                return CellEditScreenWidget(
                  diaryCell: DiaryCellWidget.common(
                    height: value.diaryCell.settings.height,
                    cellKey: GlobalObjectKey(value.diaryCell),
                    alignment: converterAlignmentFromAlignmentsEnum(
                      value.diaryCell.settings.alignment,
                    ),
                    content: diaryCell.content.toString(),
                    onTap: () {},
                    scaleFactor: 1,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
