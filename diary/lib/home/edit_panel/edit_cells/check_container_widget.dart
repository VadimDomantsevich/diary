import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:flutter/material.dart';

class CheckContainerWidget extends StatelessWidget {
  const CheckContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(EditPanelConstants.checkContainerPadding),
      child: Container(
        width: EditPanelConstants.checkContainerSize,
        height: EditPanelConstants.checkContainerSize,
        decoration: const BoxDecoration(
          color: EditPanelConstants.checkContainerBackgroundColor,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.check,
          size: EditPanelConstants.checkContainerIconSize,
        ),
      ),
    );
  }
}
