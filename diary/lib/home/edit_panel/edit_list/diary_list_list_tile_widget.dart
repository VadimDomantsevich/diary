import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:diary/core/extentions.dart';
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
              color: diaryList.settings.themeColor.toColor(),
            ),
            onTap: onTap,
            iconWidget: Icon(
              Icons.check,
              color: diaryList.settings.themeColor.toColor(),
            ),
            textColor: diaryList.settings.themeColor.toColor(),
          )
        : DiaryListListTileWidget(
            textWidget: EditPanelTextWidget.listTileCommon(
              content: diaryList.name,
              color: diaryList.settings.themeBorderColor.toColor(),
            ),
            onTap: onTap,
            iconWidget: Icon(
              Icons.check_box_outline_blank,
              color: diaryList.settings.themeBorderColor.toColor(),
            ),
            textColor: diaryList.settings.themeBorderColor.toColor(),
          );
  }

  factory DiaryListListTileWidget.rename({
    required DiaryList diaryList,
    required String content,
    required VoidCallback onTap,
  }) {
    return DiaryListListTileWidget(
      textWidget: EditPanelTextWidget.listTileCommon(
        content: content,
        color: diaryList.settings.themeBorderColor.toColor(),
      ),
      onTap: onTap,
      iconWidget: Icon(
        Icons.edit,
        color: diaryList.settings.themeBorderColor.toColor(),
      ),
      textColor: diaryList.settings.themeBorderColor.toColor(),
    );
  }

  factory DiaryListListTileWidget.delete({
    required DiaryList diaryList,
    required String content,
    required VoidCallback onTap,
  }) {
    return DiaryListListTileWidget(
      textWidget: EditPanelTextWidget.listTileCommon(
        content: content,
        color: diaryList.settings.themeBorderColor.toColor(),
      ),
      onTap: onTap,
      iconWidget: Icon(
        Icons.delete,
        color: diaryList.settings.themeBorderColor.toColor(),
      ),
      textColor: diaryList.settings.themeBorderColor.toColor(),
    );
  }

  factory DiaryListListTileWidget.addColumn({
    required DiaryList diaryList,
    required String content,
    required VoidCallback onTap,
  }) {
    return DiaryListListTileWidget(
      textWidget: EditPanelTextWidget.listTileCommon(
        content: content,
        color: diaryList.settings.themeBorderColor.toColor(),
      ),
      onTap: onTap,
      iconWidget: Icon(
        Icons.view_column,
        color: diaryList.settings.themeBorderColor.toColor(),
      ),
      textColor: diaryList.settings.themeBorderColor.toColor(),
    );
  }

  factory DiaryListListTileWidget.deleteColumn({
    required DiaryList diaryList,
    required String content,
    required VoidCallback onTap,
  }) {
    return DiaryListListTileWidget(
      textWidget: EditPanelTextWidget.listTileCommon(
        content: content,
        color: diaryList.settings.themeBorderColor.toColor(),
      ),
      onTap: onTap,
      iconWidget: Icon(
        Icons.delete_sweep,
        color: diaryList.settings.themeBorderColor.toColor(),
      ),
      textColor: diaryList.settings.themeBorderColor.toColor(),
    );
  }

  factory DiaryListListTileWidget.themeColor({
    required DiaryList diaryList,
    required String content,
    required VoidCallback onTap,
  }) {
    return DiaryListListTileWidget(
      textWidget: EditPanelTextWidget.listTileCommon(
        content: content,
        color: diaryList.settings.themeBorderColor.toColor(),
      ),
      onTap: onTap,
      iconWidget: Icon(
        Icons.color_lens,
        color: diaryList.settings.themeBorderColor.toColor(),
      ),
      textColor: diaryList.settings.themeBorderColor.toColor(),
    );
  }

  factory DiaryListListTileWidget.shareTheme({
    required DiaryList diaryList,
    required String content,
    required VoidCallback onTap,
  }) {
    return DiaryListListTileWidget(
      textWidget: EditPanelTextWidget.listTileCommon(
        content: content,
        color: diaryList.settings.themeBorderColor.toColor(),
      ),
      onTap: onTap,
      iconWidget: Icon(
        Icons.share,
        color: diaryList.settings.themeBorderColor.toColor(),
      ),
      textColor: diaryList.settings.themeBorderColor.toColor(),
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
