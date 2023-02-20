import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:diary/core/constants/enums.dart';
import 'package:diary/core/extentions.dart';
import 'package:flutter/material.dart';

class MainColorContainerWidget extends StatelessWidget {
  const MainColorContainerWidget({
    super.key,
    required this.color,
    required this.borderWidth,
    required this.onTap,
  });

  final VoidCallback onTap;
  final double borderWidth;
  final Color color;

  factory MainColorContainerWidget.black({
    required MainColorsEnum mainColorsEnum,
    required VoidCallback onTap,
  }) {
    final color = MainColorsEnum.black.toColor();
    return MainColorContainerWidget(
      color: color,
      borderWidth: mainColorsEnum.toColor() == color
          ? EditPanelConstants.selectedMainColorBorderWidth
          : 0,
      onTap: onTap,
    );
  }

  factory MainColorContainerWidget.red({
    required MainColorsEnum mainColorsEnum,
    required VoidCallback onTap,
  }) {
    final color = MainColorsEnum.red.toColor();
    return MainColorContainerWidget(
      color: color,
      borderWidth: mainColorsEnum.toColor() == color
          ? EditPanelConstants.selectedMainColorBorderWidth
          : 0,
      onTap: onTap,
    );
  }

  factory MainColorContainerWidget.orange({
    required MainColorsEnum mainColorsEnum,
    required VoidCallback onTap,
  }) {
    final color = MainColorsEnum.orange.toColor();
    return MainColorContainerWidget(
      color: color,
      borderWidth: mainColorsEnum.toColor() == color
          ? EditPanelConstants.selectedMainColorBorderWidth
          : 0,
      onTap: onTap,
    );
  }

  factory MainColorContainerWidget.yellow({
    required MainColorsEnum mainColorsEnum,
    required VoidCallback onTap,
  }) {
    final color = MainColorsEnum.yellow.toColor();
    return MainColorContainerWidget(
      color: color,
      borderWidth: mainColorsEnum.toColor() == color
          ? EditPanelConstants.selectedMainColorBorderWidth
          : 0,
      onTap: onTap,
    );
  }

  factory MainColorContainerWidget.green({
    required MainColorsEnum mainColorsEnum,
    required VoidCallback onTap,
  }) {
    final color = MainColorsEnum.green.toColor();
    return MainColorContainerWidget(
      color: color,
      borderWidth: mainColorsEnum.toColor() == color
          ? EditPanelConstants.selectedMainColorBorderWidth
          : 0,
      onTap: onTap,
    );
  }

  factory MainColorContainerWidget.blue({
    required MainColorsEnum mainColorsEnum,
    required VoidCallback onTap,
  }) {
    final color = MainColorsEnum.blue.toColor();
    return MainColorContainerWidget(
      color: color,
      borderWidth: mainColorsEnum.toColor() == color
          ? EditPanelConstants.selectedMainColorBorderWidth
          : 0,
      onTap: onTap,
    );
  }

  factory MainColorContainerWidget.purple({
    required MainColorsEnum mainColorsEnum,
    required VoidCallback onTap,
  }) {
    final color = MainColorsEnum.purple.toColor();
    return MainColorContainerWidget(
      color: color,
      borderWidth: mainColorsEnum.toColor() == color
          ? EditPanelConstants.selectedMainColorBorderWidth
          : 0,
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: EditPanelConstants.mainColorContainerSize,
        height: EditPanelConstants.mainColorContainerSize,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey, //Const value
            width: borderWidth,
          ),
          color: color,
        ),
      ),
    );
  }
}
