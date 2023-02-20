import 'package:diary/home/edit_panel/icon_button_widget.dart';
import 'package:flutter/material.dart';

class BottomIconAndTextFieldWidget extends StatelessWidget {
  const BottomIconAndTextFieldWidget({
    super.key,
    required this.onPressedIconButton,
    required this.textFieldWidget,
    required this.iconButtonWidget,
  });

  final VoidCallback onPressedIconButton;
  final Widget textFieldWidget;
  final Widget iconButtonWidget;

  factory BottomIconAndTextFieldWidget.editCell({
    required VoidCallback onPressedIconButton,
    required Widget textFieldWidget,
  }) {
    return BottomIconAndTextFieldWidget(
      onPressedIconButton: onPressedIconButton,
      textFieldWidget: textFieldWidget,
      iconButtonWidget: IconButtonWidget.editCells(
        onPressed: onPressedIconButton,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        iconButtonWidget,
        Expanded(child: textFieldWidget),
      ],
    );
  }
}
