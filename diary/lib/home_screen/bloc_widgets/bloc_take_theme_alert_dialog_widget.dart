import 'package:auto_route/auto_route.dart';
import 'package:diary/blocs/diary_list_bloc/diary_list_bloc.dart';
import 'package:diary/home_screen/widgets/take_theme_alert_dialog_widget.dart';
import 'package:diary/model/list_theme.dart';
import 'package:diary/router/diary_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocTakeThemeAlertDialogWidget extends StatelessWidget {
  const BlocTakeThemeAlertDialogWidget({
    super.key,
    required this.listTheme,
  });

  final ListTheme listTheme;

  @override
  Widget build(BuildContext context) {
    return TakeThemeAlertDialogWidget(
      listTheme: listTheme,
      onPressedSubmitButton: (listTheme) {
        context.read<DiaryListBloc>().add(
              DiaryListEvent.takeTheme(
                listTheme: listTheme,
              ),
            );
        context.router.push(
          BlocHomeWidgetRoute(isThemeTaken: true),
        );
      },
    );
  }
}
