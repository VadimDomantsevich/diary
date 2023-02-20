import 'package:diary/core/constants/enums.dart';
import 'package:diary/core/extentions.dart';
import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/diary_list_screen/diary_cell_edit/diary_cell_edit_bloc.dart';
import 'package:diary/home/edit_panel/edit_cells/main_color_containers_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocMainColorContainersRowWidget extends StatelessWidget {
  const BlocMainColorContainersRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryCellEditBloc, DiaryCellEditState>(
      builder: (context, state) {
        return state.maybeWhen(
          colorEditing: (colorEditingEnum, mainColor, selectedColor,
              defaultColor, bordersEditingEnum, bordersStyleEnum) {
            textColorEditing(Color color) {
              context.read<DiaryListBloc>().add(
                    ChangeDiaryCellsSettingsEvent(
                      color: color.toColorString(),
                    ),
                  );
            }

            fillColorEditing(Color color) {
              context.read<DiaryListBloc>().add(
                    ChangeDiaryCellsSettingsEvent(
                      backgroundColor: color.toColorString(),
                    ),
                  );
            }

            bordersColorEditing(Color color) {
              context.read<DiaryListBloc>().add(
                    ChangeDiaryCellsBordersSettingsEvent(
                      bordersEditingEnum:
                          bordersEditingEnum ?? BordersEditingEnum.none,
                      bordersStyleEnum:
                          bordersStyleEnum ?? BordersStyleEnum.thin,
                      bordersColor: color,
                    ),
                  );
            }

            return MainColorContainersRowWidget(
              selectedMainColor: mainColor,
              onTapBlack: () {
                Color color = MainColorsEnum.black.toColor();
                context.read<DiaryCellEditBloc>().add(
                      const ChangeColorEvent(
                        mainColor: MainColorsEnum.black,
                      ),
                    );
                switch (colorEditingEnum) {
                  case ColorEditingEnum.text:
                    textColorEditing(color);
                    break;
                  case ColorEditingEnum.fill:
                    fillColorEditing(color);
                    break;
                  case ColorEditingEnum.border:
                    bordersColorEditing(color);
                    break;
                }
              },
              onTapRed: () {
                Color color = MainColorsEnum.red.toColor();
                context.read<DiaryCellEditBloc>().add(
                      const ChangeColorEvent(
                        mainColor: MainColorsEnum.red,
                      ),
                    );
                switch (colorEditingEnum) {
                  case ColorEditingEnum.text:
                    textColorEditing(color);
                    break;
                  case ColorEditingEnum.fill:
                    fillColorEditing(color);
                    break;
                  case ColorEditingEnum.border:
                    bordersColorEditing(color);
                    break;
                }
              },
              onTapOrange: () {
                Color color = MainColorsEnum.orange.toColor();
                context.read<DiaryCellEditBloc>().add(
                      const ChangeColorEvent(
                        mainColor: MainColorsEnum.orange,
                      ),
                    );
                switch (colorEditingEnum) {
                  case ColorEditingEnum.text:
                    textColorEditing(color);
                    break;
                  case ColorEditingEnum.fill:
                    fillColorEditing(color);
                    break;
                  case ColorEditingEnum.border:
                    bordersColorEditing(color);
                    break;
                }
              },
              onTapYellow: () {
                Color color = MainColorsEnum.yellow.toColor();
                context.read<DiaryCellEditBloc>().add(
                      const ChangeColorEvent(
                        mainColor: MainColorsEnum.yellow,
                      ),
                    );
                switch (colorEditingEnum) {
                  case ColorEditingEnum.text:
                    textColorEditing(color);
                    break;
                  case ColorEditingEnum.fill:
                    fillColorEditing(color);
                    break;
                  case ColorEditingEnum.border:
                    bordersColorEditing(color);
                    break;
                }
              },
              onTapGreen: () {
                Color color = MainColorsEnum.green.toColor();
                context.read<DiaryCellEditBloc>().add(
                      const ChangeColorEvent(
                        mainColor: MainColorsEnum.green,
                      ),
                    );
                switch (colorEditingEnum) {
                  case ColorEditingEnum.text:
                    textColorEditing(color);
                    break;
                  case ColorEditingEnum.fill:
                    fillColorEditing(color);
                    break;
                  case ColorEditingEnum.border:
                    bordersColorEditing(color);
                    break;
                }
              },
              onTapBlue: () {
                Color color = MainColorsEnum.blue.toColor();
                context.read<DiaryCellEditBloc>().add(
                      const ChangeColorEvent(
                        mainColor: MainColorsEnum.blue,
                      ),
                    );
                switch (colorEditingEnum) {
                  case ColorEditingEnum.text:
                    textColorEditing(color);
                    break;
                  case ColorEditingEnum.fill:
                    fillColorEditing(color);
                    break;
                  case ColorEditingEnum.border:
                    bordersColorEditing(color);
                    break;
                }
              },
              onTapPurple: () {
                Color color = MainColorsEnum.purple.toColor();
                context.read<DiaryCellEditBloc>().add(
                      const ChangeColorEvent(
                        mainColor: MainColorsEnum.purple,
                      ),
                    );
                switch (colorEditingEnum) {
                  case ColorEditingEnum.text:
                    textColorEditing(color);
                    break;
                  case ColorEditingEnum.fill:
                    fillColorEditing(color);
                    break;
                  case ColorEditingEnum.border:
                    bordersColorEditing(color);
                    break;
                }
              },
            );
          },
          orElse: () => Container(),
        );
      },
    );
  }
}
