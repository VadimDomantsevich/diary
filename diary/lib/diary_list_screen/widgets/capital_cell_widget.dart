import 'package:diary/core/constants/constants.dart';
import 'package:diary/core/extentions.dart';
import 'package:diary/diary_list_screen/bloc_widgets/bloc_divider_icon_widget.dart';
import 'package:diary/diary_list_screen/widgets/diary_cell_content_widget.dart';
import 'package:diary/model/capital_cell.dart';
import 'package:flutter/material.dart';

class CapitalCellWidget extends StatelessWidget {
  const CapitalCellWidget({
    super.key,
    required this.contentWidget,
    required this.height,
    required this.width,
    required this.backgroundColor,
    required this.alignment,
    required this.border,
    required this.shadowColor,
    required this.onTap,
    required this.dividerIconAlignment,
    required this.isSelected,
  });

  final Widget contentWidget;
  final double height;
  final double width;
  final Color backgroundColor;
  final Alignment alignment;
  final Border border;
  final Color shadowColor;
  final VoidCallback onTap;
  final Alignment dividerIconAlignment;
  final bool isSelected;

  factory CapitalCellWidget.common({
    required Alignment alignment,
    required VoidCallback onTap,
    required double height,
    required double width,
    required Border border,
    required Widget contentWidget,
    required Color backgroundColor,
    required Alignment dividerIconAlignment,
  }) {
    return CapitalCellWidget(
      contentWidget: contentWidget,
      height: height,
      width: width,
      backgroundColor: backgroundColor,
      alignment: alignment,
      border: border,
      shadowColor: Colors.transparent,
      onTap: onTap,
      dividerIconAlignment: dividerIconAlignment,
      isSelected: false,
    );
  }

  factory CapitalCellWidget.model({
    required CapitalCell capitalCell,
    required VoidCallback onTap,
    required bool isSelected,
    required Color themeColor,
  }) {
    final alignment = capitalCell.settings.capitalCellAlignment.alignment;
    final border = Border(
      top: BorderSide(
        width: capitalCell.settings.capitalCellBorderWidth,
        color: capitalCell.settings.capitalCellBorderColor.toColor(),
      ),
      bottom: BorderSide(
        width: capitalCell.settings.capitalCellBorderWidth,
        color: capitalCell.settings.capitalCellBorderColor.toColor(),
      ),
      right: BorderSide(
        width: capitalCell.settings.capitalCellBorderWidth,
        color: capitalCell.settings.capitalCellBorderColor.toColor(),
      ),
    );
    double height = capitalCell.settings.capitalCellHeight;
    double width = 0;
    for (var element in capitalCell.settings.width) {
      width += element;
    }
    final backgroundColor =
        capitalCell.settings.capitalCellBackgroundColor.toColor();
    var dividerIconAlignment = Alignment.bottomRight;
    alignment == Alignment.bottomRight
        ? dividerIconAlignment = Alignment.topRight
        : dividerIconAlignment;
    return isSelected
        ? CapitalCellWidget.selected(
            alignment: alignment,
            onTap: onTap,
            height: height,
            width: width,
            border: border,
            contentWidget:
                DiaryCellContentWidget.capitalCell(capitalCell: capitalCell),
            backgroundColor: backgroundColor,
            dividerIconAlignment: dividerIconAlignment,
            themeColor: themeColor,
          )
        : CapitalCellWidget.common(
            alignment: alignment,
            onTap: onTap,
            height: height,
            width: width,
            border: border,
            contentWidget:
                DiaryCellContentWidget.capitalCell(capitalCell: capitalCell),
            backgroundColor: backgroundColor,
            dividerIconAlignment: dividerIconAlignment,
          );
  }

  factory CapitalCellWidget.selected({
    required Alignment alignment,
    required VoidCallback onTap,
    required double height,
    required double width,
    required Border border,
    required Widget contentWidget,
    required Color backgroundColor,
    required Alignment dividerIconAlignment,
    required Color themeColor,
  }) {
    return CapitalCellWidget(
      contentWidget: contentWidget,
      height: height,
      width: width,
      backgroundColor: backgroundColor,
      alignment: alignment,
      border: border,
      shadowColor: themeColor.withOpacity(Constants.shadowColorOpacity),
      onTap: onTap,
      dividerIconAlignment: dividerIconAlignment,
      isSelected: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            height: height,
            width: width,
            alignment: alignment,
            decoration: BoxDecoration(
              border: border,
              color: backgroundColor,
            ),
            child: contentWidget,
          ),
          Positioned.fill(
            child: Container(
              color: shadowColor,
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: dividerIconAlignment,
              child: BlocDividerIconWidget(
                isSelected: isSelected,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
