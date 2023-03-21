import 'package:flutter/material.dart';

class EditPanelBottomColumnWidget extends StatelessWidget {
  const EditPanelBottomColumnWidget({
    super.key,
    required this.listOfWidgets,
    required this.nameWidget,
  });

  final Widget nameWidget;
  final List<Widget> listOfWidgets;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        nameWidget,
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: listOfWidgets,
            ),
          ),
        ),
      ],
    );
  }
}
