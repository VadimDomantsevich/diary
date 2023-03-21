import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/home/edit_panel/edit_list/bloc_delete_column_alert_dialog.dart';
import 'package:diary/model/diary_column.dart';
import 'package:diary/model/diary_list.dart';
import 'package:diary/services/diary_cell_service.dart';
import 'package:diary/services/diary_column_service.dart';
import 'package:diary/services/diary_list_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BlocDeleteColumnDialogWidget extends StatelessWidget {
  const BlocDeleteColumnDialogWidget({
    super.key,
    required this.diaryList,
    required this.diaryColumn,
  });

  final DiaryList diaryList;
  final DiaryColumn diaryColumn;

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
        child: BlocDeleteColumnAlertDialog(
          title: AppLocalizations.of(context).deleteColumn,
          diaryColumn: diaryColumn,
          diaryList: diaryList,
        ),
      ),
    );
  }
}
