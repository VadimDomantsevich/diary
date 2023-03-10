part of 'locale_bloc.dart';

@freezed
class LocaleEvent with _$LocaleEvent {
  const factory LocaleEvent.chooseLocale({
    required Locale locale,
    required LocaleType localeType,
  }) = ChooseLocaleEvent;
  
  const factory LocaleEvent.changeLocale() = ChangeLocaleEvent;
}
