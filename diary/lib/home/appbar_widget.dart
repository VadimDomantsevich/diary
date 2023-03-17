import 'package:diary/core/constants/constants.dart';
import 'package:diary/core/extentions.dart';
import 'package:diary/home/edit_panel/icon_button_widget.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.leadingIcon,
    required this.onPressedLeadingIcon,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.actions,
  });

  final Widget leadingIcon;
  final VoidCallback onPressedLeadingIcon;
  final Color backgroundColor;
  final Color foregroundColor;
  final List<Widget> actions;

  factory AppBarWidget.listLoaded({
    required Color backgroundColor,
    required Color foregroundColor,
    required VoidCallback onPressedLanguageIcon,
    required VoidCallback onPressedThemesIcon,
    required Color themeBorderColor,
  }) {
    List<Widget> actions = List<Widget>.empty(growable: true);
    actions.add(
      IconButtonWidget.changeLocale(
        onPressed: onPressedLanguageIcon,
        themeBorderColor: themeBorderColor,
      ),
    );
    actions.add(
      IconButtonWidget.themesCollection(
        onPressed: onPressedThemesIcon,
        themeBorderColor: themeBorderColor,
      ),
    );
    return AppBarWidget(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      leadingIcon: Container(),
      onPressedLeadingIcon: () {},
      actions: actions,
    );
  }

  factory AppBarWidget.cellsSelected({
    required Color backgroundColor,
    required Color foregroundColor,
    required VoidCallback onPressedLeadingIcon,
    required VoidCallback onPressedLanguageIcon,
    required VoidCallback onPressedThemesIcon,
    required Color themeBorderColor,
  }) {
    List<Widget> actions = List<Widget>.empty(growable: true);
    actions.add(
      IconButtonWidget.changeLocale(
        onPressed: onPressedLanguageIcon,
        themeBorderColor: themeBorderColor,
      ),
    );
    actions.add(
      IconButtonWidget.themesCollection(
        onPressed: onPressedThemesIcon,
        themeBorderColor: themeBorderColor,
      ),
    );
    return AppBarWidget(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      leadingIcon: const Icon(Icons.check),
      onPressedLeadingIcon: onPressedLeadingIcon,
      actions: actions,
    );
  }

  factory AppBarWidget.themesLoaded({
    required Color backgroundColor,
    required Color foregroundColor,
    required VoidCallback onPressedLeadingIcon,
    required Color themeBorderColor,
  }) {
    List<Widget> actions = List<Widget>.empty(growable: true);
    return AppBarWidget(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      leadingIcon: const Icon(Icons.arrow_back),
      onPressedLeadingIcon: onPressedLeadingIcon,
      actions: actions,
    );
  }

  factory AppBarWidget.themeViewMode({
    required VoidCallback onPressedLeadingIcon,
    required VoidCallback onPressedTakeTheme,
  }) {
    List<Widget> actions = List<Widget>.empty(growable: true);
    actions.add(
      IconButtonWidget.takeTheme(
        onPressed: onPressedTakeTheme,
        themeBorderColor: Constants.themesLoadedAppBarWidgetForegroundColor.toColor(),
      ),
    );
    return AppBarWidget(
      backgroundColor: Constants.themesLoadedAppBarWidgetBackgroundColor.toColor(),
      foregroundColor: Constants.themesLoadedAppBarWidgetForegroundColor.toColor(),
      leadingIcon: const Icon(Icons.arrow_back),
      onPressedLeadingIcon: onPressedLeadingIcon,
      actions: actions,
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
      actions: actions,
    );
  }
}
