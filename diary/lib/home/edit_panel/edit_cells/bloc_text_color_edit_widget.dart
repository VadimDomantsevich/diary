import 'package:diary/core/constants/enums.dart';
import 'package:diary/core/extentions.dart';
import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/diary_list_screen/diary_cell_edit/diary_cell_edit_bloc.dart';
import 'package:diary/home/edit_panel/edit_cells/color_edit_widget.dart';
import 'package:diary/home/edit_panel/edit_panel_text_widget.dart';
import 'package:diary/model/diary_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BlocTextColorEditWidget extends StatelessWidget {
  const BlocTextColorEditWidget({
    super.key,
    required this.diaryList,
  });

  final DiaryList diaryList;

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
            return ColorEditWidget(
              textWidget: EditPanelTextWidget.common(
                content: AppLocalizations.of(context).textColor,
                color: diaryList.settings.themeBorderColor.toColor(),
              ),
              onTap: () {
                context.read<DiaryListBloc>().add(
                      const StartEditingColorEvent(),
                    );
                context.read<DiaryCellEditBloc>().add(
                      DiaryCellEditEvent.startColorEditing(
                        colorEditingEnum: ColorEditingEnum.text,
                        defaultColor: defaultTextSettings.color.toColor(),
                      ),
                    );
              },
              color: color,
              themeBorderColor: diaryList.settings.themeBorderColor.toColor(),
            );
          },
          capitalCellTextEditing: (
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
            defaultSettings,
          ) {
            return ColorEditWidget(
              textWidget: EditPanelTextWidget.common(
                content: AppLocalizations.of(context).textColor,
                color: diaryList.settings.themeBorderColor.toColor(),
              ),
              onTap: () {
                context.read<DiaryListBloc>().add(
                      const StartEditingColorEvent(),
                    );
                context.read<DiaryCellEditBloc>().add(
                      DiaryCellEditEvent.startColorEditing(
                        colorEditingEnum: ColorEditingEnum.text,
                        defaultColor:
                            defaultSettings.capitalCellTextColor.toColor(),
                      ),
                    );
              },
              color: color,
              themeBorderColor: diaryList.settings.themeBorderColor.toColor(),
            );
          },
          orElse: () => Container(),
        );
      },
    );
  }
}
