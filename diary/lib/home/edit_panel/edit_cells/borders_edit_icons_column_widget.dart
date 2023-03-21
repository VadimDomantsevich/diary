import 'package:diary/core/constants/enums.dart';
import 'package:diary/home/edit_panel/edit_cells/edit_cells_panel_iconbutton_widget.dart';
import 'package:flutter/material.dart';

class BordersEditIconsColumnWidget extends StatelessWidget {
  const BordersEditIconsColumnWidget({
    super.key,
    required this.onPressed,
    required this.isBorderAllSelected,
    required this.isBorderOuterSelected,
    required this.isBorderInnerSelected,
    required this.isBorderVerticalSelected,
    required this.isBorderHorizontalSelected,
    required this.isBorderLeftSelected,
    required this.isBorderRightSelected,
    required this.isBorderTopSelected,
    required this.isBorderBottomSelected,
    required this.isBorderClearSelected,
    required this.themeColor,
    required this.themeBorderColor,
  });

  final bool isBorderAllSelected;
  final bool isBorderOuterSelected;
  final bool isBorderInnerSelected;
  final bool isBorderVerticalSelected;
  final bool isBorderHorizontalSelected;
  final bool isBorderLeftSelected;
  final bool isBorderRightSelected;
  final bool isBorderTopSelected;
  final bool isBorderBottomSelected;
  final bool isBorderClearSelected;
  final Function(BordersEditingEnum) onPressed;
  final Color themeColor;
  final Color themeBorderColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: EditCellsIconButtonWidget.borderAll(
                isSelected: isBorderAllSelected,
                onPressed: () => onPressed(BordersEditingEnum.all),
                themeColor: themeColor,
                themeBorderColor: themeBorderColor,
              ),
            ),
            Expanded(
              child: EditCellsIconButtonWidget.borderOuter(
                isSelected: isBorderOuterSelected,
                onPressed: () => onPressed(BordersEditingEnum.outer),
                themeColor: themeColor,
                themeBorderColor: themeBorderColor,
              ),
            ),
            Expanded(
              child: EditCellsIconButtonWidget.borderInner(
                isSelected: isBorderInnerSelected,
                onPressed: () => onPressed(BordersEditingEnum.inner),
                themeColor: themeColor,
                themeBorderColor: themeBorderColor,
              ),
            ),
            Expanded(
              child: EditCellsIconButtonWidget.borderVertical(
                isSelected: isBorderVerticalSelected,
                onPressed: () => onPressed(BordersEditingEnum.vertical),
                themeColor: themeColor,
                themeBorderColor: themeBorderColor,
              ),
            ),
            Expanded(
              child: EditCellsIconButtonWidget.borderHorizontal(
                isSelected: isBorderHorizontalSelected,
                onPressed: () => onPressed(BordersEditingEnum.horizontal),
                themeColor: themeColor,
                themeBorderColor: themeBorderColor,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: EditCellsIconButtonWidget.borderLeft(
                isSelected: isBorderLeftSelected,
                onPressed: () => onPressed(BordersEditingEnum.left),
                themeColor: themeColor,
                themeBorderColor: themeBorderColor,
              ),
            ),
            Expanded(
              child: EditCellsIconButtonWidget.borderRight(
                isSelected: isBorderRightSelected,
                onPressed: () => onPressed(BordersEditingEnum.right),
                themeColor: themeColor,
                themeBorderColor: themeBorderColor,
              ),
            ),
            Expanded(
              child: EditCellsIconButtonWidget.borderTop(
                isSelected: isBorderTopSelected,
                onPressed: () => onPressed(BordersEditingEnum.top),
                themeColor: themeColor,
                themeBorderColor: themeBorderColor,
              ),
            ),
            Expanded(
              child: EditCellsIconButtonWidget.borderBottom(
                isSelected: isBorderBottomSelected,
                onPressed: () => onPressed(BordersEditingEnum.bottom),
                themeColor: themeColor,
                themeBorderColor: themeBorderColor,
              ),
            ),
            Expanded(
              child: EditCellsIconButtonWidget.borderClear(
                isSelected: isBorderClearSelected,
                onPressed: () => onPressed(BordersEditingEnum.clear),
                themeColor: themeColor,
                themeBorderColor: themeBorderColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
