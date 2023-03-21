import 'package:diary/core/constants/constants.dart';
import 'package:diary/core/constants/edit_panel_constants.dart';
import 'package:diary/home/edit_panel/edit_list/columns_count_edit_widget.dart';
import 'package:diary/model/diary_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddColumnScreenWidget extends StatelessWidget {
  const AddColumnScreenWidget({
    super.key,
    required this.title,
    required this.hintText,
    required this.onPressedSubmitButton,
    required this.onPressedUp,
    required this.onPressedDown,
    required this.textWidget,
    required this.columnsCount,
    required this.diaryList,
  });

  final DiaryList diaryList;
  final String title;
  final String hintText;
  final Widget textWidget;
  final VoidCallback onPressedUp;
  final VoidCallback onPressedDown;
  final Function(String, int) onPressedSubmitButton;
  final int columnsCount;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return AlertDialog(
      title: Text(title),
      elevation: EditPanelConstants.alertDialogElevation,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(EditPanelConstants.alertDialogBorderRadius),
        ),
      ),
      content: SizedBox(
        height: Constants.addColumnAlertDialogHeight,
        child: Column(
          children: [
            TextField(
              controller: controller,
              autofocus: true,
              decoration: InputDecoration(
                hintText: hintText,
              ),
            ),
            ColumnsCountEditWidget(
              diaryList: diaryList,
              textWidget: textWidget,
              onPressedUp: onPressedUp,
              onPressedDown: onPressedDown,
              columnsCount: columnsCount,
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
              controller.text,
              columnsCount,
            );
            final values = <dynamic>[controller.text, columnsCount];
            Navigator.of(context).pop(values);
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
