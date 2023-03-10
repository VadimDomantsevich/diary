import 'package:diary/core/constants/enums.dart';
import 'package:diary/core/extentions.dart';
import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/diary_list_screen/diary_cell_edit/diary_cell_edit_bloc.dart';
import 'package:diary/home/edit_panel/edit_cells/list_tile_row_widget.dart';
import 'package:diary/home/edit_panel/edit_panel_text_widget.dart';
import 'package:diary/model/diary_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BlocResetOptionsRowWidget extends StatelessWidget {
  const BlocResetOptionsRowWidget({
    super.key,
    required this.diaryList,
  });

  final DiaryList diaryList;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryCellEditBloc, DiaryCellEditState>(
      builder: (context, state) {
        return state.maybeWhen(
          colorEditing: (colorEditingEnum, mainColor, selectedColor,
              defaultColor, bordersEditingEnum, bordersStyleEnum) {
            return ListTileRowWidget.resetOptions(
              themeBorderColor: diaryList.settings.themeBorderColor.toColor(),
              onTap: () {
                context.read<DiaryCellEditBloc>().add(
                      ReloadColorEvent(
                        mainColor: mainColor,
                        color: defaultColor,
                      ),
                    );
                switch (colorEditingEnum) {
                  case ColorEditingEnum.text:
                    context.read<DiaryListBloc>().add(
                          ChangeDiaryCellsSettingsEvent(
                            color: defaultColor.toColorString(),
                          ),
                        );
                    context.read<DiaryListBloc>().add(
                          ChangeCapitalCellSettingsEvent(
                            color: defaultColor.toColorString(),
                          ),
                        );
                    break;
                  case ColorEditingEnum.fill:
                    context.read<DiaryListBloc>().add(
                          ChangeDiaryCellsSettingsEvent(
                            backgroundColor: defaultColor.toColorString(),
                          ),
                        );
                    context.read<DiaryListBloc>().add(
                          ChangeCapitalCellSettingsEvent(
                            backgroundColor: defaultColor.toColorString(),
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
                            bordersColor: defaultColor,
                          ),
                        );
                    context.read<DiaryListBloc>().add(
                          ChangeCapitalCellSettingsEvent(
                            bordersColor: defaultColor,
                          ),
                        );
                    break;
                }
              },
              textWidget: EditPanelTextWidget.common(
                content: AppLocalizations.of(context).resetOptions,
                color: diaryList.settings.themeBorderColor.toColor(),
              ),
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
