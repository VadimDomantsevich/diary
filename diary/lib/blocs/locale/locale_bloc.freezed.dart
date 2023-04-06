// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'locale_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LocaleState {
  Locale get locale => throw _privateConstructorUsedError;
  LocaleType get localeType => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Locale locale, LocaleType localeType) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Locale locale, LocaleType localeType)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Locale locale, LocaleType localeType)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocaleStateCopyWith<LocaleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocaleStateCopyWith<$Res> {
  factory $LocaleStateCopyWith(
          LocaleState value, $Res Function(LocaleState) then) =
      _$LocaleStateCopyWithImpl<$Res, LocaleState>;
  @useResult
  $Res call({Locale locale, LocaleType localeType});
}

/// @nodoc
class _$LocaleStateCopyWithImpl<$Res, $Val extends LocaleState>
    implements $LocaleStateCopyWith<$Res> {
  _$LocaleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
    Object? localeType = null,
  }) {
    return _then(_value.copyWith(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
      localeType: null == localeType
          ? _value.localeType
          : localeType // ignore: cast_nullable_to_non_nullable
              as LocaleType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> implements $LocaleStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Locale locale, LocaleType localeType});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$LocaleStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
    Object? localeType = null,
  }) {
    return _then(_$_Initial(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
      localeType: null == localeType
          ? _value.localeType
          : localeType // ignore: cast_nullable_to_non_nullable
              as LocaleType,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({required this.locale, required this.localeType});

  @override
  final Locale locale;
  @override
  final LocaleType localeType;

  @override
  String toString() {
    return 'LocaleState.initial(locale: $locale, localeType: $localeType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.localeType, localeType) ||
                other.localeType == localeType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale, localeType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Locale locale, LocaleType localeType) initial,
  }) {
    return initial(locale, localeType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Locale locale, LocaleType localeType)? initial,
  }) {
    return initial?.call(locale, localeType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Locale locale, LocaleType localeType)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(locale, localeType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements LocaleState {
  const factory _Initial(
      {required final Locale locale,
      required final LocaleType localeType}) = _$_Initial;

  @override
  Locale get locale;
  @override
  LocaleType get localeType;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LocaleEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Locale locale, LocaleType localeType)
        chooseLocale,
    required TResult Function() changeLocale,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Locale locale, LocaleType localeType)? chooseLocale,
    TResult? Function()? changeLocale,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Locale locale, LocaleType localeType)? chooseLocale,
    TResult Function()? changeLocale,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChooseLocaleEvent value) chooseLocale,
    required TResult Function(ChangeLocaleEvent value) changeLocale,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChooseLocaleEvent value)? chooseLocale,
    TResult? Function(ChangeLocaleEvent value)? changeLocale,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChooseLocaleEvent value)? chooseLocale,
    TResult Function(ChangeLocaleEvent value)? changeLocale,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocaleEventCopyWith<$Res> {
  factory $LocaleEventCopyWith(
          LocaleEvent value, $Res Function(LocaleEvent) then) =
      _$LocaleEventCopyWithImpl<$Res, LocaleEvent>;
}

/// @nodoc
class _$LocaleEventCopyWithImpl<$Res, $Val extends LocaleEvent>
    implements $LocaleEventCopyWith<$Res> {
  _$LocaleEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ChooseLocaleEventCopyWith<$Res> {
  factory _$$ChooseLocaleEventCopyWith(
          _$ChooseLocaleEvent value, $Res Function(_$ChooseLocaleEvent) then) =
      __$$ChooseLocaleEventCopyWithImpl<$Res>;
  @useResult
  $Res call({Locale locale, LocaleType localeType});
}

/// @nodoc
class __$$ChooseLocaleEventCopyWithImpl<$Res>
    extends _$LocaleEventCopyWithImpl<$Res, _$ChooseLocaleEvent>
    implements _$$ChooseLocaleEventCopyWith<$Res> {
  __$$ChooseLocaleEventCopyWithImpl(
      _$ChooseLocaleEvent _value, $Res Function(_$ChooseLocaleEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
    Object? localeType = null,
  }) {
    return _then(_$ChooseLocaleEvent(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
      localeType: null == localeType
          ? _value.localeType
          : localeType // ignore: cast_nullable_to_non_nullable
              as LocaleType,
    ));
  }
}

/// @nodoc

class _$ChooseLocaleEvent implements ChooseLocaleEvent {
  const _$ChooseLocaleEvent({required this.locale, required this.localeType});

  @override
  final Locale locale;
  @override
  final LocaleType localeType;

  @override
  String toString() {
    return 'LocaleEvent.chooseLocale(locale: $locale, localeType: $localeType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChooseLocaleEvent &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.localeType, localeType) ||
                other.localeType == localeType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale, localeType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChooseLocaleEventCopyWith<_$ChooseLocaleEvent> get copyWith =>
      __$$ChooseLocaleEventCopyWithImpl<_$ChooseLocaleEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Locale locale, LocaleType localeType)
        chooseLocale,
    required TResult Function() changeLocale,
  }) {
    return chooseLocale(locale, localeType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Locale locale, LocaleType localeType)? chooseLocale,
    TResult? Function()? changeLocale,
  }) {
    return chooseLocale?.call(locale, localeType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Locale locale, LocaleType localeType)? chooseLocale,
    TResult Function()? changeLocale,
    required TResult orElse(),
  }) {
    if (chooseLocale != null) {
      return chooseLocale(locale, localeType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChooseLocaleEvent value) chooseLocale,
    required TResult Function(ChangeLocaleEvent value) changeLocale,
  }) {
    return chooseLocale(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChooseLocaleEvent value)? chooseLocale,
    TResult? Function(ChangeLocaleEvent value)? changeLocale,
  }) {
    return chooseLocale?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChooseLocaleEvent value)? chooseLocale,
    TResult Function(ChangeLocaleEvent value)? changeLocale,
    required TResult orElse(),
  }) {
    if (chooseLocale != null) {
      return chooseLocale(this);
    }
    return orElse();
  }
}

abstract class ChooseLocaleEvent implements LocaleEvent {
  const factory ChooseLocaleEvent(
      {required final Locale locale,
      required final LocaleType localeType}) = _$ChooseLocaleEvent;

  Locale get locale;
  LocaleType get localeType;
  @JsonKey(ignore: true)
  _$$ChooseLocaleEventCopyWith<_$ChooseLocaleEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeLocaleEventCopyWith<$Res> {
  factory _$$ChangeLocaleEventCopyWith(
          _$ChangeLocaleEvent value, $Res Function(_$ChangeLocaleEvent) then) =
      __$$ChangeLocaleEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChangeLocaleEventCopyWithImpl<$Res>
    extends _$LocaleEventCopyWithImpl<$Res, _$ChangeLocaleEvent>
    implements _$$ChangeLocaleEventCopyWith<$Res> {
  __$$ChangeLocaleEventCopyWithImpl(
      _$ChangeLocaleEvent _value, $Res Function(_$ChangeLocaleEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ChangeLocaleEvent implements ChangeLocaleEvent {
  const _$ChangeLocaleEvent();

  @override
  String toString() {
    return 'LocaleEvent.changeLocale()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChangeLocaleEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Locale locale, LocaleType localeType)
        chooseLocale,
    required TResult Function() changeLocale,
  }) {
    return changeLocale();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Locale locale, LocaleType localeType)? chooseLocale,
    TResult? Function()? changeLocale,
  }) {
    return changeLocale?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Locale locale, LocaleType localeType)? chooseLocale,
    TResult Function()? changeLocale,
    required TResult orElse(),
  }) {
    if (changeLocale != null) {
      return changeLocale();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChooseLocaleEvent value) chooseLocale,
    required TResult Function(ChangeLocaleEvent value) changeLocale,
  }) {
    return changeLocale(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChooseLocaleEvent value)? chooseLocale,
    TResult? Function(ChangeLocaleEvent value)? changeLocale,
  }) {
    return changeLocale?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChooseLocaleEvent value)? chooseLocale,
    TResult Function(ChangeLocaleEvent value)? changeLocale,
    required TResult orElse(),
  }) {
    if (changeLocale != null) {
      return changeLocale(this);
    }
    return orElse();
  }
}

abstract class ChangeLocaleEvent implements LocaleEvent {
  const factory ChangeLocaleEvent() = _$ChangeLocaleEvent;
}
