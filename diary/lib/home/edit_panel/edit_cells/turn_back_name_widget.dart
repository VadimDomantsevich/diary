import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:diary/home/edit_panel/edit_panel_text_widget.dart';
import 'package:flutter/material.dart';

class TurnBackNameWidget extends StatelessWidget {
  const TurnBackNameWidget({
    super.key,
    required this.content,
    required this.onPressed,
  });

  final String content;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black, //const value
            width: EditPanelConstants.editCellsPanelBottomBorderSideWidth,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: EditPanelConstants.turnBackNamePadding,
            ),
            child: IconButton(
              onPressed: onPressed,
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          EditPanelTextWidget.panelName(
            content: content,
          ),
        ],
      ),
    );
  }
}
