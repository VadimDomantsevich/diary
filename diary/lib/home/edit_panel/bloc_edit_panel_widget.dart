import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/grid_display/bloc/grid_display_bloc.dart';
import 'package:diary/home/edit_panel/edit_panel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocEditPanelWidget extends StatelessWidget {
  const BlocEditPanelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryListBloc, DiaryListState>(
      builder: (context, state) => state.maybeWhen(
        loaded: (diaryList, diaryColumns, diaryCells, cellsKeys, lists) {
          return BlocBuilder<GridDisplayBloc, GridDisplayState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (scaleFactor, width, height, transformationController,
                    translateX, translateY, isPanelShown) {
                  return isPanelShown
                      ? EditPanelWidget.selectList(
                          selectedList: diaryList,
                          lists: lists,//Вот это передаются
                          onTap: (list) => list.listDate == diaryList.listDate
                              ? context.read<DiaryListBloc>().add(
                                    DiaryListEvent.startEditingList(
                                      selectedList: diaryList,
                                    ),
                                  )
                              : context.read<DiaryListBloc>().add(
                                    DiaryListEvent.getDiaryList(
                                      date: list.listDate,
                                    ),
                                  ),
                          onPressedIconButton: () =>
                              context.read<DiaryListBloc>().add(
                                    const DiaryListEvent.startEditingList(),
                                  ),
                        )
                      : Container();
                },
                orElse: () => Container(),
              );
            },
          );
        },
        //Сюда для ячеек добавить
        orElse: () => Container(),
      ),
    );
  }
}
