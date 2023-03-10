import 'package:diary/core/extentions.dart';
import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/diary_list_screen/diary_cell_edit/diary_cell_edit_bloc.dart';
import 'package:diary/home/edit_panel/edit_cells/borders_edit_widget.dart';
import 'package:diary/home/edit_panel/edit_panel_text_widget.dart';
import 'package:diary/model/diary_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BlocBordersEditWidget extends StatelessWidget {
  const BlocBordersEditWidget({
    super.key,
    required this.diaryList,
  });

  final DiaryList diaryList;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryCellEditBloc, DiaryCellEditState>(
        builder: (context, state) {
      return state.maybeWhen(
        cellEditing: (fillColor) {
          return BordersEditWidget(
            textWidget: EditPanelTextWidget.common(
              content: AppLocalizations.of(context).borders,
              color: diaryList.settings.themeBorderColor.toColor(),
            ),
            onTap: () {
              context.read<DiaryListBloc>().add(
                    const StartEditingBordersEvent(),
                  );
              context.read<DiaryCellEditBloc>().add(
                    const DiaryCellEditEvent.startBordersEditing(),
                  );
            },
            themeBorderColor: diaryList.settings.themeBorderColor.toColor(),
          );
        },
        capitalCellEditing: (capitalCell) {
          return BordersEditWidget(
            textWidget: EditPanelTextWidget.common(
              content: AppLocalizations.of(context).borders,
              color: diaryList.settings.themeBorderColor.toColor(),
            ),
            onTap: () {
              context.read<DiaryListBloc>().add(
                    const StartEditingBordersEvent(),
                  );
              context.read<DiaryCellEditBloc>().add(
                    DiaryCellEditEvent.startCapitalCellBordersEditing(
                      capitalCell: capitalCell,
                    ),
                  );
            },
            themeBorderColor: diaryList.settings.themeBorderColor.toColor(),
          );
        },
        orElse: () => Container(),
      );
    });
  }
}
