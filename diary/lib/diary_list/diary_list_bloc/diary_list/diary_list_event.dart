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
}
