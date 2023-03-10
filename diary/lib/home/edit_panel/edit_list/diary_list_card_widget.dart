import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:diary/core/extentions.dart';
import 'package:diary/home/edit_panel/edit_panel_text_widget.dart';
import 'package:diary/model/diary_list.dart';
import 'package:flutter/material.dart';

class ListCardWidget extends StatelessWidget {
  const ListCardWidget({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.textWidget,
    required this.iconWidget,
    required this.themeBorderColor,
    required this.themePanelBackgroundColor,
  });

  final bool isSelected;
  final VoidCallback onTap;
  final Widget textWidget;
  final Widget iconWidget;
  final Color themeBorderColor;
  final Color themePanelBackgroundColor;

  factory ListCardWidget.model({
    required DiaryList diaryList,
    required DiaryList currentDiaryList,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return isSelected
        ? ListCardWidget(
            isSelected: isSelected,
            onTap: onTap,
            textWidget: EditPanelTextWidget.selected(
              content: diaryList.name,
              color: diaryList.settings.themeColor.toColor(),
            ),
            iconWidget: Icon(
              Icons.arrow_drop_down,
              color: diaryList.settings.themeColor.toColor(),
            ),
            themeBorderColor: diaryList.settings.themeBorderColor.toColor(),
            themePanelBackgroundColor:
                diaryList.settings.themePanelBackgroundColor.toColor(),
          )
        : ListCardWidget(
            isSelected: isSelected,
            onTap: onTap,
            textWidget: EditPanelTextWidget.common(
              content: diaryList.name,
              color: currentDiaryList.settings.themeBorderColor.toColor(),
            ),
            iconWidget: Icon(
              Icons.arrow_drop_up,
              color: currentDiaryList.settings.themeBorderColor.toColor(),
            ),
            themeBorderColor: currentDiaryList.settings.themeBorderColor.toColor(),
            themePanelBackgroundColor:
                currentDiaryList.settings.themePanelBackgroundColor.toColor(),
          );
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: EditPanelConstants.listCardWidgetHeightFactor,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: themePanelBackgroundColor,
            border: Border(
              right: BorderSide(
                color: themeBorderColor,
                width: EditPanelConstants.editPanelBorderSideWidth,
              ),
            ),
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
            horizontal: EditPanelConstants.editPanelListTileHorizontalPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              textWidget,
              iconWidget,
            ],
          ),
        ),
      ),
    );
  }
}
