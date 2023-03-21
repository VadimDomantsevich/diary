import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:diary/home/edit_panel/edit_panel_text_widget.dart';
import 'package:flutter/material.dart';

class SelectableNameWidget extends StatelessWidget {
  const SelectableNameWidget({
    super.key,
    required this.textWidget,
    required this.borderWidth,
    required this.borderColor,
    required this.onTap,
  });

  final Widget textWidget;
  final double borderWidth;
  final Color borderColor;
  final VoidCallback onTap;

  factory SelectableNameWidget.textEditing({
    required bool isTextEditing,
    required String content,
    required VoidCallback onTap,
    required Color themeColor,
    required Color themeBorderColor,
  }) {
    return SelectableNameWidget(
      textWidget: EditPanelTextWidget.selectableName(
        content: content,
        textColor: isTextEditing ? themeColor : themeBorderColor,
      ),
      borderWidth: EditPanelConstants.editPanelBorderSideWidth,
      borderColor: isTextEditing ? themeColor : themeBorderColor,
      onTap: onTap,
    );
  }

  factory SelectableNameWidget.cellEditing({
    required bool isTextEditing,
    required String content,
    required VoidCallback onTap,
    required Color themeColor,
    required Color themeBorderColor,
  }) {
    return SelectableNameWidget(
      textWidget: EditPanelTextWidget.selectableName(
        content: content,
        textColor: isTextEditing ? themeBorderColor : themeColor,
      ),
      borderWidth: EditPanelConstants.editPanelBorderSideWidth,
      borderColor: isTextEditing ? themeBorderColor : themeColor,
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: borderWidth,
              color: borderColor,
            ),
          ),
        ),
        child: textWidget,
      ),
    );
  }
}
