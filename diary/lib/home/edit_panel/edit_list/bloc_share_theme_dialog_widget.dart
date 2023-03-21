import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/home/edit_panel/edit_list/bloc_share_theme_screen_widget.dart';
import 'package:diary/model/capital_cell.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:diary/model/diary_column.dart';
import 'package:diary/model/diary_list.dart';
import 'package:diary/services/diary_cell_service.dart';
import 'package:diary/services/diary_column_service.dart';
import 'package:diary/services/diary_list_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocShareThemeDialogWidget extends StatelessWidget {
  const BlocShareThemeDialogWidget({
    super.key,
    required this.diaryList,
    required this.diaryColumns,
    required this.diaryCells,
    required this.capitalCells,
  });

  final DiaryList diaryList;
  final List<DiaryColumn> diaryColumns;
  final List<DiaryCell> diaryCells;
  final List<CapitalCell> capitalCells;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => DiaryListService()),
        RepositoryProvider(create: (context) => DiaryColumnService()),
        RepositoryProvider(create: (context) => DiaryCellService()),
      ],
      child: BlocProvider(
        create: (context) => DiaryListBloc(
          RepositoryProvider.of<DiaryListService>(context),
          RepositoryProvider.of<DiaryColumnService>(context),
          RepositoryProvider.of<DiaryCellService>(context),
        ),
        child: BlocShareThemeScreenWidget(
          diaryList: diaryList,
          diaryColumns: diaryColumns,
          diaryCells: diaryCells,
          capitalCells: capitalCells,
        ),
      ),
    );
  }
}
