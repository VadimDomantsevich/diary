import 'package:diary/blocs/diary_cell_edit_bloc/diary_cell_edit_bloc.dart';
import 'package:diary/blocs/diary_list_bloc/diary_list_bloc.dart';
import 'package:diary/core/constants/enums.dart';
import 'package:diary/core/extentions.dart';
import 'package:diary/home_screen/edit_panel/edit_cells/widgets/alignment_edit_icons_row_widget.dart';
import 'package:diary/model/diary_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocAlignmentEditIconsRowWidget extends StatelessWidget {
  const BlocAlignmentEditIconsRowWidget({
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
              return AlignmentEditIconsRowWidget(
                themeColor: diaryList.settings.themeColor.toColor(),
                themeBorderColor: diaryList.settings.themeBorderColor.toColor(),
                isHorizontalLeft: isHorizontalLeft ? true : false,
                onPressedHorizontalLeftIcon: () {
                  const horizontalAlignment = HorizontalAlignmentsEnum.left;
                  context.read<DiaryListBloc>().add(
                        const ChangeDiaryCellsSettingsEvent(
                          horizontalAlignment: horizontalAlignment,
                        ),
                      );
                  context.read<DiaryCellEditBloc>().add(
                        const ChangeCellEvent(
                          horizontalAlignment: horizontalAlignment,
                        ),
                      );
                },
                isHorizontalCenter: isHorizontalCenter ? true : false,
                onPressedHorizontalCenterIcon: () {
                  const horizontalAlignment = HorizontalAlignmentsEnum.center;
                  context.read<DiaryListBloc>().add(
                        const ChangeDiaryCellsSettingsEvent(
                          horizontalAlignment: horizontalAlignment,
                        ),
                      );
                  context.read<DiaryCellEditBloc>().add(
                        const ChangeCellEvent(
                          horizontalAlignment: horizontalAlignment,
                        ),
                      );
                },
                isHorizontalRight: isHorizontalRight ? true : false,
                onPressedHorizontalRightIcon: () {
                  const horizontalAlignment = HorizontalAlignmentsEnum.right;
                  context.read<DiaryListBloc>().add(
                        const ChangeDiaryCellsSettingsEvent(
                          horizontalAlignment: horizontalAlignment,
                        ),
                      );
                  context.read<DiaryCellEditBloc>().add(
                        const ChangeCellEvent(
                          horizontalAlignment: horizontalAlignment,
                        ),
                      );
                },
                isVerticalTop: isVerticalTop ? true : false,
                onPressedVerticalTopIcon: () {
                  const verticalAlignment = VerticalAlignmentsEnum.top;
                  context.read<DiaryListBloc>().add(
                        const ChangeDiaryCellsSettingsEvent(
                          verticalAlignment: verticalAlignment,
                        ),
                      );
                  context.read<DiaryCellEditBloc>().add(
                        const ChangeCellEvent(
                          verticalAlignment: verticalAlignment,
                        ),
                      );
                },
                isVerticalCenter: isVerticalCenter ? true : false,
                onPressedVerticalCenterIcon: () {
                  const verticalAlignment = VerticalAlignmentsEnum.center;
                  context.read<DiaryListBloc>().add(
                        const ChangeDiaryCellsSettingsEvent(
                          verticalAlignment: verticalAlignment,
                        ),
                      );
                  context.read<DiaryCellEditBloc>().add(
                        const ChangeCellEvent(
                          verticalAlignment: verticalAlignment,
                        ),
                      );
                },
                isVerticalBottom: isVerticalBottom ? true : false,
                onPressedVerticalBottomIcon: () {
                  const verticalAlignment = VerticalAlignmentsEnum.bottom;
                  context.read<DiaryListBloc>().add(
                        const ChangeDiaryCellsSettingsEvent(
                          verticalAlignment: verticalAlignment,
                        ),
                      );
                  context.read<DiaryCellEditBloc>().add(
                        const ChangeCellEvent(
                          verticalAlignment: verticalAlignment,
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
              return AlignmentEditIconsRowWidget(
                themeColor: diaryList.settings.themeColor.toColor(),
                themeBorderColor: diaryList.settings.themeBorderColor.toColor(),
                isHorizontalLeft: isHorizontalLeft ? true : false,
                onPressedHorizontalLeftIcon: () {
                  const horizontalAlignment = HorizontalAlignmentsEnum.left;
                  context.read<DiaryListBloc>().add(
                        const ChangeCapitalCellSettingsEvent(
                          horizontalAlignment: horizontalAlignment,
                        ),
                      );
                  context.read<DiaryCellEditBloc>().add(
                        const ChangeCellEvent(
                          horizontalAlignment: horizontalAlignment,
                        ),
                      );
                },
                isHorizontalCenter: isHorizontalCenter ? true : false,
                onPressedHorizontalCenterIcon: () {
                  const horizontalAlignment = HorizontalAlignmentsEnum.center;
                  context.read<DiaryListBloc>().add(
                        const ChangeCapitalCellSettingsEvent(
                          horizontalAlignment: horizontalAlignment,
                        ),
                      );
                  context.read<DiaryCellEditBloc>().add(
                        const ChangeCellEvent(
                          horizontalAlignment: horizontalAlignment,
                        ),
                      );
                },
                isHorizontalRight: isHorizontalRight ? true : false,
                onPressedHorizontalRightIcon: () {
                  const horizontalAlignment = HorizontalAlignmentsEnum.right;
                  context.read<DiaryListBloc>().add(
                        const ChangeCapitalCellSettingsEvent(
                          horizontalAlignment: horizontalAlignment,
                        ),
                      );
                  context.read<DiaryCellEditBloc>().add(
                        const ChangeCellEvent(
                          horizontalAlignment: horizontalAlignment,
                        ),
                      );
                },
                isVerticalTop: isVerticalTop ? true : false,
                onPressedVerticalTopIcon: () {
                  const verticalAlignment = VerticalAlignmentsEnum.top;
                  context.read<DiaryListBloc>().add(
                        const ChangeCapitalCellSettingsEvent(
                          verticalAlignment: verticalAlignment,
                        ),
                      );
                  context.read<DiaryCellEditBloc>().add(
                        const ChangeCellEvent(
                          verticalAlignment: verticalAlignment,
                        ),
                      );
                },
                isVerticalCenter: isVerticalCenter ? true : false,
                onPressedVerticalCenterIcon: () {
                  const verticalAlignment = VerticalAlignmentsEnum.center;
                  context.read<DiaryListBloc>().add(
                        const ChangeCapitalCellSettingsEvent(
                          verticalAlignment: verticalAlignment,
                        ),
                      );
                  context.read<DiaryCellEditBloc>().add(
                        const ChangeCellEvent(
                          verticalAlignment: verticalAlignment,
                        ),
                      );
                },
                isVerticalBottom: isVerticalBottom ? true : false,
                onPressedVerticalBottomIcon: () {
                  const verticalAlignment = VerticalAlignmentsEnum.bottom;
                  context.read<DiaryListBloc>().add(
                        const ChangeCapitalCellSettingsEvent(
                          verticalAlignment: verticalAlignment,
                        ),
                      );
                  context.read<DiaryCellEditBloc>().add(
                        const ChangeCellEvent(
                          verticalAlignment: verticalAlignment,
                        ),
                      );
                },
              );
            },
            orElse: () => Container());
      },
    );
  }
}
