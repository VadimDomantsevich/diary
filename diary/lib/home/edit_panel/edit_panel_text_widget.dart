import 'package:diary/core/constants/edit_list_constants.dart';
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
  }) {
    return EditPanelTextWidget(
      content: content,
      color: Colors.blueAccent,
      align: TextAlign.center,
      size: EditListConstants.editPanelSelectedTextSize,
    );
  }

  factory EditPanelTextWidget.common({
    required String content,
  }) {
    return EditPanelTextWidget(
      content: content,
      color: Colors.black,
      align: TextAlign.center,
      size: EditListConstants.editPanelCommonTextSize,
    );
  }

  factory EditPanelTextWidget.panelName({
    required String content,
  }) {
    return EditPanelTextWidget(
      content: content,
      color: Colors.black,
      align: TextAlign.center,
      size: EditListConstants.editPanelNameTextSize,
    );
  }

  factory EditPanelTextWidget.listTileSelected({
    required String content,
  }) {
    return EditPanelTextWidget(
      content: content,
      color: Colors.blueAccent,
      align: TextAlign.center,
      size: EditListConstants.editPanelListTileSelectedTextSize,
    );
  }

  factory EditPanelTextWidget.listTileCommon({
    required String content,
  }) {
    return EditPanelTextWidget(
      content: content,
      color: Colors.black,
      align: TextAlign.center,
      size: EditListConstants.editPanelListTileCommonTextSize,
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
