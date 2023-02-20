import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.leadingIcon,
    required this.onPressedLeadingIcon,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  final Widget leadingIcon;
  final VoidCallback onPressedLeadingIcon;
  final Color backgroundColor;
  final Color foregroundColor;

  factory AppBarWidget.listLoaded({
    required Color backgroundColor,
    required Color foregroundColor,
    // required VoidCallback onPressedLeadingIcon,
  }) {
    return AppBarWidget(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      leadingIcon: Container(), // const Icon(Icons.arrow_back),
      onPressedLeadingIcon: (){},
    );
  }

  factory AppBarWidget.cellsSelected({
    required Color backgroundColor,
    required Color foregroundColor,
    required VoidCallback onPressedLeadingIcon,
  }) {
    return AppBarWidget(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      leadingIcon: const Icon(Icons.check),
      onPressedLeadingIcon: onPressedLeadingIcon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      leading: IconButton(
        icon: leadingIcon,
        onPressed: onPressedLeadingIcon,
      ),
    );
  }
}
