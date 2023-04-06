import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:diary/core/extentions.dart';
import 'package:diary/home_screen/edit_panel/widgets/edit_panel_text_widget.dart';
import 'package:diary/model/diary_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeleteColumnAlertDialog extends StatelessWidget {
  const DeleteColumnAlertDialog({
    super.key,
    required this.title,
    required this.onPressedSubmitButton,
    required this.name,
    required this.diaryList,
  });

  final DiaryList diaryList;
  final String title;
  final String name;
  final VoidCallback onPressedSubmitButton;

  @override
  Widget build(BuildContext context) {
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
      content: EditPanelTextWidget.common(
        content:
            '${AppLocalizations.of(context).areYouShure}\n$name ${AppLocalizations.of(context).willBeDeleted}',
        color: diaryList.settings.themeBorderColor.toColor(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(AppLocalizations.of(context).cancel),
        ),
        TextButton(
          onPressed: () {
            onPressedSubmitButton();
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
