part of 'diary_list_bloc.dart';

@freezed
class DiaryListState with _$DiaryListState {
  const factory DiaryListState.initial() = _Initial;

  const factory DiaryListState.listLoaded({
    required DiaryList diaryList,
    required List<DiaryList> lists,
  }) = _ListLoaded;

  const factory DiaryListState.columnsLoaded({
    required DiaryList diaryList,
    required List<DiaryColumn> diaryColumns,
    required List<CapitalCell> capitalCells,
    required List<DiaryList> lists,
  }) = _ColumnsLoaded;

  const factory DiaryListState.loaded({
    required DiaryList diaryList,
    required List<DiaryColumn> diaryColumns,
    required List<CapitalCell> capitalCells,
    required List<DiaryCell> diaryCells,
    required List<GlobalObjectKey> cellsKeys,
    required List<DiaryList> lists,
    required bool isListThemeViewMode,
    ListTheme? listTheme,
  }) = _Loaded;

  const factory DiaryListState.cellsSelected({
    required DiaryList diaryList,
    required List<DiaryColumn> diaryColumns,
    required List<CapitalCell> capitalCells,
    required List<DiaryCell> diaryCells,
    required DiaryCell firstSelectedCell,
    required List<DiaryCell> selectedCells,
    required List<GlobalObjectKey> cellsKeys,
    required List<DiaryList> lists,
    required DiaryCellTextSettings defaultTextSettings,
    required DiaryCellSettings defaultSettings,
    required bool isListThemeViewMode,
    ListTheme? listTheme,
  }) = _CellsSelected;

  const factory DiaryListState.capitalCellSelected({
    required DiaryList diaryList,
    required List<DiaryColumn> diaryColumns,
    required List<CapitalCell> capitalCells,
    required List<DiaryCell> diaryCells,
    required CapitalCell selectedCapitalCell,
    required bool isEditing,
    required bool isTextEditing,
    required bool isColorEditing,
    required bool isBordersEditing,
    required bool isBordersStyleEditing,
    required List<GlobalObjectKey> cellsKeys,
    required List<DiaryList> lists,
    required DiaryColumnSettings defaultSettings,
    required bool isListThemeViewMode,
    ListTheme? listTheme,
  }) = _CapitalCellSelected;

  const factory DiaryListState.listEditing({
    required DiaryList diaryList,
    required List<DiaryColumn> diaryColumns,
    required List<CapitalCell> capitalCells,
    required List<DiaryCell> diaryCells,
    required List<GlobalObjectKey> cellsKeys,
    required List<DiaryList> lists,
    required bool isColumnDeleting,
    required bool isColorThemeEditing,
    DiaryList? selectedList,
  }) = _ListEditing;

  const factory DiaryListState.cellsEditing({
    required DiaryList diaryList,
    required List<DiaryColumn> diaryColumns,
    required List<CapitalCell> capitalCells,
    required List<DiaryCell> diaryCells,
    required List<GlobalObjectKey> cellsKeys,
    required DiaryCell firstSelectedCell,
    required List<DiaryCell> selectedCells,
    required bool isTextEditing,
    required bool isColorEditing,
    required bool isBordersEditing,
    required bool isBordersStyleEditing,
    required List<DiaryList> lists,
    required DiaryCellTextSettings defaultTextSettings,
    required DiaryCellSettings defaultSettings,
    required bool isListThemeViewMode,
    ListTheme? listTheme,
  }) = _CellsEditing;

  const factory DiaryListState.themesLoaded({
    required List<ListTheme> listThemes,
  }) = _ThemesLoaded;
}
