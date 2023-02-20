import 'package:diary/core/constants/enums.dart';
import 'package:diary/core/extentions.dart';
import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/diary_list_screen/diary_cell_edit/diary_cell_edit_bloc.dart';
import 'package:diary/home/edit_panel/edit_cells/list_tile_row_widget.dart';
import 'package:diary/home/edit_panel/edit_panel_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BlocClearFormattingRowWidget extends StatelessWidget {
  const BlocClearFormattingRowWidget({
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
            return ListTileRowWidget.clearFormatting(
              onTap: () {
                context.read<DiaryCellEditBloc>().add(
                      ChangeCellEvent(
                        color: defaultTextSettings.color,
                        fontWeight: defaultTextSettings.fontWeight,
                        textDecoration: defaultTextSettings.textDecoration,
                        fontStyle: defaultTextSettings.fontStyle,
                        fontSize: defaultTextSettings.fontSize,
                        horizontalAlignment: defaultTextSettings.alignment
                            .toHorizontalAlignmentsEnum(),
                        verticalAlignment: defaultTextSettings.alignment
                            .toVerticalAlignmentsEnum(),
                      ),
                    );
                context.read<DiaryListBloc>().add(
                      DiaryListEvent.changeDiaryCellsSettings(
                        fontWeight: defaultTextSettings.fontWeight,
                        textDecoration: defaultTextSettings.textDecoration,
                        fontStyle: defaultTextSettings.fontStyle,
                        fontSize: defaultTextSettings.fontSize,
                        horizontalAlignment: defaultTextSettings.alignment
                            .toHorizontalAlignmentsEnum(),
                        verticalAlignment: defaultTextSettings.alignment
                            .toVerticalAlignmentsEnum(),
                        color: defaultTextSettings.color,
                        backgroundColor: defaultSettings.backgroundColor,
                      ),
                    );
                context.read<DiaryListBloc>().add(
                      ChangeDiaryCellsBordersSettingsEvent(
                        bordersEditingEnum: BordersEditingEnum.clear,
                        bordersStyleEnum: BordersStyleEnum.medium,
                        bordersColor: defaultSettings.topBorderColor.toColor(),
                      ),
                    );
              },
              textWidget: EditPanelTextWidget.common(
                content: AppLocalizations.of(context).clearFormatting,
              ),
            );
          },
          orElse: () => Container(),
        );
      },
    );
  }
}
