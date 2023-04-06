import 'package:diary/core/constants/constants.dart';
import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShareThemeScreenWidget extends StatelessWidget {
  const ShareThemeScreenWidget({
    super.key,
    required this.title,
    required this.themeNameHintText,
    required this.descriptionHintText,
    required this.onPressedSubmitButton,
  });

  final String title;
  final String themeNameHintText;
  final String descriptionHintText;
  final Function(String, String) onPressedSubmitButton;

  @override
  Widget build(BuildContext context) {
    TextEditingController themeNameController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    return AlertDialog(
      title: Text(title),
      elevation: EditPanelConstants.alertDialogElevation,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(EditPanelConstants.alertDialogBorderRadius),
        ),
      ),
      content: SizedBox(
        height: Constants.shareThemeAlertDialogHeight,
        child: Column(
          children: [
            TextField(
              controller: themeNameController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: themeNameHintText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: Constants.shareThemeAlertDialogTextFieldTopPadding,
              ),
              child: TextField(
                controller: descriptionController,
                minLines: 1,
                maxLines: Constants.shareThemeAlertDialogDescriptionMaxLines,
                decoration: InputDecoration(
                  hintText: descriptionHintText,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(AppLocalizations.of(context).cancel),
        ),
        TextButton(
          onPressed: () {
            onPressedSubmitButton(
              themeNameController.text,
              descriptionController.text,
            );
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
