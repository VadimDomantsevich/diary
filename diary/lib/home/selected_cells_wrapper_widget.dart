import 'package:flutter/material.dart';

class SelectedCellsWrapperWidget extends StatelessWidget {
  const SelectedCellsWrapperWidget({
    super.key,
    required this.width,
    required this.height,
    //required this.widget,
  });
  final double width;
  final double height;
  //final Widget widget;
  //final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: ((details) {}),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red,
            width: 3,
          ),
        ),
        //child: widget,
      ),
    );
  }
}
