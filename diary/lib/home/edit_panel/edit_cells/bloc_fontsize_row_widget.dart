import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/diary_list_screen/diary_cell_edit/diary_cell_edit_bloc.dart';
import 'package:diary/home/edit_panel/edit_cells/fontsize_edit_widget.dart';
import 'package:diary/home/edit_panel/edit_panel_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BlocFontSizeRowWidget extends StatelessWidget {
  const BlocFontSizeRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryCellEditBloc, DiaryCellEditState>(
        builder: (context, state) {
      return state.maybeWhen(
        textEditing: (
          isBold,
          isItalic,
          isUnderline,
          isLineThrough,
          fontSize,
          color,
          isHorizontalLeft,
          isHorizontalCenter,
          isHorizontalRight,
          isVerticalTop,
          isVerticalCenter,
          isVerticalBottom,
          defaultTextSettings,
          defaultSettings,
        ) {
          return FontSizeEditWidget(
            textWidget: EditPanelTextWidget.common(
              content: AppLocalizations.of(context).fontSize,
            ),
            onPressedDown: () {
              context.read<DiaryListBloc>().add(
                    ChangeDiaryCellsSettingsEvent(
                      fontSize: fontSize - 1,
                    ),
                  );
              context.read<DiaryCellEditBloc>().add(
                    ChangeCellEvent(fontSize: fontSize - 1),
                  );
            },
            onPressedUp: () {
              context.read<DiaryListBloc>().add(
                    ChangeDiaryCellsSettingsEvent(
                      fontSize: fontSize + 1,
                    ),
                  );
              context.read<DiaryCellEditBloc>().add(
                    ChangeCellEvent(fontSize: fontSize + 1),
                  );
            },
            fontSize: fontSize.toInt(),
          );
        },
        orElse: () => Container(),
      );
    });
  }
}
