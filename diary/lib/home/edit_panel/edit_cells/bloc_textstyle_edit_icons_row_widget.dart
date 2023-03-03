import 'package:diary/core/constants/enums.dart';
import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/diary_list_screen/diary_cell_edit/diary_cell_edit_bloc.dart';
import 'package:diary/home/edit_panel/edit_cells/textstyle_edit_icons_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocTextStyleEditIconsRowWidget extends StatelessWidget {
  const BlocTextStyleEditIconsRowWidget({
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
            return TextStyleEditIconsRowWidget(
              isBoldSelected: isBold ? true : false,
              onPressedBoldIcon: () {
                final fontWeight =
                    isBold ? FontWeightEnum.normal : FontWeightEnum.bold;
                context.read<DiaryListBloc>().add(
                      ChangeDiaryCellsSettingsEvent(
                        fontWeight: fontWeight,
                      ),
                    );
                context.read<DiaryCellEditBloc>().add(
                      ChangeCellEvent(
                        fontWeight: fontWeight,
                      ),
                    );
              },
              isItalicSelected: isItalic ? true : false,
              onPressedItalicIcon: () {
                final fontStyle =
                    isItalic ? FontStyleEnum.normal : FontStyleEnum.italic;
                context.read<DiaryListBloc>().add(
                      ChangeDiaryCellsSettingsEvent(
                        fontStyle: fontStyle,
                      ),
                    );
                context.read<DiaryCellEditBloc>().add(
                      ChangeCellEvent(
                        fontStyle: fontStyle,
                      ),
                    );
              },
              isUnderlineSelected: isUnderline ? true : false,
              onPressedUnderlineIcon: () {
                final textDecoration = isUnderline
                    ? TextDecorationEnum.none
                    : TextDecorationEnum.underline;
                context.read<DiaryListBloc>().add(
                      ChangeDiaryCellsSettingsEvent(
                        textDecoration: textDecoration,
                      ),
                    );
                context.read<DiaryCellEditBloc>().add(
                      ChangeCellEvent(
                        textDecoration: textDecoration,
                      ),
                    );
              },
              isLineThroughSelected: isLineThrough ? true : false,
              onPressedLineThroughIcon: () {
                final textDecoration = isLineThrough
                    ? TextDecorationEnum.none
                    : TextDecorationEnum.lineThrough;
                context.read<DiaryListBloc>().add(
                      ChangeDiaryCellsSettingsEvent(
                        textDecoration: textDecoration,
                      ),
                    );
                context.read<DiaryCellEditBloc>().add(
                      ChangeCellEvent(
                        textDecoration: textDecoration,
                      ),
                    );
              },
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
            return TextStyleEditIconsRowWidget(
              isBoldSelected: isBold ? true : false,
              onPressedBoldIcon: () {
                final fontWeight =
                    isBold ? FontWeightEnum.normal : FontWeightEnum.bold;
                context.read<DiaryListBloc>().add(
                      ChangeCapitalCellSettingsEvent(
                        fontWeight: fontWeight,
                      ),
                    );
                context.read<DiaryCellEditBloc>().add(
                      ChangeCellEvent(
                        fontWeight: fontWeight,
                      ),
                    );
              },
              isItalicSelected: isItalic ? true : false,
              onPressedItalicIcon: () {
                final fontStyle =
                    isItalic ? FontStyleEnum.normal : FontStyleEnum.italic;
                context.read<DiaryListBloc>().add(
                      ChangeCapitalCellSettingsEvent(
                        fontStyle: fontStyle,
                      ),
                    );
                context.read<DiaryCellEditBloc>().add(
                      ChangeCellEvent(
                        fontStyle: fontStyle,
                      ),
                    );
              },
              isUnderlineSelected: isUnderline ? true : false,
              onPressedUnderlineIcon: () {
                final textDecoration = isUnderline
                    ? TextDecorationEnum.none
                    : TextDecorationEnum.underline;
                context.read<DiaryListBloc>().add(
                      ChangeCapitalCellSettingsEvent(
                        textDecoration: textDecoration,
                      ),
                    );
                context.read<DiaryCellEditBloc>().add(
                      ChangeCellEvent(
                        textDecoration: textDecoration,
                      ),
                    );
              },
              isLineThroughSelected: isLineThrough ? true : false,
              onPressedLineThroughIcon: () {
                final textDecoration = isLineThrough
                    ? TextDecorationEnum.none
                    : TextDecorationEnum.lineThrough;
                context.read<DiaryListBloc>().add(
                      ChangeCapitalCellSettingsEvent(
                        textDecoration: textDecoration,
                      ),
                    );
                context.read<DiaryCellEditBloc>().add(
                      ChangeCellEvent(
                        textDecoration: textDecoration,
                      ),
                    );
              },
            );
          },
          orElse: () => Container(),
        );
      },
    );
  }
}
