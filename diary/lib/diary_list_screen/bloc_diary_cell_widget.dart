import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/diary_list_screen/diary_cell_widget.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocDiaryCellWidget extends StatelessWidget {
  const BlocDiaryCellWidget({
    super.key,
    required this.diaryCell,
    required this.cellKey,
    required this.scaleFactor,
  });

  final DiaryCell diaryCell;
  final GlobalObjectKey cellKey;
  final double scaleFactor;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<DiaryListBloc, DiaryListState>(
        builder: (context, state) {
          return state.maybeWhen(
            cellSelected:
                (diaryList, diaryColumns, diaryCells, selectedCell, cellsKeys) {
              bool isSelected = false;
              if (selectedCell == diaryCell) {
                isSelected = true;
              }
              return DiaryCellWidget.model(
                cellKey: cellKey,
                isSelected: isSelected,
                diaryCell: diaryCell,
                height: diaryCell.settings.height,
                scaleFactor: scaleFactor,
                onTap: () {
                  context.read<DiaryListBloc>().add(
                        DiaryListEvent.selectDiaryCell(
                          cellKey: cellKey,
                          diaryCell: diaryCell,
                        ),
                      );
                },
                onPanUpdate: isSelected
                    ? (details) {
                        context.read<DiaryListBloc>().add(
                              OnPanUpdateEvent(
                                diaryCell: diaryCell,
                                cellKey: cellKey,
                                details: details,
                                scaleFactor: scaleFactor
                              ),
                            );
                      }
                    : null,
              );
            },
            orElse: (() {
              GlobalObjectKey cellKey = GlobalObjectKey(diaryCell);
              return DiaryCellWidget.model(
                cellKey: cellKey,
                isSelected: false,
                diaryCell: diaryCell,
                height: diaryCell.settings.height,
                scaleFactor: scaleFactor,
                onTap: () => context.read<DiaryListBloc>().add(
                      DiaryListEvent.selectDiaryCell(
                        cellKey: cellKey,
                        diaryCell: diaryCell,
                      ),
                    ),
                //onPanUpdate: (details) {},
              );
            }),
          );
        },
      );

  //How to build selected cell?
}
