import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/grid_display/bloc/grid_display_bloc.dart';
import 'package:diary/home/datagrid_sample.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocDataGridSample extends StatelessWidget {
  const BlocDataGridSample({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryListBloc, DiaryListState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (diaryList, diaryColumns, diaryCells, cellsKeys) {
            return BlocProvider(
              create: (context) => GridDisplayBloc(
                diaryList: diaryList,
                diaryColumns: diaryColumns,
                diaryCells: diaryCells,
                verticalScrollController: ScrollController(),
                horizontalScrollController: ScrollController(),
              ),
              child: const DataGridSample(),
            );
          },
          cellSelected:
              (diaryList, diaryColumns, diaryCells, selectedCell, cellsKeys) {
            return BlocProvider(
              create: (context) => GridDisplayBloc(
                diaryList: diaryList,
                diaryColumns: diaryColumns,
                diaryCells: diaryCells,
                verticalScrollController: ScrollController(),
                horizontalScrollController: ScrollController(),
              ),
              child: const DataGridSample(),
            );
          },
          orElse: () => Container(),
        );
      },
    );
  }
}
