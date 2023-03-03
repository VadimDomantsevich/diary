import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:diary/home/edit_panel/edit_cells/bloc_alignment_edit_icons_row_widget.dart';
import 'package:diary/home/edit_panel/edit_cells/bloc_borders_edit_widget.dart';
import 'package:diary/home/edit_panel/edit_cells/bloc_clear_formatting_row_widget.dart';
import 'package:diary/home/edit_panel/edit_cells/bloc_edit_cells_name_row_widget.dart';
import 'package:diary/home/edit_panel/edit_cells/bloc_fill_color_edit_widget.dart';
import 'package:diary/home/edit_panel/edit_cells/bloc_fontsize_row_widget.dart';
import 'package:diary/home/edit_panel/edit_cells/bloc_text_color_edit_widget.dart';
import 'package:diary/home/edit_panel/edit_cells/bloc_textstyle_edit_icons_row_widget.dart';
import 'package:diary/home/edit_panel/edit_cells/edit_cells_panel_bottom_column_widget.dart';
import 'package:flutter/material.dart';

class EditCellsPanelWidget extends StatelessWidget {
  const EditCellsPanelWidget({
    super.key,
    required this.bottomColumn,
  });

  final Widget bottomColumn;

  factory EditCellsPanelWidget.textEditing() {
    return const EditCellsPanelWidget(
      bottomColumn: EditCellsPanelBottomColumnWidget(
        nameRowWidget: BlocEditCellsNameRowWidget(),
        listOfWidgets: [
          BlocTextStyleEditIconsRowWidget(),
          BlocAlignmentEditIconsRowWidget(),
          BlocFontSizeRowWidget(),
          BlocTextColorEditWidget(),
          BlocClearFormattingRowWidget(),
        ],
      ),
    );
  }

  factory EditCellsPanelWidget.cellEditing() {
    return const EditCellsPanelWidget(
      bottomColumn: EditCellsPanelBottomColumnWidget(
        nameRowWidget: BlocEditCellsNameRowWidget(),
        listOfWidgets: [
          BlocFillColorEditWidget(),
          BlocBordersEditWidget(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: FractionallySizedBox(
        heightFactor: EditPanelConstants.editListPanelHeightFactor,
        widthFactor: EditPanelConstants.editPanelWidthFactor,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white, //const value
            border: Border(
              top: BorderSide(
                color: Colors.black, //const value
                width: EditPanelConstants.editPanelBorderSideWidth,
              ),
            ),
          ),
          child: bottomColumn,
        ),
      ),
    );
  }
}
