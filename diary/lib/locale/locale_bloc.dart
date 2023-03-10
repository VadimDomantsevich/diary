import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'locale_state.dart';
part 'locale_event.dart';
part 'locale_bloc.freezed.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc()
      : super(const LocaleState.initial(
          locale: Locale('en'),
          localeType: LocaleType.en,
        )) {
    on<ChooseLocaleEvent>((event, emit) => _onChooseLocaleEvent(event, emit));
    on<ChangeLocaleEvent>((event, emit) => _onChangeLocaleEvent(event, emit));
  }

  void _onChooseLocaleEvent(
    ChooseLocaleEvent event,
    Emitter<LocaleState> emit,
  ) {
    emit(LocaleState.initial(
      locale: event.locale,
      localeType: event.localeType,
    ));
  }

  void _onChangeLocaleEvent(
    ChangeLocaleEvent event,
    Emitter<LocaleState> emit,
  ) {
    state.when(
      initial: (locale, localeType) {
        locale == const Locale('en')
            ? emit(const LocaleState.initial(
                locale: Locale('ru'), localeType: LocaleType.ru))
            : emit(const LocaleState.initial(
                locale: Locale('en'), localeType: LocaleType.en));
      },
    );
  }
}
