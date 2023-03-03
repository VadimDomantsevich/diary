import 'package:flutter/material.dart';

class BorderLineWidget extends StatelessWidget {
  const BorderLineWidget({
    super.key,
    required this.height,
    required this.horizontalPadding,
  });

  final double height;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
        ),
        child: Container(
          height: height,
          color: Colors.black,//const value
        ),
      ),
    );
  }
}
