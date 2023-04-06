import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:diary/core/constants/enums.dart';
import 'package:diary/core/extentions.dart';
import 'package:diary/home_screen/edit_panel/edit_cells/widgets/const_color_container_widget.dart';
import 'package:flutter/material.dart';

class ConstColorContainersColumnWidget extends StatelessWidget {
  const ConstColorContainersColumnWidget({
    super.key,
    required this.colors,
    required this.onTap,
    required this.selectedColor,
  });

  final Function(Color) onTap;
  final Color selectedColor;
  final List<Color> colors;

  factory ConstColorContainersColumnWidget.byMainColor({
    required MainColorsEnum mainColor,
    required Function(Color) onTap,
    required Color selectedColor,
  }) {
    return ConstColorContainersColumnWidget(
      colors: mainColor.getConstColors(),
      onTap: onTap,
      selectedColor: selectedColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        EditPanelConstants.constColorContainersColumnWidgetPadding,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstColorContainerWidget.bySelectedColor(
                selectedColor: selectedColor,
                onTap: onTap,
                color: colors[0],
              ),
              ConstColorContainerWidget.bySelectedColor(
                selectedColor: selectedColor,
                onTap: onTap,
                color: colors[1],
              ),
              ConstColorContainerWidget.bySelectedColor(
                selectedColor: selectedColor,
                onTap: onTap,
                color: colors[2],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstColorContainerWidget.bySelectedColor(
                selectedColor: selectedColor,
                onTap: onTap,
                color: colors[3],
              ),
              ConstColorContainerWidget.bySelectedColor(
                selectedColor: selectedColor,
                onTap: onTap,
                color: colors[4],
              ),
              ConstColorContainerWidget.bySelectedColor(
                selectedColor: selectedColor,
                onTap: onTap,
                color: colors[5],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
