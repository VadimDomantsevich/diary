import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:diary/model/list_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TakeThemeAlertDialogWidget extends StatelessWidget {
  const TakeThemeAlertDialogWidget({
    super.key,
    required this.listTheme,
    required this.onPressedSubmitButton,
  });

  final Function(ListTheme) onPressedSubmitButton;
  final ListTheme listTheme;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context).setThemeToYourselfAsDefault),
      elevation: EditPanelConstants.alertDialogElevation,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(EditPanelConstants.alertDialogBorderRadius),
        ),
      ),
      content: Text(AppLocalizations.of(context).oldDataWillBeLost),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(AppLocalizations.of(context).cancel),
        ),
        TextButton(
          onPressed: () {
            onPressedSubmitButton(listTheme);
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
