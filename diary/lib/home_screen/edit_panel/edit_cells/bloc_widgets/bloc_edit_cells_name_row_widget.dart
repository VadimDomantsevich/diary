import 'package:diary/blocs/diary_cell_edit_bloc/diary_cell_edit_bloc.dart';
import 'package:diary/blocs/diary_list_bloc/diary_list_bloc.dart';
import 'package:diary/core/extentions.dart';
import 'package:diary/home_screen/edit_panel/edit_cells/widgets/edit_cells_name_row_widget.dart';
import 'package:diary/home_screen/edit_panel/edit_cells/widgets/selectable_name_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BlocEditCellsNameRowWidget extends StatelessWidget {
  const BlocEditCellsNameRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryListBloc, DiaryListState>(
      builder: (context, state) {
        return state.maybeWhen(
          cellsEditing: (
            diaryList,
            diaryColumns,
            capitalCells,
            diaryCells,
            cellsKeys,
            firstSelectedCell,
            selectedCells,
            isTextEditing,
            isColorEditing,
            isBordersEditing,
            isBordersStyleEditing,
            lists,
            defaultTextSettings,
            defaultSettings,
            isListThemeViewMode,
            listTheme,
          ) {
            return EditCellsNameRowWidget(
              isTextEditing: isTextEditing,
              textEditingWidget: SelectableNameWidget.textEditing(
                themeColor: diaryList.settings.themeColor.toColor(),
                themeBorderColor: diaryList.settings.themeBorderColor.toColor(),
                onTap: () {
                  context.read<DiaryListBloc>().add(
                        const StartEditingCellsEvent(
                          isTextEditing: true,
                        ),
                      );
                  context.read<DiaryCellEditBloc>().add(
                        DiaryCellEditEvent.startTextEditing(
                          firstSelectedCell: firstSelectedCell,
                          defaultTextSettings: defaultTextSettings,
                          defaultSettings: defaultSettings,
                        ),
                      );
                },
                isTextEditing: isTextEditing,
                content: AppLocalizations.of(context).text,
              ),
              cellEditingWidget: SelectableNameWidget.cellEditing(
                themeColor: diaryList.settings.themeColor.toColor(),
                themeBorderColor: diaryList.settings.themeBorderColor.toColor(),
                onTap: () {
                  context.read<DiaryListBloc>().add(
                        const StartEditingCellsEvent(
                          isTextEditing: false,
                        ),
                      );
                  context.read<DiaryCellEditBloc>().add(
                        DiaryCellEditEvent.startCellEditing(
                          firstSelectedCell: firstSelectedCell,
                        ),
                      );
                },
                isTextEditing: isTextEditing,
                content: AppLocalizations.of(context).cell,
              ),
            );
          },
          capitalCellSelected: (
            diaryList,
            diaryColumns,
            capitalCells,
            diaryCells,
            selectedCapitalCell,
            isEditing,
            isTextEditing,
            isColorEditing,
            isBordersEditing,
            isBordersStyleEditing,
            cellsKeys,
            lists,
            defaultSettings,
            isListThemeViewMode,
            listTheme,
          ) {
            return EditCellsNameRowWidget(
              isTextEditing: isTextEditing,
              textEditingWidget: SelectableNameWidget.textEditing(
                themeColor: diaryList.settings.themeColor.toColor(),
                themeBorderColor: diaryList.settings.themeBorderColor.toColor(),
                onTap: () {
                  context.read<DiaryListBloc>().add(
                        const StartEditingCellsEvent(
                          isTextEditing: true,
                        ),
                      );
                  context.read<DiaryCellEditBloc>().add(
                        StartCapitalCellTextEditingEvent(
                          selectedCapitalCell: selectedCapitalCell,
                          defaultSettings: defaultSettings,
                        ),
                      );
                },
                isTextEditing: isTextEditing,
                content: AppLocalizations.of(context).text,
              ),
              cellEditingWidget: SelectableNameWidget.cellEditing(
                themeColor: diaryList.settings.themeColor.toColor(),
                themeBorderColor: diaryList.settings.themeBorderColor.toColor(),
                onTap: () {
                  context.read<DiaryListBloc>().add(
                        const StartEditingCellsEvent(
                          isTextEditing: false,
                        ),
                      );
                  context.read<DiaryCellEditBloc>().add(
                        StartCapitalCellEditingEvent(
                          selectedCapitalCell: selectedCapitalCell,
                        ),
                      );
                },
                isTextEditing: isTextEditing,
                content: AppLocalizations.of(context).cell,
              ),
            );
          },
          orElse: () => Container(),
        );
      },
    );
  }
}
