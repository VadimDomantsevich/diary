import 'package:diary/core/constants/edit_list_constants.dart';
import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final VoidCallback onPressed;
  final Widget icon;

  factory IconButtonWidget.diaryLists({
    required VoidCallback onPressed,
  }) =>
      IconButtonWidget(
        onPressed: onPressed,
        icon: const Icon(Icons.menu),
      );

  factory IconButtonWidget.editCells({required VoidCallback onPressed}) =>
      IconButtonWidget(
        onPressed: onPressed,
        icon: const Icon(Icons.edit_note),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Color.fromARGB(255, 46, 46, 46),
            width: EditListConstants.editPanelBorderSideWidth,
          ),
        ),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}
