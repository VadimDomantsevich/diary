part of 'diary_list_bloc.dart';

@freezed
class DiaryListEvent with _$DiaryListEvent {
  const factory DiaryListEvent.createSample() = CreateSampleEvent;

  const factory DiaryListEvent.initialLoad({
    required bool isThemeTaken,
  }) = InitialLoadEvent;

  const factory DiaryListEvent.getDiaryList({
    required DateTime date,
    required int delay,
  }) = GetDiaryListEvent;

  const factory DiaryListEvent.getDiaryColumns({
    required DiaryList diaryList,
    required List<DiaryList> lists,
  }) = GetDiaryColumnsEvent;

  const factory DiaryListEvent.getDiaryCells({
    required DiaryList diaryList,
    required List<DiaryColumn> diaryColumns,
    required List<CapitalCell> capitalCells,
    required List<DiaryList> lists,
  }) = GetDiaryCellsEvent;

  const factory DiaryListEvent.selectDiaryCell({
    required DiaryCell diaryCell,
  }) = SelectDiaryCellEvent;

  const factory DiaryListEvent.selectDiaryCells({
    required List<DiaryCell> diaryCells,
  }) = SelectDiaryCellsEvent;

  const factory DiaryListEvent.selectCapitalCell({
    required CapitalCell capitalCell,
  }) = SelectCapitalCellEvent;

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
    String? addedColumnName,
    int? addedColumnCount,
  }) = ReturnToLoadedEvent;

  const factory DiaryListEvent.returnToCellsSelected() =
      ReturnToCellsSelectedEvent;

  const factory DiaryListEvent.updateDiaryListName({
    required DiaryList diaryList,
    required String newName,
  }) = UpdateDiaryListNameEvent;

  const factory DiaryListEvent.changeDiaryCell({
    required DiaryCell diaryCell,
    required String textFieldText,
  }) = ChangeDiaryCellEvent;

  const factory DiaryListEvent.changeCapitalCell({
    required CapitalCell capitalCell,
    required String textFieldText,
  }) = ChangeCapitalCellEvent;

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

  const factory DiaryListEvent.changeCapitalCellSettings({
    FontWeightEnum? fontWeight,
    TextDecorationEnum? textDecoration,
    FontStyleEnum? fontStyle,
    double? fontSize,
    String? color,
    HorizontalAlignmentsEnum? horizontalAlignment,
    VerticalAlignmentsEnum? verticalAlignment,
    String? backgroundColor,
    BordersStyleEnum? bordersStyleEnum,
    Color? bordersColor,
  }) = ChangeCapitalCellSettingsEvent;

  const factory DiaryListEvent.updateDiaryCellSettingsInFirebase({
    required DiaryCell diaryCell,
    required int index,
    DiaryCellTextSettings? newTextSettings,
    DiaryCellSettings? newSettings,
  }) = UpdateDiaryCellSettingsInFirebaseEvent;

  const factory DiaryListEvent.updateCapitalCellSettingsInFirebase({
    required DiaryColumnSettings newSettings,
  }) = UpdateCapitalCellSettingsInFirebaseEvent;

  const factory DiaryListEvent.updateCapitalCellWidth({
    required PointerMoveEvent details,
  }) = UpdateCapitalCellWidthEvent;

  const factory DiaryListEvent.updateCapitalCellWidthInFirebase({
    required PointerUpEvent details,
  }) = UpdateCapitalCellWidthInFirebaseEvent;

  const factory DiaryListEvent.startEditingCells({
    required bool isTextEditing,
  }) = StartEditingCellsEvent;

  const factory DiaryListEvent.createDiaryColumn({
    required DiaryList diaryList,
    required String name,
    required int columnsCount,
    required List<DiaryColumn> diaryColumns,
  }) = CreateDiaryColumnEvent;

  const factory DiaryListEvent.deleteDiaryColumn({
    required DiaryList diaryList,
    required String columnId,
  }) = DeleteDiaryColumnEvent;

  const factory DiaryListEvent.updateDiaryListSettings({
    required DiaryList diaryList,
    String? themeColor,
    String? themeBorderColor,
    String? themePanelBackgroundColor,
  }) = UpdateDiaryListSettingsEvent;

  const factory DiaryListEvent.shareTheme({
    required DiaryList diaryList,
    required List<DiaryColumn> diaryColumns,
    required List<DiaryCell> diaryCells,
    required List<CapitalCell> capitalCells,
    required String themeName,
    required String description,
  }) = ShareThemeEvent;

  const factory DiaryListEvent.startEditingColor() = StartEditingColorEvent;

  const factory DiaryListEvent.startEditingBorders() = StartEditingBordersEvent;

  const factory DiaryListEvent.startEditingBorderStyle() =
      StartEditingBordersStyleEvent;

  const factory DiaryListEvent.turnBackEditing() = TurnBackEditingEvent;

  const factory DiaryListEvent.startColumnDeleting() = StartColumnDeletingEvent;

  const factory DiaryListEvent.startColorThemeEditing() =
      StartColorThemeEditingEvent;

  const factory DiaryListEvent.deleteColumns() = DeleteColumnsEvent;

  const factory DiaryListEvent.loadThemes() = LoadThemesEvent;

  const factory DiaryListEvent.loadFromTheme({
    required ListTheme listTheme,
  }) = LoadFromThemeEvent;

  const factory DiaryListEvent.takeTheme({
    required ListTheme listTheme,
  }) = TakeThemeEvent;
}
