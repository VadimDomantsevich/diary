import 'package:diary/core/constants/enums.dart';
import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/diary_list_screen/diary_cell_edit/diary_cell_edit_bloc.dart';
import 'package:diary/home/edit_panel/edit_cells/borders_style_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocBordersStyleColumnWidget extends StatelessWidget {
  const BlocBordersStyleColumnWidget({super.key});

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
              ),
            ],
          );
        },
        orElse: () => Container(),
      ),
    );
  }
}
