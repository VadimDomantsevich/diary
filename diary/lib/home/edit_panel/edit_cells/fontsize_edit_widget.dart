import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:diary/home/edit_panel/edit_panel_text_widget.dart';
import 'package:flutter/material.dart';

class FontSizeEditWidget extends StatelessWidget {
  const FontSizeEditWidget({
    super.key,
    required this.textWidget,
    required this.onPressedUp,
    required this.onPressedDown,
    required this.fontSize,
  });

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
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black, //const value
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
                  icon: const Icon(Icons.keyboard_arrow_down),
                ),
                EditPanelTextWidget.common(content: fontSize.toString()),
                IconButton(
                  onPressed: onPressedUp,
                  icon: const Icon(Icons.keyboard_arrow_up),
                ),
              ],
            ), //можно вынести отдельно
          ],
        ),
      ),
    );
  }
}
