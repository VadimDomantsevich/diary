import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:diary/home/edit_panel/edit_cells/border_line_widget.dart';
import 'package:flutter/material.dart';

class BordersStyleEditWidget extends StatelessWidget {
  const BordersStyleEditWidget({
    super.key,
    required this.textWidget,
    required this.onTap,
    required this.borderLineHeight,
  });

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
            vertical: EditPanelConstants.editPanelListTileVerticalPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textWidget,
              BorderLineWidget(
                height: borderLineHeight,
                horizontalPadding:
                    EditPanelConstants.editPanelListTileHorizontalPadding,
              ),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}
