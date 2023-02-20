import 'package:flutter/material.dart';

class EditCellsNameRowWidget extends StatelessWidget {
  const EditCellsNameRowWidget({
    super.key,
    required this.isTextEditing,
    required this.textEditingWidget,
    required this.cellEditingWidget,
  });

  final bool isTextEditing;
  final Widget textEditingWidget;
  final Widget cellEditingWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: textEditingWidget,
        ),
        Expanded(
          child: cellEditingWidget,
        ),
      ],
    );
  }
}
