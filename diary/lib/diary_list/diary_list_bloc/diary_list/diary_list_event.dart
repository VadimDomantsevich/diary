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

  const factory DiaryListEvent.updateDiaryListName({
    required DiaryList diaryList,
    required String newName,
  }) = UpdateDiaryListNameEvent;

  const factory DiaryListEvent.changeDiaryCell({
    required DiaryCell diaryCell,
    String? textFieldText,
  }) = ChangeDiaryCellEvent;

  const factory DiaryListEvent.updateDiaryCell({
    required DiaryCell diaryCell,
  }) = UpdateDiaryCellEvent;
}
