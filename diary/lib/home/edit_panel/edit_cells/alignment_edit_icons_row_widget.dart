import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:diary/home/edit_panel/edit_cells/edit_cells_panel_iconbutton_widget.dart';
import 'package:flutter/material.dart';

class AlignmentEditIconsRowWidget extends StatelessWidget {
  const AlignmentEditIconsRowWidget({
    super.key,
    required this.themeColor,
    required this.isHorizontalLeft,
    required this.onPressedHorizontalLeftIcon,
    required this.isHorizontalCenter,
    required this.onPressedHorizontalCenterIcon,
    required this.isHorizontalRight,
    required this.onPressedHorizontalRightIcon,
    required this.isVerticalTop,
    required this.onPressedVerticalTopIcon,
    required this.isVerticalCenter,
    required this.onPressedVerticalCenterIcon,
    required this.isVerticalBottom,
    required this.onPressedVerticalBottomIcon,
    required this.themeBorderColor,
  });

  final Color themeBorderColor;
  final Color themeColor;
  final bool isHorizontalLeft;
  final VoidCallback onPressedHorizontalLeftIcon;
  final bool isHorizontalCenter;
  final VoidCallback onPressedHorizontalCenterIcon;
  final bool isHorizontalRight;
  final VoidCallback onPressedHorizontalRightIcon;
  final bool isVerticalTop;
  final VoidCallback onPressedVerticalTopIcon;
  final bool isVerticalCenter;
  final VoidCallback onPressedVerticalCenterIcon;
  final bool isVerticalBottom;
  final VoidCallback onPressedVerticalBottomIcon;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: EditCellsIconButtonWidget.horizontalLeft(
              themeColor: themeColor,
              themeBorderColor: themeBorderColor,
              isSelected: isHorizontalLeft,
              onPressed: onPressedHorizontalLeftIcon,
            ),
          ),
          Expanded(
            child: EditCellsIconButtonWidget.horizontalCenter(
              themeColor: themeColor,
              themeBorderColor: themeBorderColor,
              isSelected: isHorizontalCenter,
              onPressed: onPressedHorizontalCenterIcon,
            ),
          ),
          Expanded(
            child: EditCellsIconButtonWidget.horizontalRight(
              themeColor: themeColor,
              themeBorderColor: themeBorderColor,
              isSelected: isHorizontalRight,
              onPressed: onPressedHorizontalRightIcon,
            ),
          ),
          VerticalDivider(
            width: EditPanelConstants.editPanelBorderSideWidth,
            thickness: EditPanelConstants.editCellsPanelBottomBorderSideWidth,
            color: themeBorderColor,
          ),
          Expanded(
            child: EditCellsIconButtonWidget.verticalTop(
              themeColor: themeColor,
              themeBorderColor: themeBorderColor,
              isSelected: isVerticalTop,
              onPressed: onPressedVerticalTopIcon,
            ),
          ),
          Expanded(
            child: EditCellsIconButtonWidget.verticalCenter(
              themeColor: themeColor,
              themeBorderColor: themeBorderColor,
              isSelected: isVerticalCenter,
              onPressed: onPressedVerticalCenterIcon,
            ),
          ),
          Expanded(
            child: EditCellsIconButtonWidget.verticalBottom(
              themeColor: themeColor,
              themeBorderColor: themeBorderColor,
              isSelected: isVerticalBottom,
              onPressed: onPressedVerticalBottomIcon,
            ),
          ),
        ],
      ),
    );
  }
}
