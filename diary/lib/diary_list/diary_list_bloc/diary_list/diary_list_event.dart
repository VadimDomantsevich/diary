part of 'diary_list_bloc.dart';

@freezed
class DiaryListEvent with _$DiaryListEvent {
  const factory DiaryListEvent.createSample() = CreateSampleEvent;

  const factory DiaryListEvent.getDiaryList({
    required DateTime date,
  }) = GetDiaryListEvent;

  const factory DiaryListEvent.getDiaryColumns({
    required DiaryList diaryList,
    required List<DiaryList> lists,
  }) = GetDiaryColumnsEvent;

  const factory DiaryListEvent.getDiaryCells({
    required DiaryList diaryList,
    required List<DiaryColumn> diaryColumns,
    required List<DiaryList> lists,
  }) = GetDiaryCellsEvent;

  const factory DiaryListEvent.selectDiaryCell({
    required DiaryCell diaryCell,
  }) = SelectDiaryCellEvent;

  const factory DiaryListEvent.selectDiaryCells({
    required List<DiaryCell> diaryCells,
  }) = SelectDiaryCellsEvent;

  const factory DiaryListEvent.onPanUpdate({
    required DiaryCell diaryCell,
    required GlobalObjectKey cellKey,
    required DragUpdateDetails details,
    required double scaleFactor,
  }) = OnPanUpdateEvent;

  const factory DiaryListEvent.startEditingList({
    DiaryList? selectedList,
  }) = StartEditingListEvent;

  const factory DiaryListEvent.returnToLoaded({
    String? newName,
  }) = ReturnToLoadedEvent;

  const factory DiaryListEvent.returnToCellsSelected() =
      ReturnToCellsSelectedEvent;

  const factory DiaryListEvent.updateDiaryListName({
    required DiaryList diaryList,
    required String newName,
  }) = UpdateDiaryListNameEvent;

  const factory DiaryListEvent.changeDiaryCell({
    required DiaryCell diaryCell,
    String? textFieldText,
  }) = ChangeDiaryCellEvent;

  const factory DiaryListEvent.updateDiaryCellInFirebase({
    required DiaryCell diaryCell,
    String? textFieldText,
  }) = UpdateDiaryCellInFirebaseEvent;

  const factory DiaryListEvent.changeDiaryCellsSettings({
    FontWeightEnum? fontWeight,
    TextDecorationEnum? textDecoration,
    FontStyleEnum? fontStyle,
    double? fontSize,
    String? color,
    HorizontalAlignmentsEnum? horizontalAlignment,
    VerticalAlignmentsEnum? verticalAlignment,
    String? backgroundColor,
  }) = ChangeDiaryCellsSettingsEvent;

  const factory DiaryListEvent.changeDiaryCellsBordersSettings({
    required BordersEditingEnum bordersEditingEnum,
    required BordersStyleEnum bordersStyleEnum,
    required Color bordersColor,
  }) = ChangeDiaryCellsBordersSettingsEvent;

  const factory DiaryListEvent.updateDiaryCellsSettingsInFirebase({
    required List<DiaryCell> diaryCells,
    FontWeightEnum? fontWeight,
    TextDecorationEnum? textDecoration,
    FontStyleEnum? fontStyle,
    double? fontSize,
    String? color,
    HorizontalAlignmentsEnum? horizontalAlignment,
    VerticalAlignmentsEnum? verticalAlignment,
  }) = UpdateDiaryCellsSettingsInFirebaseEvent;

  const factory DiaryListEvent.updateDefaultCellsSettingsInFirebase({
    FontWeightEnum? fontWeight,
    TextDecorationEnum? textDecoration,
    FontStyleEnum? fontStyle,
    double? fontSize,
    String? color,
  }) = UpdateDefaultCellsSettingsInFirebaseEvent;

  const factory DiaryListEvent.startEditingCells({
    required bool isTextEditing,
  }) = StartEditingCellsEvent;

  const factory DiaryListEvent.startEditingColor() = StartEditingColorEvent;

  const factory DiaryListEvent.startEditingBorders() = StartEditingBordersEvent;

  const factory DiaryListEvent.startEditingBorderStyle() = StartEditingBordersStyleEvent;

  const factory DiaryListEvent.turnBackEditing() =
      TurnBackEditingEvent;
}
