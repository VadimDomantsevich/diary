import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/diary_list_screen/diary_cell_edit/diary_cell_edit_bloc.dart';
import 'package:diary/home/edit_panel/edit_cells/borders_edit_widget.dart';
import 'package:diary/home/edit_panel/edit_panel_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BlocBordersEditWidget extends StatelessWidget {
  const BlocBordersEditWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryCellEditBloc, DiaryCellEditState>(
        builder: (context, state) {
      return state.maybeWhen(
        cellEditing: (fillColor) {
          return BordersEditWidget(
            textWidget: EditPanelTextWidget.common(
              content: AppLocalizations.of(context).borders,
            ),
            onTap: () {
              context.read<DiaryListBloc>().add(
                    const StartEditingBordersEvent(),
                  );
              context.read<DiaryCellEditBloc>().add(
                    const DiaryCellEditEvent.startBordersEditing(),
                  );
            },
          );
        },
        orElse: () => Container(),
      );
    });
  }
}
