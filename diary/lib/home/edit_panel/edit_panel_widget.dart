import 'package:diary/core/constants/edit_panel_constants.dart';
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
  });

  final Widget bottomRow;

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
          list: diaryList,
          isSelected: isSelected,
          onTap: () => onTap(diaryList),
        ),
      );
    }
    return EditPanelWidget(
      bottomRow: BottomRowWidget.editList(
        listOfWidgets: listOfWidgets,
        onPressedIconButton: onPressedIconButton,
      ),
    );
  }

  factory EditPanelWidget.editCell({
    required DiaryCell diaryCell,
    required VoidCallback onPressedIconButton,
  }) {
    return EditPanelWidget(
      bottomRow: BottomIconAndTextFieldWidget.editCell(
        textFieldWidget: BlocTextFieldWidget(diaryCell: diaryCell),
        onPressedIconButton: onPressedIconButton,
      ),
    );
  }

  factory EditPanelWidget.editCapitalCell({
    required CapitalCell capitalCell,
    required VoidCallback onPressedIconButton,
  }) {
    return EditPanelWidget(
      bottomRow: BottomIconAndTextFieldWidget.editCell(
        textFieldWidget: BlocTextFieldCapitalCellWidget(
          capitalCell: capitalCell,
        ),
        onPressedIconButton: onPressedIconButton,
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
            color: Colors.white, //const value
            border: Border.all(
              color: Colors.black, //const value
              width: EditPanelConstants.editPanelBorderSideWidth,
            ),
          ),
          child: bottomRow,
        ),
      ),
    );
  }
}
