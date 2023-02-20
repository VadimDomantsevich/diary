import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:diary/home/edit_panel/edit_panel_text_widget.dart';
import 'package:flutter/material.dart';

class EditPanelNameWidget extends StatelessWidget {
  const EditPanelNameWidget({
    super.key,
    required this.text,
    required this.bottomBorderColor,
  });

  final String text;
  final Color bottomBorderColor;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.topLeft,
      widthFactor: EditPanelConstants.editPanelWidthFactor,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: bottomBorderColor,
              width: EditPanelConstants.editPanelBorderSideWidth,
            ),
          ),
        ),
        child: EditPanelTextWidget.panelName(
          content: text,
        ),
      ),
    );
  }
}
