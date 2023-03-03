import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: EditPanelConstants.textFieldHorizontalPadding,
        vertical: EditPanelConstants.textFieldVerticalPadding,
      ),
      child: FractionallySizedBox(
        widthFactor: EditPanelConstants.editPanelWidthFactor,
        child: TextField(
          controller: controller,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          onChanged: (value) => onChanged(value),
        ),
      ),
    );
  }
}
