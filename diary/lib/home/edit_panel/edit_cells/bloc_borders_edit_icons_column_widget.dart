import 'package:diary/core/constants/enums.dart';
import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/diary_list_screen/diary_cell_edit/diary_cell_edit_bloc.dart';
import 'package:diary/home/edit_panel/edit_cells/borders_edit_icons_column_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocBordersEditIconsColumnWidget extends StatelessWidget {
  const BlocBordersEditIconsColumnWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryCellEditBloc, DiaryCellEditState>(
      builder: (context, state) {
        return state.maybeWhen(
          bordersEditing: (bordersEditingEnum, bordersStyleEnum, bordersColor) {
            return BordersEditIconsColumnWidget(
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
