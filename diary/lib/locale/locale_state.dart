part of 'locale_bloc.dart';

@freezed
class LocaleState with _$LocaleState {
  const factory LocaleState.initial({
    required Locale locale,
    required LocaleType localeType,
  }) = _Initial;
}
