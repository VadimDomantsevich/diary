import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:diary/core/extentions.dart';
import 'package:diary/home_screen/edit_panel/edit_cells/bloc_widgets/bloc_alignment_edit_icons_row_widget.dart';
import 'package:diary/home_screen/edit_panel/edit_cells/bloc_widgets/bloc_borders_edit_widget.dart';
import 'package:diary/home_screen/edit_panel/edit_cells/bloc_widgets/bloc_clear_formatting_row_widget.dart';
import 'package:diary/home_screen/edit_panel/edit_cells/bloc_widgets/bloc_edit_cells_name_row_widget.dart';
import 'package:diary/home_screen/edit_panel/edit_cells/bloc_widgets/bloc_fill_color_edit_widget.dart';
import 'package:diary/home_screen/edit_panel/edit_cells/bloc_widgets/bloc_fontsize_row_widget.dart';
import 'package:diary/home_screen/edit_panel/edit_cells/bloc_widgets/bloc_text_color_edit_widget.dart';
import 'package:diary/home_screen/edit_panel/edit_cells/bloc_widgets/bloc_textstyle_edit_icons_row_widget.dart';
import 'package:diary/home_screen/edit_panel/edit_cells/widgets/edit_cells_panel_bottom_column_widget.dart';
import 'package:diary/model/diary_list.dart';
import 'package:flutter/material.dart';

class EditCellsPanelWidget extends StatelessWidget {
  const EditCellsPanelWidget({
    super.key,
    required this.bottomColumn,
    required this.themeBorderColor,
    required this.themePanelBackgroundColor,
  });

  final Widget bottomColumn;
  final Color themeBorderColor;
  final Color themePanelBackgroundColor;

  factory EditCellsPanelWidget.textEditing({
    required DiaryList diaryList,
  }) {
    return EditCellsPanelWidget(
      bottomColumn: EditCellsPanelBottomColumnWidget(
        nameRowWidget: const BlocEditCellsNameRowWidget(),
        listOfWidgets: [
          BlocTextStyleEditIconsRowWidget(
            diaryList: diaryList,
          ),
          BlocAlignmentEditIconsRowWidget(
            diaryList: diaryList,
          ),
          BlocFontSizeRowWidget(
            diaryList: diaryList,
          ),
          BlocTextColorEditWidget(
            diaryList: diaryList,
          ),
          BlocClearFormattingRowWidget(
            diaryList: diaryList,
          ),
        ],
      ),
      themeBorderColor: diaryList.settings.themeBorderColor.toColor(),
      themePanelBackgroundColor:
          diaryList.settings.themePanelBackgroundColor.toColor(),
    );
  }

  factory EditCellsPanelWidget.cellEditing({
    required DiaryList diaryList,
  }) {
    return EditCellsPanelWidget(
      bottomColumn: EditCellsPanelBottomColumnWidget(
        nameRowWidget: const BlocEditCellsNameRowWidget(),
        listOfWidgets: [
          BlocFillColorEditWidget(
            diaryList: diaryList,
          ),
          BlocBordersEditWidget(
            diaryList: diaryList,
          ),
        ],
      ),
      themeBorderColor: diaryList.settings.themeBorderColor.toColor(),
      themePanelBackgroundColor:
          diaryList.settings.themePanelBackgroundColor.toColor(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: FractionallySizedBox(
        heightFactor: EditPanelConstants.editListPanelHeightFactor,
        widthFactor: EditPanelConstants.editPanelWidthFactor,
        child: Container(
          decoration: BoxDecoration(
            color: themePanelBackgroundColor,
            border: Border(
              top: BorderSide(
                color: themeBorderColor,
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
