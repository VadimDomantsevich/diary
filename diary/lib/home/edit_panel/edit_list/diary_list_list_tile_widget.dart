import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:diary/home/edit_panel/edit_panel_text_widget.dart';
import 'package:diary/model/diary_list.dart';
import 'package:flutter/material.dart';

class DiaryListListTileWidget extends StatelessWidget {
  const DiaryListListTileWidget({
    super.key,
    required this.textWidget,
    required this.onTap,
    required this.iconWidget,
    required this.textColor,
  });

  final VoidCallback onTap;
  final Widget textWidget;
  final Widget iconWidget;
  final Color textColor;

  factory DiaryListListTileWidget.model({
    required DiaryList diaryList,
    required VoidCallback onTap,
    required bool isSelected,
  }) {
    return isSelected
        ? DiaryListListTileWidget(
            textWidget: EditPanelTextWidget.listTileSelected(
              content: diaryList.name,
            ),
            onTap: onTap,
            iconWidget: const Icon(
              Icons.check,
              color: Colors.blueAccent, //const value
            ),
            textColor: Colors.blueAccent, //const value
          )
        : DiaryListListTileWidget(
            textWidget: EditPanelTextWidget.listTileCommon(
              content: diaryList.name,
            ),
            onTap: onTap,
            iconWidget: const Icon(Icons.check_box_outline_blank),
            textColor: Colors.black, //const value
          );
  }

  factory DiaryListListTileWidget.rename({
    required String content,
    required VoidCallback onTap,
  }) {
    return DiaryListListTileWidget(
      textWidget: EditPanelTextWidget.listTileCommon(
        content: content,
      ),
      onTap: onTap,
      iconWidget: const Icon(Icons.edit),
      textColor: Colors.black, //const value
    );
  }

  factory DiaryListListTileWidget.delete({
    required String content,
    required VoidCallback onTap,
  }) {
    return DiaryListListTileWidget(
      textWidget: EditPanelTextWidget.listTileCommon(
        content: content,
      ),
      onTap: onTap,
      iconWidget: const Icon(Icons.delete),
      textColor: Colors.black, //const value
    );
  }

  factory DiaryListListTileWidget.addColumn({
    required String content,
    required VoidCallback onTap,
  }) {
    return DiaryListListTileWidget(
      textWidget: EditPanelTextWidget.listTileCommon(
        content: content,
      ),
      onTap: onTap,
      iconWidget: const Icon(Icons.view_column),
      textColor: Colors.black, //const value
    );
  }

  factory DiaryListListTileWidget.deleteColumn({
    required String content,
    required VoidCallback onTap,
  }) {
    return DiaryListListTileWidget(
      textWidget: EditPanelTextWidget.listTileCommon(
        content: content,
      ),
      onTap: onTap,
      iconWidget: const Icon(Icons.delete_sweep),
      textColor: Colors.black, //const value
    );
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: EditPanelConstants.editPanelWidthFactor,
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(
            horizontal: EditPanelConstants.editPanelListTileHorizontalPadding,
            vertical: EditPanelConstants.editPanelListTileVerticalPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: EditPanelConstants.editPanelListTileHorizontalPadding,
                ),
                child: iconWidget,
              ),
              textWidget,
            ],
          ),
        ),
      ),
    );
  }
}
