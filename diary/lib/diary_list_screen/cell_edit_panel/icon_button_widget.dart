import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    super.key,
    required this.iconWidget,
    required this.onPressed,
  });

  final Widget iconWidget;
  final VoidCallback onPressed;

  factory IconButtonWidget.settings({
    required VoidCallback onPressed,
  }) {
    return IconButtonWidget(
      iconWidget: const Icon(Icons.settings),
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: iconWidget,
      onPressed: onPressed,
    );
  }
}
