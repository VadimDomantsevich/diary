import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:diary/core/constants/enums.dart';
import 'package:diary/core/extentions.dart';
import 'package:diary/home_screen/edit_panel/edit_cells/widgets/border_line_widget.dart';
import 'package:flutter/material.dart';

class BordersStyleRowWidget extends StatelessWidget {
  const BordersStyleRowWidget({
    super.key,
    required this.iconWidget,
    required this.onTap,
    required this.borderLineHeight,
    required this.themeBorderColor,
  });

  final Color themeBorderColor;
  final Widget iconWidget;
  final VoidCallback onTap;
  final double borderLineHeight;

  factory BordersStyleRowWidget.thin({
    required BordersStyleEnum selectedStyle,
    required VoidCallback onTap,
    required Color themeColor,
    required Color themeBorderColor,
  }) {
    return BordersStyleRowWidget(
      themeBorderColor: themeBorderColor,
      iconWidget: selectedStyle == BordersStyleEnum.thin
          ? Icon(
              Icons.check,
              color: themeColor,
            )
          : Container(),
      onTap: onTap,
      borderLineHeight: BordersStyleEnum.thin.toDoubleWidth(),
    );
  }

  factory BordersStyleRowWidget.medium({
    required BordersStyleEnum selectedStyle,
    required VoidCallback onTap,
    required Color themeColor,
    required Color themeBorderColor,
  }) {
    return BordersStyleRowWidget(
      themeBorderColor: themeBorderColor,
      iconWidget: selectedStyle == BordersStyleEnum.medium
          ? Icon(
              Icons.check,
              color: themeColor,
            )
          : Container(),
      onTap: onTap,
      borderLineHeight: BordersStyleEnum.medium.toDoubleWidth(),
    );
  }

  factory BordersStyleRowWidget.thick({
    required BordersStyleEnum selectedStyle,
    required VoidCallback onTap,
    required Color themeColor,
    required Color themeBorderColor,
  }) {
    return BordersStyleRowWidget(
      themeBorderColor: themeBorderColor,
      iconWidget: selectedStyle == BordersStyleEnum.thick
          ? Icon(
              Icons.check,
              color: themeColor,
            )
          : Container(),
      onTap: onTap,
      borderLineHeight: BordersStyleEnum.thick.toDoubleWidth(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: EditPanelConstants.editPanelWidthFactor,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: EditPanelConstants.editPanelListTileHorizontalPadding,
            vertical: EditPanelConstants.bordersStyleRowVerticalPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: EditPanelConstants.bordersStyleRowIconWidth,
                child: iconWidget,
              ),
              BorderLineWidget(
                themeBorderColor: themeBorderColor,
                height: borderLineHeight,
                horizontalPadding: EditPanelConstants.bordersLinePadding,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
