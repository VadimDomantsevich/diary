import 'package:diary/blocs/diary_cell_edit_bloc/diary_cell_edit_bloc.dart';
import 'package:diary/blocs/diary_list_bloc/diary_list_bloc.dart';
import 'package:diary/core/extentions.dart';
import 'package:diary/home_screen/edit_panel/edit_cells/widgets/fontsize_edit_widget.dart';
import 'package:diary/home_screen/edit_panel/widgets/edit_panel_text_widget.dart';
import 'package:diary/model/diary_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BlocFontSizeRowWidget extends StatelessWidget {
  const BlocFontSizeRowWidget({
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
            return FontSizeEditWidget(
              diaryList: diaryList,
              textWidget: EditPanelTextWidget.common(
                content: AppLocalizations.of(context).fontSize,
                color: diaryList.settings.themeBorderColor.toColor(),
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
            return FontSizeEditWidget(
              diaryList: diaryList,
              textWidget: EditPanelTextWidget.common(
                content: AppLocalizations.of(context).fontSize,
                color: diaryList.settings.themeBorderColor.toColor(),
              ),
              onPressedDown: () {
                context.read<DiaryListBloc>().add(
                      ChangeCapitalCellSettingsEvent(
                        fontSize: fontSize - 1,
                      ),
                    );
                context.read<DiaryCellEditBloc>().add(
                      ChangeCellEvent(fontSize: fontSize - 1),
                    );
              },
              onPressedUp: () {
                context.read<DiaryListBloc>().add(
                      ChangeCapitalCellSettingsEvent(
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
      },
    );
  }
}
