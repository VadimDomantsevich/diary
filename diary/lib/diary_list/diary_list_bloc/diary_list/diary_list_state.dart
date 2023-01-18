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
    required List<DiaryList> lists,
  }) = _ColumnsLoaded;

  const factory DiaryListState.loaded({
    required DiaryList diaryList,
    required List<DiaryColumn> diaryColumns,
    required List<DiaryCell> diaryCells,
    required List<GlobalObjectKey> cellsKeys,
    required List<DiaryList> lists,
  }) = _Loaded;

  const factory DiaryListState.cellsSelected({
    required DiaryList diaryList,
    required List<DiaryColumn> diaryColumns,
    required List<DiaryCell> diaryCells,
    required DiaryCell firstSelectedCell,
    required List<DiaryCell> selectedCells,
    required List<GlobalObjectKey> cellsKeys,
    required List<DiaryList> lists,
  }) = _CellsSelected;

  const factory DiaryListState.listEditing({
    required DiaryList diaryList,
    required List<DiaryColumn> diaryColumns,
    required List<DiaryCell> diaryCells,
    required List<GlobalObjectKey> cellsKeys,
    required List<DiaryList> lists,
    DiaryList? selectedList,
  }) = _ListEditing;
}
