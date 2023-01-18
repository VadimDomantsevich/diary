import 'package:diary/core/constants/edit_list_constants.dart';
import 'package:diary/home/edit_panel/edit_list/diary_list_list_tile_widget.dart';
import 'package:diary/home/edit_panel/edit_panel_bottom_column_widget.dart';
import 'package:diary/home/edit_panel/edit_panel_name_widget.dart';
import 'package:diary/model/diary_list.dart';
import 'package:flutter/material.dart';

class EditListPanelWidget extends StatelessWidget {
  const EditListPanelWidget({
    super.key,
    required this.bottomColumn,
  });

  final Widget bottomColumn;

  factory EditListPanelWidget.allLists({
    required List<DiaryList> lists,
    required DiaryList selectedList,
    required String text,
    required Function(DiaryList) onTap,
  }) {
    var listOfWidgets = List<Widget>.empty(growable: true);
    bool isSelected = false;
    for (var diaryList in lists) {
      isSelected = diaryList.listDate == selectedList.listDate;
      listOfWidgets.add(
        DiaryListListTileWidget.model(
          diaryList: diaryList,
          onTap: () => onTap(diaryList),
          isSelected: isSelected,
        ),
      );
    }
    return EditListPanelWidget(
      bottomColumn: EditPanelBottomColumnWidget(
        listOfWidgets: listOfWidgets,
        nameWidget: EditPanelNameWidget(
          text: text,
          bottomBorderColor: Colors.black,
        ),
      ),
    );
  }

  factory EditListPanelWidget.selectedList({
    required DiaryList diaryList,
    required String contentRename,
    required VoidCallback onTapRename,
    required String contentDelete,
    required VoidCallback onTapDelete,
  }) {
    var listOfWidgets = List<Widget>.empty(growable: true);
    listOfWidgets.add(
      DiaryListListTileWidget.rename(
        content: contentRename,
        onTap: onTapRename,
      ),
    );
    listOfWidgets.add(
      DiaryListListTileWidget.delete(
        content: contentDelete,
        onTap: onTapDelete,
      ),
    );
    return EditListPanelWidget(
      bottomColumn: EditPanelBottomColumnWidget(
        listOfWidgets: listOfWidgets,
        nameWidget: EditPanelNameWidget(
          text: diaryList.name,
          bottomBorderColor: Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: FractionallySizedBox(
        heightFactor: EditListConstants.editListPanelHeightFactor,
        widthFactor: EditListConstants.editPanelWidthFactor,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(
                color: Colors.black,
                width: EditListConstants.editPanelBorderSideWidth,
              ),
            ),
          ),
          child: bottomColumn,
        ),
      ),
    );
  }
}
