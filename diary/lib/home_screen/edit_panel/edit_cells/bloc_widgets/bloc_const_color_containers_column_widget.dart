import 'package:diary/blocs/diary_cell_edit_bloc/diary_cell_edit_bloc.dart';
import 'package:diary/blocs/diary_list_bloc/diary_list_bloc.dart';
import 'package:diary/core/constants/enums.dart';
import 'package:diary/core/extentions.dart';
import 'package:diary/home_screen/edit_panel/edit_cells/widgets/const_color_containers_column_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocConstColorContainersColumnWidget extends StatelessWidget {
  const BlocConstColorContainersColumnWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryCellEditBloc, DiaryCellEditState>(
      builder: (context, state) {
        return state.maybeWhen(
          colorEditing: (colorEditingEnum, mainColor, selectedColor,
              defaultColor, bordersEditingEnum, bordersStyleEnum) {
            return ConstColorContainersColumnWidget.byMainColor(
              mainColor: mainColor,
              onTap: (color) {
                context.read<DiaryCellEditBloc>().add(
                      ChangeColorEvent(
                        mainColor: mainColor,
                        color: color.toColorString(),
                      ),
                    );
                switch (colorEditingEnum) {
                  case ColorEditingEnum.text:
                    context.read<DiaryListBloc>().add(
                          ChangeDiaryCellsSettingsEvent(
                            color: color.toColorString(),
                          ),
                        );
                    context.read<DiaryListBloc>().add(
                          ChangeCapitalCellSettingsEvent(
                            color: color.toColorString(),
                          ),
                        );
                    break;
                  case ColorEditingEnum.fill:
                    context.read<DiaryListBloc>().add(
                          ChangeDiaryCellsSettingsEvent(
                            backgroundColor: color.toColorString(),
                          ),
                        );
                    context.read<DiaryListBloc>().add(
                          ChangeCapitalCellSettingsEvent(
                            backgroundColor: color.toColorString(),
                          ),
                        );
                    break;
                  case ColorEditingEnum.border:
                    context.read<DiaryListBloc>().add(
                          ChangeDiaryCellsBordersSettingsEvent(
                            bordersEditingEnum:
                                bordersEditingEnum ?? BordersEditingEnum.none,
                            bordersStyleEnum:
                                bordersStyleEnum ?? BordersStyleEnum.thin,
                            bordersColor: color,
                          ),
                        );
                    context.read<DiaryListBloc>().add(
                          ChangeCapitalCellSettingsEvent(
                            bordersStyleEnum:
                                bordersStyleEnum ?? BordersStyleEnum.thin,
                            bordersColor: color,
                          ),
                        );
                    break;
                }
              },
              selectedColor: selectedColor,
            );
          },
          orElse: () => Container(),
        );
      },
    );
  }
}
