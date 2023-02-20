
import 'package:diary/model/diary_cell.dart';
import 'package:flutter/material.dart';

class TextFieldWidgetDelete extends StatefulWidget {
  const TextFieldWidgetDelete({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final Function(String?) onChanged;

  factory TextFieldWidgetDelete.cell({
    required DiaryCell diaryCell,
    required TextEditingController controller,
    required Function(String?) onChanged,
  }) {
    return TextFieldWidgetDelete(
      controller: controller,
      onChanged: ((value) {
        onChanged(value);
      }),
    );
  }

  @override
  State<TextFieldWidgetDelete> createState() => _TextFieldWidgetDeleteState();
}

class _TextFieldWidgetDeleteState extends State<TextFieldWidgetDelete> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: (value) {
        widget.onChanged(value);
      },
    );
  }
}
