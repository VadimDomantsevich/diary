import 'package:flutter/material.dart';

class SettingsPanelWidget extends StatelessWidget {
  const SettingsPanelWidget({
    super.key,
    required this.dropdownAlignmentWidget,
    required this.confirmChangesButton,
    required this.discardChangesButton,
  });

  final Widget dropdownAlignmentWidget;
  final Widget confirmChangesButton;
  final Widget discardChangesButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        dropdownAlignmentWidget,
        //another settings
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            discardChangesButton,
            confirmChangesButton,
          ],
        )
      ],
    );
  }
}
