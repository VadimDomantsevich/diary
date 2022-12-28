part of 'diary_list_bloc.dart';

@freezed
class DiaryListState with _$DiaryListState {
  const factory DiaryListState.initial() = _Initial;

  const factory DiaryListState.listLoaded({
    required DiaryList diaryList,
  }) = _ListLoaded;

  const factory DiaryListState.columnsLoaded({
    required DiaryList diaryList,
    required List<DiaryColumn> diaryColumns,
  }) = _ColumnsLoaded;

  const factory DiaryListState.loaded({
    required DiaryList diaryList,
    required List<DiaryColumn> diaryColumns,
    required List<DiaryCell> diaryCells,
    required List<GlobalObjectKey> cellsKeys,
  }) = _Loaded;

  const factory DiaryListState.cellSelected({
    required DiaryList diaryList,
    required List<DiaryColumn> diaryColumns,
    required List<DiaryCell> diaryCells,
    required DiaryCell selectedCell,
    required List<GlobalObjectKey> cellsKeys,
  }) = _CellSelected;

  // const factory DiaryListState.pointerMoving({
  //   required DiaryList diaryList,
  //   required List<DiaryColumn> diaryColumns,
  //   required List<DiaryCell> diaryCells,
  //   DiaryCell? selectedCell,
  //   required List<GlobalObjectKey> cellsKeys,
  // }) = _PointerMoving;

  const factory DiaryListState.cellsSelected({
    required DiaryList diaryList,
    required List<DiaryColumn> diaryColumns,
    required List<DiaryCell> diaryCells,
    required DiaryCell firstSelectedCell,
    required List<DiaryCell> selectedCells,
    required List<GlobalObjectKey> cellsKeys,
  }) = _CellsSelected;
}
