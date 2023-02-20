import 'package:diary/core/constants/enums.dart';
import 'package:diary/core/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DropdownAlignmentWidget extends StatelessWidget {
  const DropdownAlignmentWidget({
    super.key,
    required this.onChanged,
    required this.items,
  });

  final Function(String?) onChanged;
  final List<DropdownMenuItem> items;

  factory DropdownAlignmentWidget.allAlignments({
    required Function(String?) onChanged,
    required BuildContext context,
  }) {
    List<DropdownMenuItem<String?>> items = <DropdownMenuItem<String?>>[];
    for (var alignment in AlignmentsEnum.values) {
      final menuItem = DropdownMenuItem(
        value: alignment.name,
        child: Text('AHAH')
            // Text(converterLocalizationStringFromAlignment(context, alignment)),
      );
      items.add(menuItem);
    }
    return DropdownAlignmentWidget(
      onChanged: onChanged,
      items: items,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      hint: Text(AppLocalizations.of(context).alignmentHint),
      icon: const Icon(Icons.format_align_center),
      items: items,
      onChanged: (value) {
        onChanged(value);
      },
    );
  }
}
