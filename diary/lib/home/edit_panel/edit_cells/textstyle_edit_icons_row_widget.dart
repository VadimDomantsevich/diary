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
  });

  final bool isBoldSelected;
  final VoidCallback onPressedBoldIcon;
  final bool isItalicSelected;
  final VoidCallback onPressedItalicIcon;
  final bool isUnderlineSelected;
  final VoidCallback onPressedUnderlineIcon;
  final bool isLineThroughSelected;
  final VoidCallback onPressedLineThroughIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: EditCellsIconButtonWidget.bold(
            isSelected: isBoldSelected,
            onPressed: onPressedBoldIcon,
          ),
        ),
        Expanded(
          child: EditCellsIconButtonWidget.italic(
            isSelected: isItalicSelected,
            onPressed: onPressedItalicIcon,
          ),
        ),
        Expanded(
          child: EditCellsIconButtonWidget.underline(
            isSelected: isUnderlineSelected,
            onPressed: onPressedUnderlineIcon,
          ),
        ),
        Expanded(
          child: EditCellsIconButtonWidget.lineThrough(
            isSelected: isLineThroughSelected,
            onPressed: onPressedLineThroughIcon,
          ),
        ),
      ],
    );
  }
}
