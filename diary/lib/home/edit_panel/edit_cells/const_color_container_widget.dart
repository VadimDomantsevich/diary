import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:diary/home/edit_panel/edit_cells/check_container_widget.dart';
import 'package:flutter/material.dart';

class ConstColorContainerWidget extends StatelessWidget {
  const ConstColorContainerWidget({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.color,
  });

  final bool isSelected;
  final Function(Color) onTap;
  final Color color;

  factory ConstColorContainerWidget.bySelectedColor({
    required Color selectedColor,
    required Function(Color) onTap,
    required Color color,
  }) {
    final isSelected = selectedColor == color;
    return ConstColorContainerWidget(
      isSelected: isSelected,
      onTap: onTap,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(color),
      child: Padding(
        padding: const EdgeInsets.all(
          EditPanelConstants.constColorContainerPadding,
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              height: EditPanelConstants.constColorContainerSize,
              width: EditPanelConstants.constColorContainerSize,
              color: color,
            ),
            isSelected
                ? const Positioned(
                    child: CheckContainerWidget(),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
