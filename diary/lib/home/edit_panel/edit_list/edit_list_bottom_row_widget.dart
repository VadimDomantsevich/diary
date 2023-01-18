import 'package:diary/home/edit_panel/icon_button_widget.dart';
import 'package:flutter/material.dart';

class EditListBottomRowWidget extends StatelessWidget {
  const EditListBottomRowWidget({
    super.key,
    required this.listOfWidgets,
    required this.onPressedIconButton,
  });

  final VoidCallback onPressedIconButton;
  final List<Widget> listOfWidgets;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        IconButtonWidget.diaryLists(
          onPressed: onPressedIconButton,
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: listOfWidgets,
            ),
          ),
        ),
      ],
    );
  }
}
