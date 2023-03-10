import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:diary/core/extentions.dart';
import 'package:diary/home/edit_panel/bottom_icon_and_textfield_widget.dart';
import 'package:diary/home/edit_panel/edit_cells/bloc_textfield_capital_cell_widget.dart';
import 'package:diary/home/edit_panel/edit_cells/bloc_textfield_widget.dart';
import 'package:diary/home/edit_panel/edit_list/diary_list_card_widget.dart';
import 'package:diary/home/edit_panel/bottom_row_widget.dart';
import 'package:diary/model/capital_cell.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:diary/model/diary_list.dart';
import 'package:flutter/material.dart';

class EditPanelWidget extends StatelessWidget {
  const EditPanelWidget({
    super.key,
    required this.bottomRow,
    required this.themeBorderColor,
    required this.themePanelBackgroundColor,
  });

  final Widget bottomRow;
  final Color themeBorderColor;
  final Color themePanelBackgroundColor;

  factory EditPanelWidget.selectList({
    required List<DiaryList> lists,
    required DiaryList selectedList,
    required Function(DiaryList) onTap,
    required VoidCallback onPressedIconButton,
  }) {
    var listOfWidgets = List<Widget>.empty(growable: true);
    bool isSelected = false;
    var sortedLists = List<DiaryList>.empty(growable: true);
    sortedLists.addAll(lists);
    sortedLists.sort((a, b) => b.listDate.compareTo(a.listDate));
    for (var diaryList in sortedLists) {
      isSelected = diaryList.listDate == selectedList.listDate;
      listOfWidgets.add(
        ListCardWidget.model(
          diaryList: diaryList,
          currentDiaryList: selectedList,
          isSelected: isSelected,
          onTap: () => onTap(diaryList),
        ),
      );
    }
    return EditPanelWidget(
      themeBorderColor: selectedList.settings.themeBorderColor.toColor(),
      themePanelBackgroundColor:
          selectedList.settings.themePanelBackgroundColor.toColor(),
      bottomRow: BottomRowWidget.editList(
        listOfWidgets: listOfWidgets,
        onPressedIconButton: onPressedIconButton,
        themeBorderColor: selectedList.settings.themeBorderColor.toColor(),
      ),
    );
  }

  factory EditPanelWidget.editCell({
    required DiaryList diaryList,
    required DiaryCell diaryCell,
    required VoidCallback onPressedIconButton,
  }) {
    return EditPanelWidget(
      themeBorderColor: diaryList.settings.themeBorderColor.toColor(),
      themePanelBackgroundColor:
          diaryList.settings.themePanelBackgroundColor.toColor(),
      bottomRow: BottomIconAndTextFieldWidget.editCell(
        textFieldWidget: BlocTextFieldWidget(
          diaryCell: diaryCell,
          themeBorderColor: diaryList.settings.themeBorderColor.toColor(),
          themePanelBackgroundColor:
              diaryList.settings.themePanelBackgroundColor.toColor(),
        ),
        onPressedIconButton: onPressedIconButton,
        themeBorderColor: diaryList.settings.themeBorderColor.toColor(),
      ),
    );
  }

  factory EditPanelWidget.editCapitalCell({
    required DiaryList diaryList,
    required CapitalCell capitalCell,
    required VoidCallback onPressedIconButton,
  }) {
    return EditPanelWidget(
      themeBorderColor: diaryList.settings.themeBorderColor.toColor(),
      themePanelBackgroundColor:
          diaryList.settings.themePanelBackgroundColor.toColor(),
      bottomRow: BottomIconAndTextFieldWidget.editCell(
        textFieldWidget: BlocTextFieldCapitalCellWidget(
          capitalCell: capitalCell,
          themeBorderColor: diaryList.settings.themeBorderColor.toColor(),
          themePanelBackgroundColor:
              diaryList.settings.themePanelBackgroundColor.toColor(),
        ),
        onPressedIconButton: onPressedIconButton,
        themeBorderColor: diaryList.settings.themeBorderColor.toColor(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: FractionallySizedBox(
        heightFactor: EditPanelConstants.editPanelHeightFactor,
        widthFactor: EditPanelConstants.editPanelWidthFactor,
        child: Container(
          decoration: BoxDecoration(
            color: themePanelBackgroundColor,
            border: Border.all(
              color: themeBorderColor,
              width: EditPanelConstants.editPanelBorderSideWidth,
            ),
          ),
          child: bottomRow,
        ),
      ),
    );
  }
}
