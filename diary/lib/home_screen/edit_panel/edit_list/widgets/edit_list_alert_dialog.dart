import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:diary/model/diary_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditListAlertDialog extends StatelessWidget {
  const EditListAlertDialog({
    super.key,
    required this.diaryList,
    required this.title,
    required this.hintText,
    required this.onPressedSubmitButton,
  });

  final String title;
  final String hintText;
  final DiaryList diaryList;
  final Function(String) onPressedSubmitButton;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(
      text: diaryList.name,
    );

    return AlertDialog(
      title: Text(title),
      elevation: EditPanelConstants.alertDialogElevation,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(EditPanelConstants.alertDialogBorderRadius),
        ),
      ),
      content: TextField(
        controller: controller,
        autofocus: true,
        decoration: InputDecoration(
          hintText: hintText,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(AppLocalizations.of(context).cancel),
        ),
        TextButton(
          onPressed: () {
            onPressedSubmitButton(controller.text);
            Navigator.of(context).pop(controller.text);
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
