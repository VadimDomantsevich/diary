import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:flutter/material.dart';

class EditPanelTextWidget extends StatelessWidget {
  const EditPanelTextWidget({
    super.key,
    required this.content,
    required this.color,
    required this.align,
    required this.size,
  });

  final String content;
  final Color color;
  final TextAlign align;
  final double size;

  factory EditPanelTextWidget.selected({
    required String content,
    required Color color,
  }) {
    return EditPanelTextWidget(
      content: content,
      color: color,
      align: TextAlign.center,
      size: EditPanelConstants.editPanelSelectedTextSize,
    );
  }

  factory EditPanelTextWidget.common({
    required String content,
    required Color color,
  }) {
    return EditPanelTextWidget(
      content: content,
      color: color,
      align: TextAlign.center,
      size: EditPanelConstants.editPanelCommonTextSize,
    );
  }

  factory EditPanelTextWidget.panelName({
    required String content,
    required Color color,
  }) {
    return EditPanelTextWidget(
      content: content,
      color: color,
      align: TextAlign.center,
      size: EditPanelConstants.editPanelNameTextSize,
    );
  }

  factory EditPanelTextWidget.listTileSelected({
    required String content,
    required Color color,
  }) {
    return EditPanelTextWidget(
      content: content,
      color: color,
      align: TextAlign.center,
      size: EditPanelConstants.editPanelListTileSelectedTextSize,
    );
  }

  factory EditPanelTextWidget.listTileCommon({
    required String content,
    required Color color,
  }) {
    return EditPanelTextWidget(
      content: content,
      color: color,
      align: TextAlign.center,
      size: EditPanelConstants.editPanelListTileCommonTextSize,
    );
  }

  factory EditPanelTextWidget.selectableName({
    required String content,
    required Color textColor,
  }) {
    return EditPanelTextWidget(
      content: content,
      color: textColor,
      align: TextAlign.center,
      size: EditPanelConstants.editPanelNameTextSize,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      textAlign: align,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}
