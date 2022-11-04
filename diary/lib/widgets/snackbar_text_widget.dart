import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SnackBarTextWidget extends StatelessWidget {
  const SnackBarTextWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) => AutoSizeText(
        text,
        style: Theme.of(context).copyWith().textTheme.subtitle1,
      );
}
