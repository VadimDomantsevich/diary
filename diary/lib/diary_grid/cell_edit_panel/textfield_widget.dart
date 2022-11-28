
import 'package:diary/model/diary_cell.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final Function(String?) onChanged;

  factory TextFieldWidget.cell({
    required DiaryCell diaryCell,
    required TextEditingController controller,
    required Function(String?) onChanged,
  }) {
    return TextFieldWidget(
      controller: controller,
      onChanged: ((value) {
        onChanged(value);
      }),
    );
  }

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onEditingComplete: () {
        widget.onChanged(widget.controller.text);
      },
      //onChanged: ((value) => widget.onChanged(value)),
    );
  }
}
