import 'package:diary/blocs/diary_cell_edit_bloc/diary_cell_edit_bloc.dart';
import 'package:diary/blocs/diary_list_bloc/diary_list_bloc.dart';
import 'package:diary/core/constants/enums.dart';
import 'package:diary/core/extentions.dart';
import 'package:diary/home_screen/edit_panel/edit_cells/widgets/color_edit_widget.dart';
import 'package:diary/home_screen/edit_panel/widgets/edit_panel_text_widget.dart';
import 'package:diary/model/diary_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BlocBordersColorEditWidget extends StatelessWidget {
  const BlocBordersColorEditWidget({
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
            return ColorEditWidget(
              textWidget: EditPanelTextWidget.common(
                content: AppLocalizations.of(context).bordersColor,
                color: diaryList.settings.themeBorderColor.toColor(),
              ),
              onTap: () {
                context.read<DiaryListBloc>().add(
                      const StartEditingColorEvent(),
                    );
                context.read<DiaryCellEditBloc>().add(
                      DiaryCellEditEvent.startColorEditing(
                        colorEditingEnum: ColorEditingEnum.border,
                        defaultColor: bordersColor,
                        bordersEditingEnum: bordersEditingEnum,
                        bordersStyleEnum: bordersStyleEnum,
                      ),
                    );
              },
              color: bordersColor,
              themeBorderColor: diaryList.settings.themeBorderColor.toColor(),
            );
          },
          capitalCellBordersEditing: (bordersStyleEnum, bordersColor) {
            return ColorEditWidget(
              textWidget: EditPanelTextWidget.common(
                content: AppLocalizations.of(context).bordersColor,
                color: diaryList.settings.themeBorderColor.toColor(),
              ),
              onTap: () {
                context.read<DiaryListBloc>().add(
                      const StartEditingColorEvent(),
                    );
                context.read<DiaryCellEditBloc>().add(
                      DiaryCellEditEvent.startColorEditing(
                        colorEditingEnum: ColorEditingEnum.border,
                        defaultColor: bordersColor,
                        bordersEditingEnum: BordersEditingEnum.all,
                        bordersStyleEnum: bordersStyleEnum,
                      ),
                    );
              },
              color: bordersColor,
              themeBorderColor: diaryList.settings.themeBorderColor.toColor(),
            );
          },
          orElse: () => Container(),
        );
      },
    );
  }
}
