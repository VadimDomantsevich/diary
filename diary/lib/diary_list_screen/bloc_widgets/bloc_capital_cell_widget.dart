import 'package:diary/blocs/diary_list_bloc/diary_list_bloc.dart';
import 'package:diary/core/extentions.dart';
import 'package:diary/diary_list_screen/widgets/capital_cell_widget.dart';
import 'package:diary/model/capital_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocCapitalCellWidget extends StatelessWidget {
  const BlocCapitalCellWidget({
    super.key,
    required this.capitalCell,
    required this.themeColor,
  });

  final CapitalCell capitalCell;
  final Color themeColor;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryListBloc, DiaryListState>(
      builder: (context, state) => state.maybeWhen(
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
          return CapitalCellWidget.model(
            capitalCell: capitalCell,
            onTap: () => context.read<DiaryListBloc>().add(
                  SelectCapitalCellEvent(
                    capitalCell: capitalCell,
                  ),
                ),
            isSelected: capitalCell == selectedCapitalCell,
            themeColor: diaryList.settings.themeColor.toColor(),
          );
        },
        orElse: () => CapitalCellWidget.model(
          capitalCell: capitalCell,
          onTap: () => context.read<DiaryListBloc>().add(
                SelectCapitalCellEvent(
                  capitalCell: capitalCell,
                ),
              ),
          isSelected: false,
          themeColor: themeColor,
        ),
      ),
    );
  }
}
