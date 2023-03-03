import 'package:diary/core/constants/edit_panel_constants.dart';
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
  });

  final bool isSelected;
  final VoidCallback onTap;
  final Widget textWidget;
  final Widget iconWidget;

  factory ListCardWidget.model({
    required DiaryList list,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return isSelected
        ? ListCardWidget(
            isSelected: isSelected,
            onTap: onTap,
            textWidget: EditPanelTextWidget.selected(
              content: list.name,
            ),
            iconWidget: const Icon(
              Icons.arrow_drop_down,
              color: Colors.blueAccent,
            ),
          )
        : ListCardWidget(
            isSelected: isSelected,
            onTap: onTap,
            textWidget: EditPanelTextWidget.common(
              content: list.name,
            ),
            iconWidget: const Icon(
              Icons.arrow_drop_up,
              color: Colors.black,
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: EditPanelConstants.listCardWidgetHeightFactor,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white, //const value
            border: Border(
              right: BorderSide(
                color: Color.fromARGB(255, 46, 46, 46), //const value
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
