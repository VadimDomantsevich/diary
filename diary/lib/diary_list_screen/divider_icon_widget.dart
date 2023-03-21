import 'package:diary/core/constants/constants.dart';
import 'package:flutter/material.dart';

class DividerIconWidget extends StatelessWidget {
  const DividerIconWidget({
    super.key,
    required this.onPointerMove,
    required this.onPointerUp,
  });

  final Function(PointerMoveEvent) onPointerMove;
  final Function(PointerUpEvent) onPointerUp;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerMove: (details) => onPointerMove(details),
      onPointerUp: (details) => onPointerUp(details),
      child: const Padding(
        padding: EdgeInsets.all(Constants.dividerIconWidgetPadding),
        child: SizedBox(
          height: Constants.dividerIconSize,
          width: Constants.dividerIconSize,
          child: Icon(
            Icons.arrow_left,
          ),
        ),
      ),
    );
  }
}
