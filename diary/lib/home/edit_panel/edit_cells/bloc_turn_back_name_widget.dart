import 'package:diary/diary_list/diary_list_bloc/diary_list/diary_list_bloc.dart';
import 'package:diary/diary_list_screen/diary_cell_edit/diary_cell_edit_bloc.dart';
import 'package:diary/home/edit_panel/edit_cells/turn_back_name_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BlocTurnBackNameWidget extends StatelessWidget {
  const BlocTurnBackNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryListBloc, DiaryListState>(
      builder: (context, state) {
        return state.maybeWhen(
          cellsEditing: (
            diaryList,
            diaryColumns,
            capitalCells,
            diaryCells,
            cellsKeys,
            firstSelectedCell,
            selectedCells,
            isTextEditing,
            isColorEditing,
            isBordersEditing,
            isBordersStyleEditing,
            lists,
            defaultTextSettings,
            defaultSettings,
          ) {
            return isTextEditing && isColorEditing
                ? TurnBackNameWidget(
                    content: AppLocalizations.of(context).textColor,
                    onPressed: () {
                      context
                          .read<DiaryListBloc>()
                          .add(const TurnBackEditingEvent());
                      context.read<DiaryCellEditBloc>().add(
                            DiaryCellEditEvent.startTextEditing(
                              firstSelectedCell: firstSelectedCell,
                              defaultTextSettings: defaultTextSettings,
                              defaultSettings: defaultSettings,
                            ),
                          );
                    },
                  )
                : !isTextEditing && isColorEditing && !isBordersEditing
                    ? TurnBackNameWidget(
                        content: AppLocalizations.of(context).fillColor,
                        onPressed: () {
                          context.read<DiaryListBloc>().add(
                                const TurnBackEditingEvent(),
                              );
                          context.read<DiaryCellEditBloc>().add(
                                DiaryCellEditEvent.startCellEditing(
                                  firstSelectedCell: firstSelectedCell,
                                ),
                              );
                        },
                      )
                    : !isTextEditing &&
                            !isColorEditing &&
                            isBordersEditing &&
                            !isBordersStyleEditing
                        ? TurnBackNameWidget(
                            content: AppLocalizations.of(context).borders,
                            onPressed: () {
                              context.read<DiaryListBloc>().add(
                                    const TurnBackEditingEvent(),
                                  );
                              context.read<DiaryCellEditBloc>().add(
                                    DiaryCellEditEvent.startCellEditing(
                                      firstSelectedCell: firstSelectedCell,
                                    ),
                                  );
                            },
                          )
                        : !isTextEditing && isColorEditing && isBordersEditing
                            ? TurnBackNameWidget(
                                content:
                                    AppLocalizations.of(context).bordersColor,
                                onPressed: () {
                                  context
                                      .read<DiaryListBloc>()
                                      .add(const TurnBackEditingEvent());
                                  context.read<DiaryCellEditBloc>().add(
                                        const DiaryCellEditEvent
                                            .startBordersEditing(),
                                      );
                                },
                              )
                            : TurnBackNameWidget(
                                content:
                                    AppLocalizations.of(context).bordersStyle,
                                onPressed: () {
                                  context
                                      .read<DiaryListBloc>()
                                      .add(const TurnBackEditingEvent());
                                },
                              );
          },
          capitalCellSelected: (
            diaryList,
            diaryColumns,
            capitalCells,
            diaryCells,
            selectedCapitalCell,
            isEditing,
            isTextEditing,
            isColorEditing,
            isBordersEditing,
            isBordersStyleEditing,
            cellsKeys,
            lists,
            defaultSettings,
          ) {
            return isTextEditing && isColorEditing
                ? TurnBackNameWidget(
                    content: AppLocalizations.of(context).textColor,
                    onPressed: () {
                      context.read<DiaryListBloc>().add(
                            const TurnBackEditingEvent(),
                          );
                      context.read<DiaryCellEditBloc>().add(
                            StartCapitalCellTextEditingEvent(
                              selectedCapitalCell: selectedCapitalCell,
                              defaultSettings: defaultSettings,
                            ),
                          );
                    },
                  )
                : !isTextEditing && isColorEditing && !isBordersEditing
                    ? TurnBackNameWidget(
                        content: AppLocalizations.of(context).fillColor,
                        onPressed: () {
                          context.read<DiaryListBloc>().add(
                                const TurnBackEditingEvent(),
                              );
                          context.read<DiaryCellEditBloc>().add(
                                StartCapitalCellEditingEvent(
                                  selectedCapitalCell: selectedCapitalCell,
                                ),
                              );
                        },
                      )
                    : !isTextEditing &&
                            !isColorEditing &&
                            isBordersEditing &&
                            !isBordersStyleEditing
                        ? TurnBackNameWidget(
                            content: AppLocalizations.of(context).borders,
                            onPressed: () {
                              context.read<DiaryListBloc>().add(
                                    const TurnBackEditingEvent(),
                                  );
                              context.read<DiaryCellEditBloc>().add(
                                    StartCapitalCellEditingEvent(
                                      selectedCapitalCell: selectedCapitalCell,
                                    ),
                                  );
                            },
                          )
                        : !isTextEditing && isColorEditing && isBordersEditing
                            ? TurnBackNameWidget(
                                content:
                                    AppLocalizations.of(context).bordersColor,
                                onPressed: () {
                                  context
                                      .read<DiaryListBloc>()
                                      .add(const TurnBackEditingEvent());
                                  context.read<DiaryCellEditBloc>().add(
                                        DiaryCellEditEvent
                                            .startCapitalCellBordersEditing(
                                          capitalCell: selectedCapitalCell,
                                        ),
                                      );
                                },
                              )
                            : TurnBackNameWidget(
                                content:
                                    AppLocalizations.of(context).bordersStyle,
                                onPressed: () {
                                  context
                                      .read<DiaryListBloc>()
                                      .add(const TurnBackEditingEvent());
                                },
                              );
          },
          orElse: () => Container(),
        );
      },
    );
  }
}
