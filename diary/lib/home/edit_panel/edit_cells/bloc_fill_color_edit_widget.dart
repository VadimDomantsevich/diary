import 'package:diary/core/constants/enums.dart';
import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/diary_list_screen/diary_cell_edit/diary_cell_edit_bloc.dart';
import 'package:diary/home/edit_panel/edit_cells/color_edit_widget.dart';
import 'package:diary/home/edit_panel/edit_panel_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BlocFillColorEditWidget extends StatelessWidget {
  const BlocFillColorEditWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryCellEditBloc, DiaryCellEditState>(
      builder: (context, state) {
        return state.maybeWhen(
          cellEditing: (fillColor) {
            return ColorEditWidget(
              textWidget: EditPanelTextWidget.common(
                content: AppLocalizations.of(context).fillColor,
              ),
              onTap: () {
                context.read<DiaryListBloc>().add(
                      const StartEditingColorEvent(),
                    );
                context.read<DiaryCellEditBloc>().add(
                      DiaryCellEditEvent.startColorEditing(
                        colorEditingEnum: ColorEditingEnum.fill,
                        defaultColor: fillColor,
                      ),
                    );
              },
              color: fillColor,
            );
          },
          orElse: () {
            return Container();
          },
        );
      },
    );
  }
}
