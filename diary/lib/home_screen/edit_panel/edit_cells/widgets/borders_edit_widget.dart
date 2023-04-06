import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:flutter/material.dart';

class BordersEditWidget extends StatelessWidget {
  const BordersEditWidget({
    super.key,
    required this.textWidget,
    required this.onTap,
    required this.themeBorderColor,
  });

  final Widget textWidget;
  final VoidCallback onTap;
  final Color themeBorderColor;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: EditPanelConstants.editPanelWidthFactor,
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: themeBorderColor,
                width: EditPanelConstants.editCellsPanelBottomBorderSideWidth,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: EditPanelConstants.editPanelListTileHorizontalPadding,
            vertical: EditPanelConstants.editPanelListTileVerticalPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textWidget,
              Icon(
                Icons.arrow_forward_ios,
                color: themeBorderColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
