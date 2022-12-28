import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.onPressed,
    required this.iconWidget,
    required this.labelWidget,
    required this.buttonStyle,
  });

  final VoidCallback onPressed;
  final Widget iconWidget;
  final Widget labelWidget;
  final ButtonStyle buttonStyle;

  factory ButtonWidget.confirm({
    required VoidCallback onPressed,
  }) {
    return ButtonWidget(
      onPressed: onPressed,
      iconWidget: const Icon(Icons.check),
      labelWidget: const Text('confirm'), //create TextWidget?
      buttonStyle: const ButtonStyle(
        // create ButtonStyle separately, check all the params
        backgroundColor: MaterialStatePropertyAll<Color>(Colors.greenAccent),
        foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
      ),
    );
  }
  factory ButtonWidget.discard({
    required VoidCallback onPressed,
  }) {
    return ButtonWidget(
      onPressed: onPressed,
      iconWidget: const Icon(Icons.cancel_outlined),
      labelWidget: const Text('discard'), //create TextWidget?
      buttonStyle: const ButtonStyle(
        // create ButtonStyle separately, check all the params
        backgroundColor: MaterialStatePropertyAll<Color>(Colors.redAccent),
        foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: iconWidget,
      label: labelWidget,
      style: buttonStyle,
    );
  }
}
