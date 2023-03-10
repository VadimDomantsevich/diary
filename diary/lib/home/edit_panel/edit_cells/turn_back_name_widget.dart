import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:diary/core/extentions.dart';
import 'package:diary/home/edit_panel/edit_panel_text_widget.dart';
import 'package:diary/model/diary_list.dart';
import 'package:flutter/material.dart';

class TurnBackNameWidget extends StatelessWidget {
  const TurnBackNameWidget({
    super.key,
    required this.content,
    required this.onPressed,
    required this.diaryList,
  });

  final DiaryList diaryList;
  final String content;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: diaryList.settings.themeBorderColor.toColor(),
            width: EditPanelConstants.editCellsPanelBottomBorderSideWidth,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: EditPanelConstants.turnBackNamePadding,
            ),
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.arrow_back,
                color: diaryList.settings.themeBorderColor.toColor(),
              ),
            ),
          ),
          EditPanelTextWidget.panelName(
            content: content,
            color: diaryList.settings.themeBorderColor.toColor(),
          ),
        ],
      ),
    );
  }
}
