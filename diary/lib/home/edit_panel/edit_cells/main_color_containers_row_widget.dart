import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:diary/core/constants/enums.dart';
import 'package:diary/home/edit_panel/edit_cells/main_color_container_widget.dart';
import 'package:flutter/material.dart';

class MainColorContainersRowWidget extends StatelessWidget {
  const MainColorContainersRowWidget({
    super.key,
    required this.selectedMainColor,
    required this.onTapBlack,
    required this.onTapRed,
    required this.onTapOrange,
    required this.onTapYellow,
    required this.onTapGreen,
    required this.onTapBlue,
    required this.onTapPurple,
  });

  final MainColorsEnum selectedMainColor;
  final VoidCallback onTapBlack;
  final VoidCallback onTapRed;
  final VoidCallback onTapOrange;
  final VoidCallback onTapYellow;
  final VoidCallback onTapGreen;
  final VoidCallback onTapBlue;
  final VoidCallback onTapPurple;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: EditPanelConstants.mainColorContainersRowPadding,
      ),
      child: FractionallySizedBox(
        widthFactor: EditPanelConstants.editPanelWidthFactor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MainColorContainerWidget.black(
              mainColorsEnum: selectedMainColor,
              onTap: onTapBlack,
            ),
            MainColorContainerWidget.red(
              mainColorsEnum: selectedMainColor,
              onTap: onTapRed,
            ),
            MainColorContainerWidget.orange(
              mainColorsEnum: selectedMainColor,
              onTap: onTapOrange,
            ),
            MainColorContainerWidget.yellow(
              mainColorsEnum: selectedMainColor,
              onTap: onTapYellow,
            ),
            MainColorContainerWidget.green(
              mainColorsEnum: selectedMainColor,
              onTap: onTapGreen,
            ),
            MainColorContainerWidget.blue(
              mainColorsEnum: selectedMainColor,
              onTap: onTapBlue,
            ),
            MainColorContainerWidget.purple(
              mainColorsEnum: selectedMainColor,
              onTap: onTapPurple,
            ),
          ],
        ),
      ),
    );
  }
}
