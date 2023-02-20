import 'package:diary/home/edit_panel/edit_cells/bloc_borders_color_edit_widget.dart';
import 'package:diary/home/edit_panel/edit_cells/bloc_borders_edit_icons_column_widget.dart';
import 'package:diary/home/edit_panel/edit_cells/bloc_borders_style_column_widget.dart';
import 'package:diary/home/edit_panel/edit_cells/bloc_borders_style_edit_widget.dart';
import 'package:diary/home/edit_panel/edit_cells/bloc_const_color_containers_column_widget.dart';
import 'package:diary/home/edit_panel/edit_cells/bloc_main_color_containers_row_widget.dart';
import 'package:diary/home/edit_panel/edit_cells/bloc_reset_options_row_widget.dart';
import 'package:diary/home/edit_panel/edit_cells/bloc_turn_back_name_widget.dart';
import 'package:flutter/material.dart';

class EditCellsPanelBottomColumnWidget extends StatelessWidget {
  const EditCellsPanelBottomColumnWidget({
    super.key,
    required this.nameRowWidget,
    required this.listOfWidgets,
  });

  final Widget nameRowWidget;
  final List<Widget> listOfWidgets;

  factory EditCellsPanelBottomColumnWidget.color() {
    return const EditCellsPanelBottomColumnWidget(
      nameRowWidget: BlocTurnBackNameWidget(),
      listOfWidgets: [
        BlocResetOptionsRowWidget(),
        BlocMainColorContainersRowWidget(),
        BlocConstColorContainersColumnWidget(),
      ],
    );
  }

  factory EditCellsPanelBottomColumnWidget.borders() {
    return const EditCellsPanelBottomColumnWidget(
      nameRowWidget: BlocTurnBackNameWidget(),
      listOfWidgets: [
        BlocBordersEditIconsColumnWidget(),
        BlocBordersStyleEditWidget(),
        BlocBordersColorEditWidget(),
      ],
    );
  }

  factory EditCellsPanelBottomColumnWidget.bordersStyle() {
    return const EditCellsPanelBottomColumnWidget(
      nameRowWidget: BlocTurnBackNameWidget(),
      listOfWidgets: [
        BlocBordersStyleColumnWidget(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        nameRowWidget,
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: listOfWidgets,
            ),
          ),
        ),
      ],
    );
  }
}
