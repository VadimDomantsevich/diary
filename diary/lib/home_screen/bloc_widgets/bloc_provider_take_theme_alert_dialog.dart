import 'package:diary/blocs/diary_list_bloc/diary_list_bloc.dart';
import 'package:diary/home_screen/bloc_widgets/bloc_take_theme_alert_dialog_widget.dart';
import 'package:diary/model/list_theme.dart';
import 'package:diary/services/diary_cell_service.dart';
import 'package:diary/services/diary_column_service.dart';
import 'package:diary/services/diary_list_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProviderTakeThemeAlertDialog extends StatelessWidget {
  const BlocProviderTakeThemeAlertDialog({
    super.key,
    required this.listTheme,
  });

  final ListTheme listTheme;

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
        child: BlocTakeThemeAlertDialogWidget(
          listTheme: listTheme,
        ),
      ),
    );
  }
}
