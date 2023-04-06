import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:diary/home_screen/edit_panel/edit_cells/widgets/border_line_widget.dart';
import 'package:flutter/material.dart';

class BordersStyleEditWidget extends StatelessWidget {
  const BordersStyleEditWidget({
    super.key,
    required this.textWidget,
    required this.onTap,
    required this.borderLineHeight,
    required this.themeBorderColor,
  });

  final Color themeBorderColor;
  final Widget textWidget;
  final VoidCallback onTap;
  final double borderLineHeight;

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
              BorderLineWidget(
                themeBorderColor: themeBorderColor,
                height: borderLineHeight,
                horizontalPadding:
                    EditPanelConstants.editPanelListTileHorizontalPadding,
              ),
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
