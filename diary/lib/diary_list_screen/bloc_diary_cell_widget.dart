import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/diary_list_screen/diary_cell_widget.dart';
import 'package:diary/diary_list_screen/wraps.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:diary/model/diary_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocDiaryCellWidget extends StatelessWidget {
  const BlocDiaryCellWidget({
    super.key,
    required this.diaryCell,
    required this.diaryColumns,
    required this.cellKey,
    required this.scaleFactor,
  });

  final DiaryCell diaryCell;
  final List<DiaryColumn> diaryColumns;
  final GlobalObjectKey cellKey;
  final double scaleFactor;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<DiaryListBloc, DiaryListState>(
        builder: (context, state) {
          return state.maybeWhen(
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
              bool isFirstSelected = false;
              bool isSelected = false;
              if (selectedCells.contains(diaryCell)) {
                isSelected = true;
              }
              if (firstSelectedCell == diaryCell) {
                isFirstSelected = true;
                isSelected = false;
              }
              return DiaryCellWidget.model(
                cellKey: cellKey,
                isFirstSelected: isFirstSelected,
                isSelected: isSelected,
                diaryCell: diaryCell,
                diaryColumn: diaryColumns.firstWhere(
                    (element) => element.id == diaryCell.columnName),
                height: diaryCell.settings.height,
                scaleFactor: scaleFactor,
                onTap: () {
                  context.read<DiaryListBloc>().add(
                        DiaryListEvent.selectDiaryCell(
                          diaryCell: diaryCell,
                        ),
                      );
                },
                onPanUpdate: isFirstSelected
                    ? (details) {
                        context.read<DiaryListBloc>().add(
                              OnPanUpdateEvent(
                                diaryCell: diaryCell,
                                cellKey: cellKey,
                                details: details,
                                scaleFactor: scaleFactor,
                              ),
                            );
                      }
                    : null,
                border: isFirstSelected
                    ? Border.all(
                        width: 3,
                        color: Colors.blueAccent,
                      ) //const value
                    : buildBorder(diaryCell.settings),
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
              bool isFirstSelected = false;
              bool isSelected = false;
              if (selectedCells.contains(diaryCell)) {
                isSelected = true;
              }
              if (firstSelectedCell == diaryCell) {
                isFirstSelected = true;
                isSelected = false;
              }
              return DiaryCellWidget.model(
                cellKey: cellKey,
                isFirstSelected: isFirstSelected,
                isSelected: isSelected,
                diaryCell: diaryCell,
                diaryColumn: diaryColumns.firstWhere(
                    (element) => element.id == diaryCell.columnName),
                height: diaryCell.settings.height,
                scaleFactor: scaleFactor,
                onTap: () {
                  context.read<DiaryListBloc>().add(
                        DiaryListEvent.selectDiaryCell(
                          diaryCell: diaryCell,
                        ),
                      );
                },
                onPanUpdate: isFirstSelected
                    ? (details) {
                        context.read<DiaryListBloc>().add(
                              OnPanUpdateEvent(
                                diaryCell: diaryCell,
                                cellKey: cellKey,
                                details: details,
                                scaleFactor: scaleFactor,
                              ),
                            );
                      }
                    : null,
                border: isFirstSelected
                    ? Border.all(
                        width: 3,
                        color: Colors.blueAccent,
                      ) //const value
                    : buildBorder(diaryCell.settings),
              );
            },
            orElse: (() {
              GlobalObjectKey cellKey = GlobalObjectKey(diaryCell);
              return DiaryCellWidget.model(
                cellKey: cellKey,
                isFirstSelected: false,
                isSelected: false,
                diaryCell: diaryCell,
                diaryColumn: diaryColumns.firstWhere(
                    (element) => element.id == diaryCell.columnName),
                height: diaryCell.settings.height,
                scaleFactor: scaleFactor,
                onTap: () {
                  context.read<DiaryListBloc>().add(
                        DiaryListEvent.selectDiaryCell(
                          diaryCell: diaryCell,
                        ),
                      );
                },
                border: buildBorder(diaryCell.settings),
              );
            }),
          );
        },
      );
}
