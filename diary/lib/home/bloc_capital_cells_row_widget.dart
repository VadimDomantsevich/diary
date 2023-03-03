import 'package:diary/diary_list_screen/bloc_capital_cell_widget.dart';
import 'package:diary/model/capital_cell.dart';
import 'package:flutter/material.dart';

class BlocCapitalCellsRowWidget extends StatelessWidget {
  const BlocCapitalCellsRowWidget({
    super.key,
    required this.capitalCellsWidgets,
  });

  final List<Widget> capitalCellsWidgets;

  factory BlocCapitalCellsRowWidget.capitalCells({
    required List<CapitalCell> capitalCells,
  }) {
    List<Widget> capitalCellsWidgets = List.empty(growable: true);
    for (var cell in capitalCells) {
      capitalCellsWidgets.add(
        BlocCapitalCellWidget(
          capitalCell: cell,
        ),
      );
    }
    return BlocCapitalCellsRowWidget(
      capitalCellsWidgets: capitalCellsWidgets,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: capitalCellsWidgets,
    );
  }
}
