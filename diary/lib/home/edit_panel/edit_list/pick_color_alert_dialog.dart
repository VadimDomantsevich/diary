import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:diary/core/extentions.dart';
import 'package:diary/home/edit_panel/edit_panel_text_widget.dart';
import 'package:diary/model/diary_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PickColorAlertDialog extends StatelessWidget {
  const PickColorAlertDialog({
    super.key,
    required this.title,
    required this.color,
    required this.onPressedSubmitButton,
    required this.diaryList,
  });

  final DiaryList diaryList;
  final String title;
  final Color color;
  final Function(Color) onPressedSubmitButton;

  @override
  Widget build(BuildContext context) {
    var selectedColor = Color(color.value);

    return AlertDialog(
      title: EditPanelTextWidget.common(
        content: title,
        color: diaryList.settings.themeBorderColor.toColor(),
      ),
      elevation: EditPanelConstants.alertDialogElevation,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(EditPanelConstants.alertDialogBorderRadius),
        ),
      ),
      content: SingleChildScrollView(
        child: MaterialPicker(
          pickerColor: color,
          onColorChanged: (newColor) {
            selectedColor = newColor;
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(AppLocalizations.of(context).cancel),
        ),
        TextButton(
          onPressed: () {
            onPressedSubmitButton(selectedColor);
            Navigator.of(context).pop();
          },
          child: Text(AppLocalizations.of(context).ok),
        ),
      ],
      actionsAlignment: MainAxisAlignment.end,
      actionsPadding: const EdgeInsets.symmetric(
        horizontal: EditPanelConstants.alertDialogActionsPadding,
      ),
    );
  }
}
