import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:diary/core/extentions.dart';
import 'package:diary/home/edit_panel/edit_panel_text_widget.dart';
import 'package:diary/model/diary_column.dart';
import 'package:diary/model/diary_list.dart';
import 'package:flutter/material.dart';

class DiaryColumnListTileWidget extends StatelessWidget {
  const DiaryColumnListTileWidget({
    super.key,
    required this.onTap,
    required this.textWidget,
  });

  final VoidCallback onTap;
  final Widget textWidget;

  factory DiaryColumnListTileWidget.model({
    required DiaryList diaryList,
    required DiaryColumn diaryColumn,
    required VoidCallback onTap,
  }) {
    return DiaryColumnListTileWidget(
      onTap: onTap,
      textWidget: EditPanelTextWidget.listTileCommon(
        content: diaryColumn.name,
        color: diaryList.settings.themeBorderColor.toColor(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: EditPanelConstants.editPanelWidthFactor,
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
            horizontal: EditPanelConstants.editPanelListTileHorizontalPadding,
            vertical: EditPanelConstants.editPanelListTileVerticalPadding,
          ),
          child: textWidget,
        ),
      ),
    );
  }
}
