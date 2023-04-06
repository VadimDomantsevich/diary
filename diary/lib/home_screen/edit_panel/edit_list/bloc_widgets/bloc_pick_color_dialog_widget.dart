import 'package:diary/blocs/diary_list_bloc/diary_list_bloc.dart';
import 'package:diary/core/constants/enums.dart';
import 'package:diary/home_screen/edit_panel/edit_list/bloc_widgets/bloc_pick_theme_color_alert_dialog.dart';
import 'package:diary/model/diary_list.dart';
import 'package:diary/services/diary_cell_service.dart';
import 'package:diary/services/diary_column_service.dart';
import 'package:diary/services/diary_list_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BlocPickColorDialogWidget extends StatelessWidget {
  const BlocPickColorDialogWidget({
    super.key,
    required this.diaryList,
    required this.themeColor,
    required this.color,
  });

  final DiaryList diaryList;
  final ThemeColorsEnum themeColor;
  final Color color;

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
        child: BlocPickThemeColorAlertDialog(
          diaryList: diaryList,
          themeColor: themeColor,
          title: AppLocalizations.of(context).pickColor,
          color: color,
        ),
      ),
    );
  }
}
