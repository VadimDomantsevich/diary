import 'package:diary/home/edit_panel/icon_button_widget.dart';
import 'package:flutter/material.dart';

class BottomRowWidget extends StatelessWidget {
  const BottomRowWidget({
    super.key,
    required this.listOfWidgets,
    required this.onPressedIconButton,
    required this.iconButtonWidget,
  });

  final VoidCallback onPressedIconButton;
  final List<Widget> listOfWidgets;
  final Widget iconButtonWidget;

  factory BottomRowWidget.editList({
    required List<Widget> listOfWidgets,
    required VoidCallback onPressedIconButton,
    required Color themeBorderColor,
  }) {
    return BottomRowWidget(
      listOfWidgets: listOfWidgets,
      onPressedIconButton: onPressedIconButton,
      iconButtonWidget: IconButtonWidget.diaryLists(
        onPressed: onPressedIconButton,
        themeBorderColor: themeBorderColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        iconButtonWidget,
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
