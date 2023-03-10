import 'package:diary/home/edit_panel/edit_cells/edit_cells_panel_iconbutton_widget.dart';
import 'package:flutter/material.dart';

class TextStyleEditIconsRowWidget extends StatelessWidget {
  const TextStyleEditIconsRowWidget({
    super.key,
    required this.isBoldSelected,
    required this.onPressedBoldIcon,
    required this.isItalicSelected,
    required this.onPressedItalicIcon,
    required this.isUnderlineSelected,
    required this.onPressedUnderlineIcon,
    required this.isLineThroughSelected,
    required this.onPressedLineThroughIcon,
    required this.themeColor,
    required this.themeBorderColor,
  });

  final bool isBoldSelected;
  final VoidCallback onPressedBoldIcon;
  final bool isItalicSelected;
  final VoidCallback onPressedItalicIcon;
  final bool isUnderlineSelected;
  final VoidCallback onPressedUnderlineIcon;
  final bool isLineThroughSelected;
  final VoidCallback onPressedLineThroughIcon;
  final Color themeColor;
  final Color themeBorderColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: EditCellsIconButtonWidget.bold(
            isSelected: isBoldSelected,
            onPressed: onPressedBoldIcon,
            themeColor: themeColor,
            themeBorderColor: themeBorderColor,
          ),
        ),
        Expanded(
          child: EditCellsIconButtonWidget.italic(
            isSelected: isItalicSelected,
            onPressed: onPressedItalicIcon,
            themeColor: themeColor,
            themeBorderColor: themeBorderColor,
          ),
        ),
        Expanded(
          child: EditCellsIconButtonWidget.underline(
            isSelected: isUnderlineSelected,
            onPressed: onPressedUnderlineIcon,
            themeColor: themeColor,
            themeBorderColor: themeBorderColor,
          ),
        ),
        Expanded(
          child: EditCellsIconButtonWidget.lineThrough(
            isSelected: isLineThroughSelected,
            onPressed: onPressedLineThroughIcon,
            themeColor: themeColor,
            themeBorderColor: themeBorderColor,
          ),
        ),
      ],
    );
  }
}
