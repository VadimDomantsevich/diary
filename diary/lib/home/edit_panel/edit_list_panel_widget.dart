import 'package:diary/core/constants/constants.dart';
import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:diary/core/extentions.dart';
import 'package:diary/home/edit_panel/edit_cells/bloc_turn_back_name_widget.dart';
import 'package:diary/home/edit_panel/edit_cells/color_edit_widget.dart';
import 'package:diary/home/edit_panel/edit_list/diary_column_list_tile_widget.dart';
import 'package:diary/home/edit_panel/edit_list/diary_list_list_tile_widget.dart';
import 'package:diary/home/edit_panel/edit_panel_bottom_column_widget.dart';
import 'package:diary/home/edit_panel/edit_panel_name_widget.dart';
import 'package:diary/home/edit_panel/edit_panel_text_widget.dart';
import 'package:diary/model/diary_column.dart';
import 'package:diary/model/diary_list.dart';
import 'package:flutter/material.dart';

class EditListPanelWidget extends StatelessWidget {
  const EditListPanelWidget({
    super.key,
    required this.bottomColumn,
    required this.themeBorderColor,
    required this.themePanelBackgroundColor,
  });

  final Widget bottomColumn;
  final Color themeBorderColor;
  final Color themePanelBackgroundColor;

  factory EditListPanelWidget.allLists({
    required List<DiaryList> lists,
    required DiaryList selectedList,
    required String text,
    required Function(DiaryList) onTap,
  }) {
    var listOfWidgets = List<Widget>.empty(growable: true);
    bool isSelected = false;
    var sortedList = List<DiaryList>.empty(growable: true);
    sortedList.addAll(lists);
    sortedList.sort((a, b) => b.listDate.compareTo(a.listDate));
    for (var diaryList in sortedList) {
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
      themeBorderColor: selectedList.settings.themeBorderColor.toColor(),
      themePanelBackgroundColor:
          selectedList.settings.themePanelBackgroundColor.toColor(),
      bottomColumn: EditPanelBottomColumnWidget(
        listOfWidgets: listOfWidgets,
        nameWidget: EditPanelNameWidget(
          diaryList: selectedList,
          text: text,
          bottomBorderColor: selectedList.settings.themeBorderColor.toColor(),
        ),
      ),
    );
  }

  factory EditListPanelWidget.selectedList({
    required DiaryList diaryList,
    required String contentRename,
    required VoidCallback onTapRename,
    required String contentThemeColor,
    required VoidCallback onTapThemeColor,
    required String contentDelete,
    required VoidCallback onTapDelete,
    required String contentAddColumn,
    required VoidCallback onTapAddColumn,
    required String contentDeleteColumn,
    required VoidCallback onTapDeleteColumn,
    required String contentShareTheme,
    required VoidCallback onTapShareTheme,
  }) {
    var listOfWidgets = List<Widget>.empty(growable: true);
    listOfWidgets.add(
      DiaryListListTileWidget.rename(
        diaryList: diaryList,
        content: contentRename,
        onTap: onTapRename,
      ),
    );
    listOfWidgets.add(
      DiaryListListTileWidget.themeColor(
        diaryList: diaryList,
        content: contentThemeColor,
        onTap: onTapThemeColor,
      ),
    );
    listOfWidgets.add(
      DiaryListListTileWidget.addColumn(
        diaryList: diaryList,
        content: contentAddColumn,
        onTap: onTapAddColumn,
      ),
    );
    listOfWidgets.add(
      DiaryListListTileWidget.deleteColumn(
        diaryList: diaryList,
        content: contentDeleteColumn,
        onTap: onTapDeleteColumn,
      ),
    );
    listOfWidgets.add(
      DiaryListListTileWidget.shareTheme(
        diaryList: diaryList,
        content: contentShareTheme,
        onTap: onTapShareTheme,
      ),
    );
    listOfWidgets.add(
      DiaryListListTileWidget.delete(
        diaryList: diaryList,
        content: contentDelete,
        onTap: onTapDelete,
      ),
    );
    return EditListPanelWidget(
      themeBorderColor: diaryList.settings.themeBorderColor.toColor(),
      themePanelBackgroundColor:
          diaryList.settings.themePanelBackgroundColor.toColor(),
      bottomColumn: EditPanelBottomColumnWidget(
        listOfWidgets: listOfWidgets,
        nameWidget: EditPanelNameWidget(
          diaryList: diaryList,
          text: diaryList.name,
          bottomBorderColor: diaryList.settings.themeBorderColor.toColor(),
        ),
      ),
    );
  }

  factory EditListPanelWidget.themeColorEditing({
    required DiaryList diaryList,
    required String contentMainColor,
    required VoidCallback onTapMainColor,
    required String contentBorderColor,
    required VoidCallback onTapBorderColor,
    required String contentBackgroundColor,
    required VoidCallback onTapBackgroundColor,
  }) {
    var listOfWidgets = List<Widget>.empty(growable: true);
    listOfWidgets.add(
      ColorEditWidget(
        textWidget: EditPanelTextWidget.common(
          content: contentMainColor,
          color: diaryList.settings.themeBorderColor.toColor(),
        ),
        onTap: onTapMainColor,
        color: diaryList.settings.themeColor.toColor(),
        themeBorderColor: diaryList.settings.themeBorderColor.toColor(),
      ),
    );
    listOfWidgets.add(
      ColorEditWidget(
        textWidget: EditPanelTextWidget.common(
          content: contentBorderColor,
          color: diaryList.settings.themeBorderColor.toColor(),
        ),
        onTap: onTapBorderColor,
        color: diaryList.settings.themeBorderColor.toColor(),
        themeBorderColor: diaryList.settings.themeBorderColor.toColor(),
      ),
    );
    listOfWidgets.add(
      ColorEditWidget(
        textWidget: EditPanelTextWidget.common(
          content: contentBackgroundColor,
          color: diaryList.settings.themeBorderColor.toColor(),
        ),
        onTap: onTapBackgroundColor,
        color: diaryList.settings.themePanelBackgroundColor.toColor(),
        themeBorderColor: diaryList.settings.themeBorderColor.toColor(),
      ),
    );
    return EditListPanelWidget(
      themeBorderColor: diaryList.settings.themeBorderColor.toColor(),
      themePanelBackgroundColor:
          diaryList.settings.themePanelBackgroundColor.toColor(),
      bottomColumn: EditPanelBottomColumnWidget(
        listOfWidgets: listOfWidgets,
        nameWidget: const BlocTurnBackNameWidget(),
      ),
    );
  }

  factory EditListPanelWidget.allColumns({
    required DiaryList diaryList,
    required List<DiaryColumn> columns,
    required String text,
    required Function(DiaryColumn) onTap,
  }) {
    var listOfWidgets = List<Widget>.empty(growable: true);
    for (var column in columns) {
      if (column.id != Constants.diaryColumnDateField) {
        listOfWidgets.add(
          DiaryColumnListTileWidget.model(
            diaryList: diaryList,
            diaryColumn: column,
            onTap: () => onTap(column),
          ),
        );
      }
    }
    return EditListPanelWidget(
      themeBorderColor: diaryList.settings.themeBorderColor.toColor(),
      themePanelBackgroundColor:
          diaryList.settings.themePanelBackgroundColor.toColor(),
      bottomColumn: EditPanelBottomColumnWidget(
        listOfWidgets: listOfWidgets,
        nameWidget: EditPanelNameWidget(
          diaryList: diaryList,
          text: text,
          bottomBorderColor: diaryList.settings.themeBorderColor.toColor(),
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
