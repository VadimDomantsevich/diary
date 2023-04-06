import 'package:diary/blocs/diary_cell_edit_bloc/diary_cell_edit_bloc.dart';
import 'package:diary/blocs/diary_list_bloc/diary_list_bloc.dart';
import 'package:diary/core/constants/enums.dart';
import 'package:diary/core/extentions.dart';
import 'package:diary/home_screen/edit_panel/edit_cells/widgets/borders_edit_icons_column_widget.dart';
import 'package:diary/model/diary_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocBordersEditIconsColumnWidget extends StatelessWidget {
  const BlocBordersEditIconsColumnWidget({
    super.key,
    required this.diaryList,
  });

  final DiaryList diaryList;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryCellEditBloc, DiaryCellEditState>(
      builder: (context, state) {
        return state.maybeWhen(
          bordersEditing: (bordersEditingEnum, bordersStyleEnum, bordersColor) {
            return BordersEditIconsColumnWidget(
              themeColor: diaryList.settings.themeColor.toColor(),
              themeBorderColor: diaryList.settings.themeBorderColor.toColor(),
              isBorderAllSelected:
                  bordersEditingEnum == BordersEditingEnum.all ? true : false,
              isBorderOuterSelected:
                  bordersEditingEnum == BordersEditingEnum.outer ? true : false,
              isBorderInnerSelected:
                  bordersEditingEnum == BordersEditingEnum.inner ? true : false,
              isBorderVerticalSelected:
                  bordersEditingEnum == BordersEditingEnum.vertical
                      ? true
                      : false,
              isBorderHorizontalSelected:
                  bordersEditingEnum == BordersEditingEnum.horizontal
                      ? true
                      : false,
              isBorderLeftSelected:
                  bordersEditingEnum == BordersEditingEnum.left ? true : false,
              isBorderRightSelected:
                  bordersEditingEnum == BordersEditingEnum.right ? true : false,
              isBorderTopSelected:
                  bordersEditingEnum == BordersEditingEnum.top ? true : false,
              isBorderBottomSelected:
                  bordersEditingEnum == BordersEditingEnum.bottom
                      ? true
                      : false,
              isBorderClearSelected:
                  bordersEditingEnum == BordersEditingEnum.clear ? true : false,
              onPressed: (bordersEditingEnum) {
                context.read<DiaryListBloc>().add(
                      DiaryListEvent.changeDiaryCellsBordersSettings(
                        bordersEditingEnum: bordersEditingEnum,
                        bordersStyleEnum: bordersStyleEnum,
                        bordersColor: bordersColor,
                      ),
                    );
                context.read<DiaryCellEditBloc>().add(
                      DiaryCellEditEvent.changeBorders(
                        bordersEditingEnum: bordersEditingEnum,
                      ),
                    );
              },
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
