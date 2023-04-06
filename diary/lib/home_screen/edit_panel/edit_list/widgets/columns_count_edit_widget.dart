import 'package:diary/core/extentions.dart';
import 'package:diary/home_screen/edit_panel/widgets/edit_panel_text_widget.dart';
import 'package:diary/model/diary_list.dart';
import 'package:flutter/material.dart';

class ColumnsCountEditWidget extends StatelessWidget {
  const ColumnsCountEditWidget({
    super.key,
    required this.textWidget,
    required this.onPressedUp,
    required this.onPressedDown,
    required this.columnsCount,
    required this.diaryList,
  });

  final DiaryList diaryList;
  final Widget textWidget;
  final VoidCallback onPressedUp;
  final VoidCallback onPressedDown;
  final int columnsCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        textWidget,
        IconButton(
          onPressed: onPressedDown,
          icon: const Icon(Icons.keyboard_arrow_down),
        ),
        EditPanelTextWidget.common(
          content: columnsCount.toString(),
          color: diaryList.settings.themeBorderColor.toColor(),
        ),
        IconButton(
          onPressed: onPressedUp,
          icon: const Icon(Icons.keyboard_arrow_up),
        ),
      ],
    );
  }
}
