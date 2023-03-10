import 'package:diary/home/edit_panel/icon_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.leadingIcon,
    required this.onPressedLeadingIcon,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.languageIcon,
  });

  final Widget leadingIcon;
  final VoidCallback onPressedLeadingIcon;
  final Color backgroundColor;
  final Color foregroundColor;
  final Widget languageIcon;

  factory AppBarWidget.listLoaded({
    required Color backgroundColor,
    required Color foregroundColor,
    required VoidCallback onPressedLanguageIcon,
    required Color themeBorderColor,
  }) {
    return AppBarWidget(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      leadingIcon: Container(),
      onPressedLeadingIcon: () {},
      languageIcon: IconButtonWidget.changeLocale(
        onPressed: onPressedLanguageIcon,
        themeBorderColor: themeBorderColor,
      ),
    );
  }

  factory AppBarWidget.cellsSelected({
    required Color backgroundColor,
    required Color foregroundColor,
    required VoidCallback onPressedLeadingIcon,
    required VoidCallback onPressedLanguageIcon,
    required Color themeBorderColor,
  }) {
    return AppBarWidget(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      leadingIcon: const Icon(Icons.check),
      onPressedLeadingIcon: onPressedLeadingIcon,
      languageIcon: IconButtonWidget.changeLocale(
        onPressed: onPressedLanguageIcon,
        themeBorderColor: themeBorderColor,
      ),
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
      actions: [
        languageIcon,
      ],
    );
  }
}
