import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:flutter/material.dart';

class ColorEditWidget extends StatelessWidget {
  const ColorEditWidget({
    super.key,
    required this.textWidget,
    required this.onTap,
    required this.color,
    required this.themeBorderColor,
  });

  final Widget textWidget;
  final VoidCallback onTap;
  final Color color;
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: EditPanelConstants.colorCircleContainerSize,
                    height: EditPanelConstants.colorCircleContainerSize,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: themeBorderColor,
                        width:
                            EditPanelConstants.colorCircleContainerBorderWidth,
                      ),
                      shape: BoxShape.circle,
                      color: color,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: themeBorderColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
