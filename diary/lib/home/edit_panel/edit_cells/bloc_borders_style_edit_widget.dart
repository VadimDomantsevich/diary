import 'package:diary/core/extentions.dart';
import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/diary_list_screen/diary_cell_edit/diary_cell_edit_bloc.dart';
import 'package:diary/home/edit_panel/edit_cells/borders_style_edit_widget.dart';
import 'package:diary/home/edit_panel/edit_panel_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BlocBordersStyleEditWidget extends StatelessWidget {
  const BlocBordersStyleEditWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryCellEditBloc, DiaryCellEditState>(
      builder: (context, state) => state.maybeWhen(
        bordersEditing: (bordersEditingEnum, bordersStyleEnum, bordersColor) {
          return BordersStyleEditWidget(
            textWidget: EditPanelTextWidget.common(
              content: AppLocalizations.of(context).bordersStyle,
            ),
            onTap: () {
              context.read<DiaryListBloc>().add(
                    const StartEditingBordersStyleEvent(),
                  );
            },
            borderLineHeight: bordersStyleEnum.toDoubleWidth(),
          );
        },
        orElse: () => Container(),
      ),
    );
  }
}
