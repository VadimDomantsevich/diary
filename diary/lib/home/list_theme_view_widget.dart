import 'package:diary/core/constants/constants.dart';
import 'package:diary/home/list_theme_text_widget.dart';
import 'package:diary/model/list_theme.dart';
import 'package:flutter/material.dart';

class ListThemeViewWidget extends StatelessWidget {
  const ListThemeViewWidget({
    super.key,
    required this.onTap,
    required this.listTheme,
  });

  final Function(ListTheme) onTap;
  final ListTheme listTheme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(listTheme),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Constants.listThemeViewWidgetVerticalPadding,
          horizontal: Constants.listThemeViewWidgetHorizontalPadding,
        ),
        child: Column(
          children: [
            //Picture
            //Rating
            ListThemeTextWidget.name(content: listTheme.listThemeName),
            ListThemeTextWidget.description(content: listTheme.description),
          ],
        ),
      ),
    );
  }
}
