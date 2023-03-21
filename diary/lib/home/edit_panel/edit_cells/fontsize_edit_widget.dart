import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:diary/core/extentions.dart';
import 'package:diary/home/edit_panel/edit_panel_text_widget.dart';
import 'package:diary/model/diary_list.dart';
import 'package:flutter/material.dart';

class FontSizeEditWidget extends StatelessWidget {
  const FontSizeEditWidget({
    super.key,
    required this.textWidget,
    required this.onPressedUp,
    required this.onPressedDown,
    required this.fontSize,
    required this.diaryList,
  });

  final DiaryList diaryList;
  final Widget textWidget;
  final VoidCallback onPressedUp;
  final VoidCallback onPressedDown;
  final int fontSize;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: EditPanelConstants.editPanelWidthFactor,
      child: Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: diaryList.settings.themeBorderColor.toColor(),
              width: EditPanelConstants.editCellsPanelBottomBorderSideWidth,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: EditPanelConstants.editPanelListTileHorizontalPadding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textWidget,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: onPressedDown,
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: diaryList.settings.themeBorderColor.toColor(),
                  ),
                ),
                EditPanelTextWidget.common(
                  content: fontSize.toString(),
                  color: diaryList.settings.themeBorderColor.toColor(),
                ),
                IconButton(
                  onPressed: onPressedUp,
                  icon: Icon(
                    Icons.keyboard_arrow_up,
                    color: diaryList.settings.themeBorderColor.toColor(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
