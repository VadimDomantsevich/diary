import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:flutter/material.dart';

class ListTileRowWidget extends StatelessWidget {
  const ListTileRowWidget({
    super.key,
    required this.iconWidget,
    required this.onTap,
    required this.textWidget,
  });

  final Widget iconWidget;
  final Widget textWidget;
  final VoidCallback onTap;

  factory ListTileRowWidget.resetOptions({
    required VoidCallback onTap,
    required Widget textWidget,
  }) {
    return ListTileRowWidget(
      iconWidget: const Icon(Icons.format_color_reset),
      onTap: onTap,
      textWidget: textWidget,
    );
  }

  factory ListTileRowWidget.clearFormatting({
    required VoidCallback onTap,
    required Widget textWidget,
  }) {
    return ListTileRowWidget(
      iconWidget: const Icon(Icons.clear_all),
      onTap: onTap,
      textWidget: textWidget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(
          EditPanelConstants.resetOptionsRowPadding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            iconWidget,
            textWidget,
          ],
        ),
      ),
    );
  }
}
