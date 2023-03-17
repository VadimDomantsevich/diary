import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/home/edit_panel/edit_list/share_theme_screen_widget.dart';
import 'package:diary/model/capital_cell.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:diary/model/diary_column.dart';
import 'package:diary/model/diary_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BlocShareThemeScreenWidget extends StatelessWidget {
  const BlocShareThemeScreenWidget({
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
    return ShareThemeScreenWidget(
      title: AppLocalizations.of(context).shareTheme,
      themeNameHintText: AppLocalizations.of(context).themeName,
      descriptionHintText: AppLocalizations.of(context).description,
      onPressedSubmitButton: (themeName, description) {
        context.read<DiaryListBloc>().add(
              DiaryListEvent.shareTheme(
                diaryList: diaryList,
                diaryColumns: diaryColumns,
                diaryCells: diaryCells,
                capitalCells: capitalCells,
                themeName: themeName,
                description: description,
              ),
            );
      },
    );
  }
}
