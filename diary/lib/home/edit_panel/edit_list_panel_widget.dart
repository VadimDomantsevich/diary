import 'package:diary/core/constants/constants.dart';
import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:diary/home/edit_panel/edit_list/diary_column_list_tile_widget.dart';
import 'package:diary/home/edit_panel/edit_list/diary_list_list_tile_widget.dart';
import 'package:diary/home/edit_panel/edit_panel_bottom_column_widget.dart';
import 'package:diary/home/edit_panel/edit_panel_name_widget.dart';
import 'package:diary/model/diary_column.dart';
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
          bottomBorderColor: Colors.black, //const value
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
    required String contentAddColumn,
    required VoidCallback onTapAddColumn,
    required String contentDeleteColumn,
    required VoidCallback onTapDeleteColumn,
  }) {
    var listOfWidgets = List<Widget>.empty(growable: true);
    listOfWidgets.add(
      DiaryListListTileWidget.rename(
        content: contentRename,
        onTap: onTapRename,
      ),
    );

    listOfWidgets.add(
      DiaryListListTileWidget.addColumn(
        content: contentAddColumn,
        onTap: onTapAddColumn,
      ),
    );
    listOfWidgets.add(
      DiaryListListTileWidget.deleteColumn(
        content: contentDeleteColumn,
        onTap: onTapDeleteColumn,
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
          bottomBorderColor: Colors.black, //const value
        ),
      ),
    );
  }

  factory EditListPanelWidget.allColumns({
    required List<DiaryColumn> columns,
    required String text,
    required Function(DiaryColumn) onTap,
  }) {
    var listOfWidgets = List<Widget>.empty(growable: true);
    for (var column in columns) {
      if (column.id != Constants.diaryColumnDateField) {
        listOfWidgets.add(
          DiaryColumnListTileWidget.model(
            diaryColumn: column,
            onTap: () => onTap(column),
          ),
        );
      }
    }
    return EditListPanelWidget(
      bottomColumn: EditPanelBottomColumnWidget(
        listOfWidgets: listOfWidgets,
        nameWidget: EditPanelNameWidget(
          text: text,
          bottomBorderColor: Colors.black, //const value
        ),
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
