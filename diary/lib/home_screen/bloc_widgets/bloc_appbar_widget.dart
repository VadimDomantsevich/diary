import 'package:auto_route/auto_route.dart';
import 'package:diary/blocs/diary_list_bloc/diary_list_bloc.dart';
import 'package:diary/blocs/grid_display_bloc/grid_display_bloc.dart';
import 'package:diary/blocs/locale/locale_bloc.dart';
import 'package:diary/core/constants/constants.dart';
import 'package:diary/core/extentions.dart';
import 'package:diary/home_screen/bloc_widgets/bloc_provider_take_theme_alert_dialog.dart';
import 'package:diary/home_screen/widgets/appbar_widget.dart';
import 'package:diary/router/diary_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocAppBarWidget extends StatelessWidget {
  const BlocAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryListBloc, DiaryListState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (
            diaryList,
            diaryColumns,
            capitalCells,
            diaryCells,
            cellsKeys,
            lists,
            isListThemeViewMode,
            listTheme,
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
                    return isAppBarShown && !isListThemeViewMode
                        ? AppBarWidget.listLoaded(
                            backgroundColor: diaryList
                                .settings.themePanelBackgroundColor
                                .toColor(),
                            foregroundColor:
                                diaryList.settings.themeBorderColor.toColor(),
                            themeBorderColor:
                                diaryList.settings.themeBorderColor.toColor(),
                            onPressedLanguageIcon: () => context
                                .read<LocaleBloc>()
                                .add(const LocaleEvent.changeLocale()),
                            onPressedThemesIcon: () {
                              context.router.push(
                                const BlocListThemesWidgetRoute(),
                              );
                            },
                          )
                        : isListThemeViewMode
                            ? AppBarWidget.themeViewMode(
                                onPressedLeadingIcon: () =>
                                    context.router.pop(),
                                onPressedTakeTheme: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext conttext) {
                                      return BlocProviderTakeThemeAlertDialog(
                                        listTheme: listTheme!,
                                      );
                                    },
                                  );
                                },
                              )
                            : PreferredSize(
                                preferredSize: const Size(0.0, 0.0),
                                child: Container(),
                              );
                  },
                  orElse: () => PreferredSize(
                    preferredSize: const Size(0.0, 0.0),
                    child: Container(),
                  ),
                );
              },
            );
          },
          cellsSelected: (
            diaryList,
            diaryColumns,
            capitalCells,
            diaryCells,
            firstSelectedCell,
            selectedCells,
            cellsKeys,
            lists,
            defaultTextSettings,
            defaultSettings,
            isListThemeViewMode,
            listTheme,
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
                    return isAppBarShown && !isListThemeViewMode
                        ? AppBarWidget.cellsSelected(
                            backgroundColor: diaryList
                                .settings.themePanelBackgroundColor
                                .toColor(),
                            foregroundColor:
                                diaryList.settings.themeColor.toColor(),
                            themeBorderColor:
                                diaryList.settings.themeBorderColor.toColor(),
                            onPressedLeadingIcon: () {
                              context.read<DiaryListBloc>().add(
                                    const ReturnToLoadedEvent(),
                                  );
                            },
                            onPressedLanguageIcon: () =>
                                context.read<LocaleBloc>().add(
                                      const LocaleEvent.changeLocale(),
                                    ),
                            onPressedThemesIcon: () {
                              context.router
                                  .push(const BlocListThemesWidgetRoute());
                            },
                          )
                        : isListThemeViewMode
                            ? AppBarWidget.themeViewMode(
                                onPressedLeadingIcon: () =>
                                    context.router.pop(),
                                onPressedTakeTheme: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext conttext) {
                                      return BlocProviderTakeThemeAlertDialog(
                                        listTheme: listTheme!,
                                      );
                                    },
                                  );
                                },
                              )
                            : PreferredSize(
                                preferredSize: const Size(0.0, 0.0),
                                child: Container(),
                              );
                  },
                  selectedMoving: (
                    scaleFactor,
                    diaryColumns,
                    width,
                    height,
                    transformationController,
                    translateX,
                    translateY,
                    firstSelectedCell,
                    isAppBarShown,
                  ) {
                    return isAppBarShown && !isListThemeViewMode
                        ? AppBarWidget.cellsSelected(
                            backgroundColor: diaryList
                                .settings.themePanelBackgroundColor
                                .toColor(),
                            foregroundColor:
                                diaryList.settings.themeColor.toColor(),
                            themeBorderColor:
                                diaryList.settings.themeBorderColor.toColor(),
                            onPressedLeadingIcon: () {
                              context.read<DiaryListBloc>().add(
                                    const ReturnToLoadedEvent(),
                                  );
                            },
                            onPressedLanguageIcon: () =>
                                context.read<LocaleBloc>().add(
                                      const LocaleEvent.changeLocale(),
                                    ),
                            onPressedThemesIcon: () {
                              context.router
                                  .push(const BlocListThemesWidgetRoute());
                            },
                          )
                        : isListThemeViewMode
                            ? AppBarWidget.themeViewMode(
                                onPressedLeadingIcon: () =>
                                    context.router.pop(),
                                onPressedTakeTheme: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext conttext) {
                                      return BlocProviderTakeThemeAlertDialog(
                                        listTheme: listTheme!,
                                      );
                                    },
                                  );
                                },
                              )
                            : PreferredSize(
                                preferredSize: const Size(0.0, 0.0),
                                child: Container(),
                              );
                  },
                  orElse: () => PreferredSize(
                    preferredSize: const Size(0.0, 0.0),
                    child: Container(),
                  ),
                );
              },
            );
          },
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
                    return isAppBarShown && !isListThemeViewMode
                        ? AppBarWidget.cellsSelected(
                            backgroundColor: diaryList
                                .settings.themePanelBackgroundColor
                                .toColor(),
                            foregroundColor:
                                diaryList.settings.themeColor.toColor(),
                            themeBorderColor:
                                diaryList.settings.themeBorderColor.toColor(),
                            onPressedLeadingIcon: () {
                              context.read<DiaryListBloc>().add(
                                    const ReturnToLoadedEvent(),
                                  );
                            },
                            onPressedLanguageIcon: () =>
                                context.read<LocaleBloc>().add(
                                      const LocaleEvent.changeLocale(),
                                    ),
                            onPressedThemesIcon: () {
                              context.router
                                  .push(const BlocListThemesWidgetRoute());
                            },
                          )
                        : isListThemeViewMode
                            ? AppBarWidget.themeViewMode(
                                onPressedLeadingIcon: () =>
                                    context.router.pop(),
                                onPressedTakeTheme: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext conttext) {
                                      return BlocProviderTakeThemeAlertDialog(
                                        listTheme: listTheme!,
                                      );
                                    },
                                  );
                                },
                              )
                            : PreferredSize(
                                preferredSize: const Size(0.0, 0.0),
                                child: Container(),
                              );
                  },
                  orElse: () => PreferredSize(
                    preferredSize: const Size(0.0, 0.0),
                    child: Container(),
                  ),
                );
              },
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
            isBorderEditing,
            isBorderStyleEditing,
            cellsKeys,
            lists,
            defaultSettings,
            isListThemeViewMode,
            listTheme,
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
                    return isAppBarShown && !isListThemeViewMode
                        ? AppBarWidget.cellsSelected(
                            backgroundColor: diaryList
                                .settings.themePanelBackgroundColor
                                .toColor(),
                            foregroundColor:
                                diaryList.settings.themeColor.toColor(),
                            themeBorderColor:
                                diaryList.settings.themeBorderColor.toColor(),
                            onPressedLeadingIcon: () {
                              context.read<DiaryListBloc>().add(
                                    const ReturnToLoadedEvent(),
                                  );
                            },
                            onPressedLanguageIcon: () =>
                                context.read<LocaleBloc>().add(
                                      const LocaleEvent.changeLocale(),
                                    ),
                            onPressedThemesIcon: () {
                              context.router
                                  .push(const BlocListThemesWidgetRoute());
                            },
                          )
                        : isListThemeViewMode
                            ? AppBarWidget.themeViewMode(
                                onPressedLeadingIcon: () =>
                                    context.router.pop(),
                                onPressedTakeTheme: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext conttext) {
                                      return BlocProviderTakeThemeAlertDialog(
                                        listTheme: listTheme!,
                                      );
                                    },
                                  );
                                },
                              )
                            : PreferredSize(
                                preferredSize: const Size(0.0, 0.0),
                                child: Container(),
                              );
                  },
                  orElse: () => PreferredSize(
                    preferredSize: const Size(0.0, 0.0),
                    child: Container(),
                  ),
                );
              },
            );
          },
          themesLoaded: (listThemes) {
            return AppBarWidget.themesLoaded(
              backgroundColor:
                  Constants.themesLoadedAppBarWidgetBackgroundColor.toColor(),
              foregroundColor:
                  Constants.themesLoadedAppBarWidgetForegroundColor.toColor(),
              onPressedLeadingIcon: () => context.router.pop(),
              themeBorderColor:
                  Constants.themesLoadedAppBarWidgetForegroundColor.toColor(),
            );
          },
          orElse: () => PreferredSize(
            preferredSize: const Size(0.0, 0.0),
            child: Container(),
          ),
        );
      },
    );
  }
}
