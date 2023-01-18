import 'package:diary/core/constants/edit_list_constants.dart';
import 'package:diary/home/edit_panel/edit_list/diary_list_card_widget.dart';
import 'package:diary/home/edit_panel/edit_list/edit_list_bottom_row_widget.dart';
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
    for (var diaryList in lists) {
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
      bottomRow: EditListBottomRowWidget(
        listOfWidgets: listOfWidgets,
        onPressedIconButton: onPressedIconButton,
      ),
    );
  }

  //factory типа editCell и bottomRow под это запилить

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: FractionallySizedBox(
        heightFactor: EditListConstants.editPanelHeightFactor,
        widthFactor: EditListConstants.editPanelWidthFactor,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black,
              width: EditListConstants.editPanelBorderSideWidth,
            ),
          ),
          child: bottomRow,
        ),
      ),
    );
  }
}
