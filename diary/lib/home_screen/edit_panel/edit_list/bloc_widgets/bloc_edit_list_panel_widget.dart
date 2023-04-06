import 'package:diary/blocs/diary_list_bloc/diary_list_bloc.dart';
import 'package:diary/blocs/grid_display_bloc/grid_display_bloc.dart';
import 'package:diary/core/constants/constants.dart';
import 'package:diary/core/constants/enums.dart';
import 'package:diary/core/extentions.dart';
import 'package:diary/home_screen/edit_panel/edit_list/bloc_widgets/bloc_add_column_dialog_widget.dart';
import 'package:diary/home_screen/edit_panel/edit_list/bloc_widgets/bloc_delete_column_dialog_widget.dart';
import 'package:diary/home_screen/edit_panel/edit_list/bloc_widgets/bloc_dialog_widget.dart';
import 'package:diary/home_screen/edit_panel/edit_list/bloc_widgets/bloc_pick_color_dialog_widget.dart';
import 'package:diary/home_screen/edit_panel/edit_list/bloc_widgets/bloc_share_theme_dialog_widget.dart';
import 'package:diary/home_screen/edit_panel/widgets/edit_list_panel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BlocEditListPanelWidget extends StatelessWidget {
  const BlocEditListPanelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryListBloc, DiaryListState>(
      builder: (context, state) {
        return state.maybeWhen(
          listEditing: (
            diaryList,
            diaryColumns,
            capitalCells,
            diaryCells,
            cellsKeys,
            lists,
            isColumnDeleting,
            isColorThemeEditing,
            selectedList,
          ) {
            return BlocBuilder<GridDisplayBloc, GridDisplayState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loaded: (
                    scaleFactor,
                    diaryColumns,
                    width,
                    height,
                    transformationController,
                    translateX,
                    translateY,
                    isAppBarShown,
                    isPanelShown,
                    isEditCellPanelShown,
                  ) {
                    return isPanelShown &&
                            selectedList != null &&
                            !isColorThemeEditing
                        ? EditListPanelWidget.selectedList(
                            diaryList: selectedList,
                            contentRename: AppLocalizations.of(context).rename,
                            contentDelete: AppLocalizations.of(context).delete,
                            contentThemeColor:
                                AppLocalizations.of(context).themeColor,
                            contentAddColumn:
                                AppLocalizations.of(context).addColumn,
                            contentDeleteColumn:
                                AppLocalizations.of(context).deleteColumn,
                            contentShareTheme:
                                AppLocalizations.of(context).shareTheme,
                            onTapRename: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return BlocDialogWidget(
                                    diaryList: diaryList,
                                  );
                                },
                              ).then(
                                (value) => context.read<DiaryListBloc>().add(
                                      ReturnToLoadedEvent(newName: value),
                                    ),
                              );
                            },
                            onTapThemeColor: () {
                              context.read<DiaryListBloc>().add(
                                    const DiaryListEvent
                                        .startColorThemeEditing(),
                                  );
                            },
                            onTapDelete: () {
                              //I don't want to delete anything now
                            },
                            onTapAddColumn: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return BlocAddColumnDialogWidget(
                                    diaryList: diaryList,
                                    diaryColumns: diaryColumns,
                                  );
                                },
                              ).whenComplete(
                                () => context.read<DiaryListBloc>().add(
                                      DiaryListEvent.getDiaryList(
                                        date: diaryList.listDate,
                                        delay: Constants.addColumnDelay,
                                      ),
                                    ),
                              );
                            },
                            onTapDeleteColumn: () {
                              context
                                  .read<DiaryListBloc>()
                                  .add(const StartColumnDeletingEvent());
                            },
                            onTapShareTheme: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return BlocShareThemeDialogWidget(
                                    diaryList: diaryList,
                                    diaryColumns: diaryColumns,
                                    diaryCells: diaryCells,
                                    capitalCells: capitalCells,
                                  );
                                },
                              );
                            },
                          )
                        : !isColumnDeleting && !isColorThemeEditing
                            ? EditListPanelWidget.allLists(
                                lists: lists,
                                selectedList: diaryList,
                                text: AppLocalizations.of(context).allLists,
                                onTap: (list) => list.listDate ==
                                        diaryList.listDate
                                    ? context.read<DiaryListBloc>().add(
                                          const DiaryListEvent.returnToLoaded(),
                                        )
                                    : context.read<DiaryListBloc>().add(
                                          DiaryListEvent.getDiaryList(
                                            date: list.listDate,
                                            delay: Constants.getListDelay,
                                          ),
                                        ),
                              )
                            : !isColorThemeEditing
                                ? EditListPanelWidget.allColumns(
                                    diaryList: diaryList,
                                    columns: diaryColumns,
                                    text: AppLocalizations.of(context)
                                        .deleteColumn,
                                    onTap: (column) {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return BlocDeleteColumnDialogWidget(
                                            diaryList: diaryList,
                                            diaryColumn: column,
                                          );
                                        },
                                      ).whenComplete(
                                        () => context.read<DiaryListBloc>().add(
                                              DiaryListEvent.getDiaryList(
                                                date: diaryList.listDate,
                                                delay:
                                                    Constants.deleteColumnDelay,
                                              ),
                                            ),
                                      );
                                    },
                                  )
                                : EditListPanelWidget.themeColorEditing(
                                    diaryList: diaryList,
                                    contentMainColor:
                                        AppLocalizations.of(context).mainColor,
                                    onTapMainColor: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext conttext) {
                                          return BlocPickColorDialogWidget(
                                            diaryList: diaryList,
                                            themeColor:
                                                ThemeColorsEnum.themeColor,
                                            color: diaryList.settings.themeColor
                                                .toColor(),
                                          );
                                        },
                                      ).whenComplete(
                                        () {
                                          context.read<DiaryListBloc>().add(
                                                DiaryListEvent.getDiaryList(
                                                  date: diaryList.listDate,
                                                  delay: Constants
                                                      .updateColorDelay,
                                                ),
                                              );
                                        },
                                      );
                                    },
                                    contentBorderColor:
                                        AppLocalizations.of(context)
                                            .borderColor,
                                    onTapBorderColor: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext conttext) {
                                          return BlocPickColorDialogWidget(
                                            diaryList: diaryList,
                                            themeColor: ThemeColorsEnum
                                                .themeBorderColor,
                                            color: diaryList
                                                .settings.themeBorderColor
                                                .toColor(),
                                          );
                                        },
                                      ).whenComplete(
                                        () {
                                          context.read<DiaryListBloc>().add(
                                                DiaryListEvent.getDiaryList(
                                                  date: diaryList.listDate,
                                                  delay: Constants
                                                      .updateColorDelay,
                                                ),
                                              );
                                        },
                                      );
                                    },
                                    contentBackgroundColor:
                                        AppLocalizations.of(context)
                                            .backgroundColor,
                                    onTapBackgroundColor: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext conttext) {
                                          return BlocPickColorDialogWidget(
                                            diaryList: diaryList,
                                            themeColor: ThemeColorsEnum
                                                .themePanelBackgroundColor,
                                            color: diaryList.settings
                                                .themePanelBackgroundColor
                                                .toColor(),
                                          );
                                        },
                                      ).whenComplete(
                                        () {
                                          context.read<DiaryListBloc>().add(
                                                DiaryListEvent.getDiaryList(
                                                  date: diaryList.listDate,
                                                  delay: Constants
                                                      .updateColorDelay,
                                                ),
                                              );
                                        },
                                      );
                                    },
                                  );
                  },
                  orElse: () => Container(),
                );
              },
            );
          },
          orElse: () => Container(),
        );
      },
    );
  }
}
