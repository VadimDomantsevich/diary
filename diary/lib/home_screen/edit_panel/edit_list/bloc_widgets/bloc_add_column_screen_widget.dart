import 'package:diary/blocs/diary_cell_edit_bloc/diary_cell_edit_bloc.dart';
import 'package:diary/blocs/diary_list_bloc/diary_list_bloc.dart';
import 'package:diary/core/extentions.dart';
import 'package:diary/home_screen/edit_panel/edit_list/widgets/add_column_screen_widget.dart';
import 'package:diary/home_screen/edit_panel/widgets/edit_panel_text_widget.dart';
import 'package:diary/model/diary_column.dart';
import 'package:diary/model/diary_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BlocAddColumnScreenWidget extends StatelessWidget {
  const BlocAddColumnScreenWidget({
    super.key,
    required this.diaryList,
    required this.diaryColumns,
  });

  final DiaryList diaryList;
  final List<DiaryColumn> diaryColumns;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryCellEditBloc, DiaryCellEditState>(
      builder: (context, state) {
        return state.maybeWhen(
          columnsCountEditing: (columnsCount) {
            return AddColumnScreenWidget(
              diaryList: diaryList,
              title: AppLocalizations.of(context).addColumn,
              hintText: AppLocalizations.of(context).columnName,
              onPressedSubmitButton: (name, columnsCount) {
                context.read<DiaryListBloc>().add(
                      DiaryListEvent.createDiaryColumn(
                        diaryList: diaryList,
                        name: name,
                        columnsCount: columnsCount,
                        diaryColumns: diaryColumns,
                      ),
                    );
              },
              onPressedUp: () {
                context.read<DiaryCellEditBloc>().add(
                      ChangeColumnsCountEvent(
                        columnsCount: columnsCount + 1,
                      ),
                    );
              },
              onPressedDown: () {
                context.read<DiaryCellEditBloc>().add(
                      ChangeColumnsCountEvent(
                        columnsCount: columnsCount - 1,
                      ),
                    );
              },
              textWidget: EditPanelTextWidget.common(
                content: AppLocalizations.of(context).numberOfSubcolumns,
                color: diaryList.settings.themeBorderColor.toColor(),
              ),
              columnsCount: columnsCount,
            );
          },
          orElse: () => AddColumnScreenWidget(
            diaryList: diaryList,
            title: AppLocalizations.of(context).addColumn,
            hintText: AppLocalizations.of(context).columnName,
            onPressedSubmitButton: (name, columnsCount) {
              context.read<DiaryListBloc>().add(
                    DiaryListEvent.createDiaryColumn(
                      diaryList: diaryList,
                      name: name,
                      columnsCount: columnsCount,
                      diaryColumns: diaryColumns,
                    ),
                  );
            },
            onPressedUp: () {
              context.read<DiaryCellEditBloc>().add(
                    const StartColumnsCountEditingEvent(),
                  );
              context.read<DiaryCellEditBloc>().add(
                    const ChangeColumnsCountEvent(
                      columnsCount: 2,
                    ),
                  );
            },
            onPressedDown: () {
              context.read<DiaryCellEditBloc>().add(
                    const StartColumnsCountEditingEvent(),
                  );
              context.read<DiaryCellEditBloc>().add(
                    const ChangeColumnsCountEvent(
                      columnsCount: 1,
                    ),
                  );
            },
            textWidget: EditPanelTextWidget.common(
              content: AppLocalizations.of(context).numberOfSubcolumns,
              color: diaryList.settings.themeBorderColor.toColor(),
            ),
            columnsCount: 1,
          ),
        );
      },
    );
  }
}
