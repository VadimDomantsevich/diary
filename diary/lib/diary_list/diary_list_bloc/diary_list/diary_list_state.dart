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
  }) = _Loaded;

  const factory DiaryListState.cellSelected({
    required DiaryList diaryList,
    required List<DiaryColumn> diaryColumns,
    required List<DiaryCell> diaryCells,
    required DiaryCell selectedCell,
  }) = _CellSelected;
}
