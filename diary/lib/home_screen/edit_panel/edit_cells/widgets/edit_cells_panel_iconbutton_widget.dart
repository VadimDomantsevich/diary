import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:flutter/material.dart';

class EditCellsIconButtonWidget extends StatelessWidget {
  const EditCellsIconButtonWidget({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.color,
  });

  final VoidCallback onPressed;
  final Widget icon;
  final Color color;

  factory EditCellsIconButtonWidget.bold({
    required VoidCallback onPressed,
    required bool isSelected,
    required Color themeColor,
    required Color themeBorderColor,
  }) {
    return EditCellsIconButtonWidget(
      onPressed: onPressed,
      icon: const Icon(
        Icons.format_bold,
      ),
      color: isSelected ? themeColor : themeBorderColor,
    );
  }

  factory EditCellsIconButtonWidget.italic({
    required VoidCallback onPressed,
    required bool isSelected,
    required Color themeColor,
    required Color themeBorderColor,
  }) {
    return EditCellsIconButtonWidget(
      onPressed: onPressed,
      icon: const Icon(
        Icons.format_italic,
      ),
      color: isSelected ? themeColor : themeBorderColor,
    );
  }

  factory EditCellsIconButtonWidget.underline({
    required VoidCallback onPressed,
    required bool isSelected,
    required Color themeColor,
    required Color themeBorderColor,
  }) {
    return EditCellsIconButtonWidget(
      onPressed: onPressed,
      icon: const Icon(
        Icons.format_underline,
      ),
      color: isSelected ? themeColor : themeBorderColor,
    );
  }

  factory EditCellsIconButtonWidget.lineThrough({
    required VoidCallback onPressed,
    required bool isSelected,
    required Color themeColor,
    required Color themeBorderColor,
  }) {
    return EditCellsIconButtonWidget(
      onPressed: onPressed,
      icon: const Icon(
        Icons.format_strikethrough,
      ),
      color: isSelected ? themeColor : themeBorderColor,
    );
  }

  factory EditCellsIconButtonWidget.horizontalLeft({
    required VoidCallback onPressed,
    required bool isSelected,
    required Color themeColor,
    required Color themeBorderColor,
  }) {
    return EditCellsIconButtonWidget(
      onPressed: onPressed,
      icon: const Icon(
        Icons.format_align_left,
      ),
      color: isSelected ? themeColor : themeBorderColor,
    );
  }

  factory EditCellsIconButtonWidget.horizontalCenter({
    required VoidCallback onPressed,
    required bool isSelected,
    required Color themeColor,
    required Color themeBorderColor,
  }) {
    return EditCellsIconButtonWidget(
      onPressed: onPressed,
      icon: const Icon(
        Icons.format_align_center,
      ),
      color: isSelected ? themeColor : themeBorderColor,
    );
  }

  factory EditCellsIconButtonWidget.horizontalRight({
    required VoidCallback onPressed,
    required bool isSelected,
    required Color themeColor,
    required Color themeBorderColor,
  }) {
    return EditCellsIconButtonWidget(
      onPressed: onPressed,
      icon: const Icon(
        Icons.format_align_right,
      ),
      color: isSelected ? themeColor : themeBorderColor,
    );
  }

  factory EditCellsIconButtonWidget.verticalTop({
    required VoidCallback onPressed,
    required bool isSelected,
    required Color themeColor,
    required Color themeBorderColor,
  }) {
    return EditCellsIconButtonWidget(
      onPressed: onPressed,
      icon: const Icon(
        Icons.vertical_align_top,
      ),
      color: isSelected ? themeColor : themeBorderColor,
    );
  }

  factory EditCellsIconButtonWidget.verticalCenter({
    required VoidCallback onPressed,
    required bool isSelected,
    required Color themeColor,
    required Color themeBorderColor,
  }) {
    return EditCellsIconButtonWidget(
      onPressed: onPressed,
      icon: const Icon(
        Icons.vertical_align_center,
      ),
      color: isSelected ? themeColor : themeBorderColor,
    );
  }

  factory EditCellsIconButtonWidget.verticalBottom({
    required VoidCallback onPressed,
    required bool isSelected,
    required Color themeColor,
    required Color themeBorderColor,
  }) {
    return EditCellsIconButtonWidget(
      onPressed: onPressed,
      icon: const Icon(
        Icons.vertical_align_bottom,
      ),
      color: isSelected ? themeColor : themeBorderColor,
    );
  }

  factory EditCellsIconButtonWidget.borderAll({
    required VoidCallback onPressed,
    required bool isSelected,
    required Color themeColor,
    required Color themeBorderColor,
  }) {
    return EditCellsIconButtonWidget(
      onPressed: onPressed,
      icon: const Icon(
        Icons.border_all,
      ),
      color: isSelected ? themeColor : themeBorderColor,
    );
  }

  factory EditCellsIconButtonWidget.borderOuter({
    required VoidCallback onPressed,
    required bool isSelected,
    required Color themeColor,
    required Color themeBorderColor,
  }) {
    return EditCellsIconButtonWidget(
      onPressed: onPressed,
      icon: const Icon(
        Icons.border_outer,
      ),
      color: isSelected ? themeColor : themeBorderColor,
    );
  }

  factory EditCellsIconButtonWidget.borderInner({
    required VoidCallback onPressed,
    required bool isSelected,
    required Color themeColor,
    required Color themeBorderColor,
  }) {
    return EditCellsIconButtonWidget(
      onPressed: onPressed,
      icon: const Icon(
        Icons.border_inner,
      ),
      color: isSelected ? themeColor : themeBorderColor,
    );
  }

  factory EditCellsIconButtonWidget.borderVertical({
    required VoidCallback onPressed,
    required bool isSelected,
    required Color themeColor,
    required Color themeBorderColor,
  }) {
    return EditCellsIconButtonWidget(
      onPressed: onPressed,
      icon: const Icon(
        Icons.border_vertical,
      ),
      color: isSelected ? themeColor : themeBorderColor,
    );
  }

  factory EditCellsIconButtonWidget.borderHorizontal({
    required VoidCallback onPressed,
    required bool isSelected,
    required Color themeColor,
    required Color themeBorderColor,
  }) {
    return EditCellsIconButtonWidget(
      onPressed: onPressed,
      icon: const Icon(
        Icons.border_horizontal,
      ),
      color: isSelected ? themeColor : themeBorderColor,
    );
  }

  factory EditCellsIconButtonWidget.borderLeft({
    required VoidCallback onPressed,
    required bool isSelected,
    required Color themeColor,
    required Color themeBorderColor,
  }) {
    return EditCellsIconButtonWidget(
      onPressed: onPressed,
      icon: const Icon(
        Icons.border_left,
      ),
      color: isSelected ? themeColor : themeBorderColor,
    );
  }

  factory EditCellsIconButtonWidget.borderRight({
    required VoidCallback onPressed,
    required bool isSelected,
    required Color themeColor,
    required Color themeBorderColor,
  }) {
    return EditCellsIconButtonWidget(
      onPressed: onPressed,
      icon: const Icon(
        Icons.border_right,
      ),
      color: isSelected ? themeColor : themeBorderColor,
    );
  }

  factory EditCellsIconButtonWidget.borderTop({
    required VoidCallback onPressed,
    required bool isSelected,
    required Color themeColor,
    required Color themeBorderColor,
  }) {
    return EditCellsIconButtonWidget(
      onPressed: onPressed,
      icon: const Icon(
        Icons.border_top,
      ),
      color: isSelected ? themeColor : themeBorderColor,
    );
  }

  factory EditCellsIconButtonWidget.borderBottom({
    required VoidCallback onPressed,
    required bool isSelected,
    required Color themeColor,
    required Color themeBorderColor,
  }) {
    return EditCellsIconButtonWidget(
      onPressed: onPressed,
      icon: const Icon(
        Icons.border_bottom,
      ),
      color: isSelected ? themeColor : themeBorderColor,
    );
  }

  factory EditCellsIconButtonWidget.borderClear({
    required VoidCallback onPressed,
    required bool isSelected,
    required Color themeColor,
    required Color themeBorderColor,
  }) {
    return EditCellsIconButtonWidget(
      onPressed: onPressed,
      icon: const Icon(
        Icons.border_clear,
      ),
      color: isSelected ? themeColor : themeBorderColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: color,
            width: EditPanelConstants.editCellsPanelBottomBorderSideWidth,
          ),
        ),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        color: color,
      ),
    );
  }
}
