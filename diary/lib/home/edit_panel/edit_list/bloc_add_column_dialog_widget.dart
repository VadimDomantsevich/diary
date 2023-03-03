import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/diary_list_screen/diary_cell_edit/diary_cell_edit_bloc.dart';
import 'package:diary/home/edit_panel/edit_list/bloc_add_column_screen_widget.dart';
import 'package:diary/model/diary_column.dart';
import 'package:diary/model/diary_list.dart';
import 'package:diary/services/diary_cell_service.dart';
import 'package:diary/services/diary_column_service.dart';
import 'package:diary/services/diary_list_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocAddColumnDialogWidget extends StatelessWidget {
  const BlocAddColumnDialogWidget({
    super.key,
    required this.diaryList,
    required this.diaryColumns,
  });

  final DiaryList diaryList;
  final List<DiaryColumn> diaryColumns;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => DiaryListService()),
        RepositoryProvider(create: (context) => DiaryColumnService()),
        RepositoryProvider(create: (context) => DiaryCellService()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DiaryListBloc(
              RepositoryProvider.of<DiaryListService>(context),
              RepositoryProvider.of<DiaryColumnService>(context),
              RepositoryProvider.of<DiaryCellService>(context),
            ),
          ),
          BlocProvider(
            create: (context) => DiaryCellEditBloc(),
          ),
        ],
        child: BlocAddColumnScreenWidget(
          diaryList: diaryList,
          diaryColumns: diaryColumns,
        ),
      ),
    );
  }
}
