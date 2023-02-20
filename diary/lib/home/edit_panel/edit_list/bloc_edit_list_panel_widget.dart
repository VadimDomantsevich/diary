import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/grid_display/bloc/grid_display_bloc.dart';
import 'package:diary/home/edit_panel/edit_list/bloc_dialog_widget.dart';
import 'package:diary/home/edit_panel/edit_list_panel_widget.dart';
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
          listEditing: (diaryList, diaryColumns, diaryCells, cellsKeys, lists,
              selectedList) {
            return BlocBuilder<GridDisplayBloc, GridDisplayState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loaded: (
                    scaleFactor,
                    width,
                    height,
                    transformationController,
                    translateX,
                    translateY,
                    isAppBarShown,
                    isPanelShown,
                    isEditCellPanelShown,
                  ) {
                    return isPanelShown
                        ? selectedList != null
                            ? EditListPanelWidget.selectedList(
                                diaryList: selectedList,
                                contentRename:
                                    AppLocalizations.of(context).rename,
                                contentDelete:
                                    AppLocalizations.of(context).delete,
                                onTapRename: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return BlocDialogWidget(
                                        diaryList: diaryList,
                                      );
                                    },
                                  ).then(
                                    (value) => context
                                        .read<DiaryListBloc>()
                                        .add(
                                          ReturnToLoadedEvent(newName: value),
                                        ),
                                  );
                                },
                                onTapDelete: () {
                                  //Не хочу ничего сейчас удалять, добавлю позже
                                },
                              )
                            : EditListPanelWidget.allLists(
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
                                          ),
                                        ),
                              )
                        : Container();
                  },
                  orElse: () => Container(),
                );
              },
            );
          },
          // loaded: (diaryList, diaryColumns, diaryCells, cellsKeys, lists) {
          //   return EditListPanelWidget();
          //   // BlocBuilder<GridDisplayBloc, GridDisplayState>(
          //   //     builder: ((context, state) {
          //   //   return state.maybeWhen(
          //   //       loaded: (scaleFactor, width, height, transformationController,
          //   //           translateX, translateY, isPanelShown) {},
          //   //       orElse: () => Container());
          //   // }));
          // },
          orElse: () => Container(),
        );
      },
    );
  }
}
