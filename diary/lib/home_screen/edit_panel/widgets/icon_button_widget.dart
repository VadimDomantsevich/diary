import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.themeBorderColor,
  });

  final VoidCallback onPressed;
  final Widget icon;
  final Color themeBorderColor;

  factory IconButtonWidget.diaryLists({
    required VoidCallback onPressed,
    required Color themeBorderColor,
  }) =>
      IconButtonWidget(
        onPressed: onPressed,
        icon: Icon(
          Icons.menu,
          color: themeBorderColor,
        ),
        themeBorderColor: themeBorderColor,
      );

  factory IconButtonWidget.editCells({
    required VoidCallback onPressed,
    required Color themeBorderColor,
  }) =>
      IconButtonWidget(
        onPressed: onPressed,
        icon: Icon(
          Icons.edit_note,
          color: themeBorderColor,
        ),
        themeBorderColor: themeBorderColor,
      );

  factory IconButtonWidget.changeLocale({
    required VoidCallback onPressed,
    required Color themeBorderColor,
  }) =>
      IconButtonWidget(
        onPressed: onPressed,
        icon: Icon(
          Icons.language,
          color: themeBorderColor,
        ),
        themeBorderColor: themeBorderColor,
      );

  factory IconButtonWidget.themesCollection({
    required VoidCallback onPressed,
    required Color themeBorderColor,
  }) =>
      IconButtonWidget(
        onPressed: onPressed,
        icon: Icon(
          Icons.collections,
          color: themeBorderColor,
        ),
        themeBorderColor: themeBorderColor,
      );

  factory IconButtonWidget.takeTheme({
    required VoidCallback onPressed,
    required Color themeBorderColor,
  }) =>
      IconButtonWidget(
        onPressed: onPressed,
        icon: Icon(
          Icons.add_photo_alternate,
          color: themeBorderColor,
        ),
        themeBorderColor: themeBorderColor,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: themeBorderColor,
            width: EditPanelConstants.editPanelBorderSideWidth,
          ),
        ),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}
