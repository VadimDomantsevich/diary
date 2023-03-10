import 'package:diary/core/extentions.dart';
import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/grid_display/bloc/grid_display_bloc.dart';
import 'package:diary/home/appbar_widget.dart';
import 'package:diary/locale/locale_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocAppBarWidget extends StatelessWidget {
  const BlocAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryListBloc, DiaryListState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (diaryList, diaryColumns, capitalCells, diaryCells, cellsKeys,
              lists) {
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
                    return isAppBarShown
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
                    return isAppBarShown
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
                    return isAppBarShown
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
                    return isAppBarShown
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
                    return isAppBarShown
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
          orElse: () => PreferredSize(
            preferredSize: const Size(0.0, 0.0),
            child: Container(),
          ),
        );
      },
    );
  }
}
