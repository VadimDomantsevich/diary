part of 'diary_list_bloc.dart';

@freezed
class DiaryListEvent with _$DiaryListEvent {
  const factory DiaryListEvent.createSample() = CreateSampleEvent;

  const factory DiaryListEvent.getDiaryList({
    required DateTime date,
  }) = GetDiaryListEvent;

  const factory DiaryListEvent.getDiaryColumns({
    required DiaryList diaryList,
  }) = GetDiaryColumnsEvent;

  const factory DiaryListEvent.getDiaryCells({
    required DiaryList diaryList,
    required List<DiaryColumn> diaryColumns,
  }) = GetDiaryCellsEvent;

  const factory DiaryListEvent.selectDiaryCell({
    required DiaryCell diaryCell,
    required GlobalObjectKey cellKey,
  }) = SelectDiaryCellEvent;

  const factory DiaryListEvent.onPanUpdate({
    required DiaryCell diaryCell,
    required GlobalObjectKey cellKey,
    required GlobalKey gridKey,
    required DragUpdateDetails details,
  }) = OnPanUpdateEvent;

  // const factory DiaryListEvent.onPointerDown({
  //   DiaryCell? diaryCell,
  //   GlobalObjectKey? cellKey,
  //   required PointerDownEvent event,
  // }) = OnPointerDownEvent;

  // const factory DiaryListEvent.onPointerUp({
  //   DiaryCell? diaryCell,
  //   GlobalObjectKey? cellKey,
  //   required PointerUpEvent event,
  // }) = OnPointerUpEvent;

  const factory DiaryListEvent.changeDiaryCell({
    required DiaryCell diaryCell,
    String? textFieldText,
  }) = ChangeDiaryCellEvent;

  const factory DiaryListEvent.updateDiaryCell({
    required DiaryCell diaryCell,
  }) = UpdateDiaryCellEvent;
}
