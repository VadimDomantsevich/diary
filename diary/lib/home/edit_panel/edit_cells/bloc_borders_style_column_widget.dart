import 'package:diary/core/constants/enums.dart';
import 'package:diary/core/extentions.dart';
import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/diary_list_screen/diary_cell_edit/diary_cell_edit_bloc.dart';
import 'package:diary/home/edit_panel/edit_cells/borders_style_row_widget.dart';
import 'package:diary/model/diary_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocBordersStyleColumnWidget extends StatelessWidget {
  const BlocBordersStyleColumnWidget({
    super.key,
    required this.diaryList,
  });

  final DiaryList diaryList;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryCellEditBloc, DiaryCellEditState>(
      builder: (context, state) => state.maybeWhen(
        bordersEditing: (bordersEditingEnum, bordersStyleEnum, bordersColor) {
          return Column(
            children: [
              BordersStyleRowWidget.thin(
                selectedStyle: bordersStyleEnum,
                onTap: () {
                  context.read<DiaryCellEditBloc>().add(
                        const DiaryCellEditEvent.changeBorders(
                          bordersStyleEnum: BordersStyleEnum.thin,
                        ),
                      );
                },
                themeColor: diaryList.settings.themeColor.toColor(),
                themeBorderColor: diaryList.settings.themeBorderColor.toColor(),
              ),
              BordersStyleRowWidget.medium(
                selectedStyle: bordersStyleEnum,
                onTap: () {
                  context.read<DiaryCellEditBloc>().add(
                        const DiaryCellEditEvent.changeBorders(
                          bordersStyleEnum: BordersStyleEnum.medium,
                        ),
                      );
                },
                themeColor: diaryList.settings.themeColor.toColor(),
                themeBorderColor: diaryList.settings.themeBorderColor.toColor(),
              ),
              BordersStyleRowWidget.thick(
                selectedStyle: bordersStyleEnum,
                onTap: () {
                  context.read<DiaryCellEditBloc>().add(
                        const DiaryCellEditEvent.changeBorders(
                          bordersStyleEnum: BordersStyleEnum.thick,
                        ),
                      );
                },
                themeColor: diaryList.settings.themeColor.toColor(),
                themeBorderColor: diaryList.settings.themeBorderColor.toColor(),
              ),
            ],
          );
        },
        capitalCellBordersEditing: (bordersStyleEnum, bordersColor) {
          return Column(
            children: [
              BordersStyleRowWidget.thin(
                selectedStyle: bordersStyleEnum,
                onTap: () {
                  context.read<DiaryCellEditBloc>().add(
                        const DiaryCellEditEvent.changeBorders(
                          bordersStyleEnum: BordersStyleEnum.thin,
                        ),
                      );
                  context.read<DiaryListBloc>().add(
                        DiaryListEvent.changeCapitalCellSettings(
                          bordersStyleEnum: BordersStyleEnum.thin,
                          bordersColor: bordersColor,
                        ),
                      );
                },
                themeColor: diaryList.settings.themeColor.toColor(),
                themeBorderColor: diaryList.settings.themeBorderColor.toColor(),
              ),
              BordersStyleRowWidget.medium(
                selectedStyle: bordersStyleEnum,
                onTap: () {
                  context.read<DiaryCellEditBloc>().add(
                        const DiaryCellEditEvent.changeBorders(
                          bordersStyleEnum: BordersStyleEnum.medium,
                        ),
                      );
                  context.read<DiaryListBloc>().add(
                        DiaryListEvent.changeCapitalCellSettings(
                          bordersStyleEnum: BordersStyleEnum.medium,
                          bordersColor: bordersColor,
                        ),
                      );
                },
                themeColor: diaryList.settings.themeColor.toColor(),
                themeBorderColor: diaryList.settings.themeBorderColor.toColor(),
              ),
              BordersStyleRowWidget.thick(
                selectedStyle: bordersStyleEnum,
                onTap: () {
                  context.read<DiaryCellEditBloc>().add(
                        const DiaryCellEditEvent.changeBorders(
                          bordersStyleEnum: BordersStyleEnum.thick,
                        ),
                      );
                  context.read<DiaryListBloc>().add(
                        DiaryListEvent.changeCapitalCellSettings(
                          bordersStyleEnum: BordersStyleEnum.thick,
                          bordersColor: bordersColor,
                        ),
                      );
                },
                themeColor: diaryList.settings.themeColor.toColor(),
                themeBorderColor: diaryList.settings.themeBorderColor.toColor(),
              ),
            ],
          );
        },
        orElse: () => Container(),
      ),
    );
  }
}
