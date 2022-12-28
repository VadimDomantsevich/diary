import 'package:flutter/material.dart';

class MenuItemCardWidget extends StatelessWidget {
  const MenuItemCardWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: ListTile(
        title: Text(text),
      ),
    );
  }
}
