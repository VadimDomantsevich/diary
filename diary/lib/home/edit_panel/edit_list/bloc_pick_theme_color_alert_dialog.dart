import 'package:diary/core/constants/enums.dart';
import 'package:diary/core/extentions.dart';
import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/home/edit_panel/edit_list/pick_color_alert_dialog.dart';
import 'package:diary/model/diary_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocPickThemeColorAlertDialog extends StatelessWidget {
  const BlocPickThemeColorAlertDialog({
    super.key,
    required this.title,
    required this.color,
    required this.diaryList,
    required this.themeColor,
  });

  final DiaryList diaryList;
  final String title;
  final Color color;
  final ThemeColorsEnum themeColor;

  @override
  Widget build(BuildContext context) {
    return PickColorAlertDialog(
      diaryList: diaryList,
      title: title,
      color: color,
      onPressedSubmitButton: (color) {
        switch (themeColor) {
          case ThemeColorsEnum.themeColor:
            context.read<DiaryListBloc>().add(
                  DiaryListEvent.updateDiaryListSettings(
                    diaryList: diaryList,
                    themeColor: color.toColorString(),
                  ),
                );
            break;
          case ThemeColorsEnum.themeBorderColor:
            context.read<DiaryListBloc>().add(
                  DiaryListEvent.updateDiaryListSettings(
                    diaryList: diaryList,
                    themeBorderColor: color.toColorString(),
                  ),
                );
            break;
          case ThemeColorsEnum.themePanelBackgroundColor:
            context.read<DiaryListBloc>().add(
                  DiaryListEvent.updateDiaryListSettings(
                    diaryList: diaryList,
                    themePanelBackgroundColor: color.toColorString(),
                  ),
                );
            break;
        }
      },
    );
  }
}
