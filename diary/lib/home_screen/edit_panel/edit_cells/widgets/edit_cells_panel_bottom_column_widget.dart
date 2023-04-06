import 'package:diary/home_screen/edit_panel/edit_cells/bloc_widgets/bloc_borders_color_edit_widget.dart';
import 'package:diary/home_screen/edit_panel/edit_cells/bloc_widgets/bloc_borders_edit_icons_column_widget.dart';
import 'package:diary/home_screen/edit_panel/edit_cells/bloc_widgets/bloc_borders_style_column_widget.dart';
import 'package:diary/home_screen/edit_panel/edit_cells/bloc_widgets/bloc_borders_style_edit_widget.dart';
import 'package:diary/home_screen/edit_panel/edit_cells/bloc_widgets/bloc_const_color_containers_column_widget.dart';
import 'package:diary/home_screen/edit_panel/edit_cells/bloc_widgets/bloc_main_color_containers_row_widget.dart';
import 'package:diary/home_screen/edit_panel/edit_cells/bloc_widgets/bloc_reset_options_row_widget.dart';
import 'package:diary/home_screen/edit_panel/edit_cells/bloc_widgets/bloc_turn_back_name_widget.dart';
import 'package:diary/model/diary_list.dart';
import 'package:flutter/material.dart';

class EditCellsPanelBottomColumnWidget extends StatelessWidget {
  const EditCellsPanelBottomColumnWidget({
    super.key,
    required this.nameRowWidget,
    required this.listOfWidgets,
  });

  final Widget nameRowWidget;
  final List<Widget> listOfWidgets;

  factory EditCellsPanelBottomColumnWidget.color({
    required DiaryList diaryList,
  }) {
    return EditCellsPanelBottomColumnWidget(
      nameRowWidget: const BlocTurnBackNameWidget(),
      listOfWidgets: [
        BlocResetOptionsRowWidget(
          diaryList: diaryList,
        ),
        const BlocMainColorContainersRowWidget(),
        const BlocConstColorContainersColumnWidget(),
      ],
    );
  }

  factory EditCellsPanelBottomColumnWidget.borders({
    required DiaryList diaryList,
  }) {
    return EditCellsPanelBottomColumnWidget(
      nameRowWidget: const BlocTurnBackNameWidget(),
      listOfWidgets: [
        BlocBordersEditIconsColumnWidget(
          diaryList: diaryList,
        ),
        BlocBordersStyleEditWidget(
          diaryList: diaryList,
        ),
        BlocBordersColorEditWidget(
          diaryList: diaryList,
        ),
      ],
    );
  }

  factory EditCellsPanelBottomColumnWidget.bordersStyle({
    required DiaryList diaryList,
  }) {
    return EditCellsPanelBottomColumnWidget(
      nameRowWidget: const BlocTurnBackNameWidget(),
      listOfWidgets: [
        BlocBordersStyleColumnWidget(
          diaryList: diaryList,
        ),
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
