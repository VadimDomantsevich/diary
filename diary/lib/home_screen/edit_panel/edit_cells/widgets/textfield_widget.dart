import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.themeBorderColor,
    required this.themePanelBackgroundColor,
  });

  final TextEditingController controller;
  final Function(String?) onChanged;
  final Color themeBorderColor;
  final Color themePanelBackgroundColor;

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
          style: TextStyle(
              color: themeBorderColor,
              backgroundColor: themePanelBackgroundColor),
          onChanged: (value) => onChanged(value),
        ),
      ),
    );
  }
}
