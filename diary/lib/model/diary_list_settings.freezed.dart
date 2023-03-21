// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diary_list_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiaryListSettings _$DiaryListSettingsFromJson(Map<String, dynamic> json) {
  return _DiaryListSettings.fromJson(json);
}

/// @nodoc
mixin _$DiaryListSettings {
  String get themeColor => throw _privateConstructorUsedError;
  String get themeBorderColor => throw _privateConstructorUsedError;
  String get themePanelBackgroundColor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiaryListSettingsCopyWith<DiaryListSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiaryListSettingsCopyWith<$Res> {
  factory $DiaryListSettingsCopyWith(
          DiaryListSettings value, $Res Function(DiaryListSettings) then) =
      _$DiaryListSettingsCopyWithImpl<$Res, DiaryListSettings>;
  @useResult
  $Res call(
      {String themeColor,
      String themeBorderColor,
      String themePanelBackgroundColor});
}

/// @nodoc
class _$DiaryListSettingsCopyWithImpl<$Res, $Val extends DiaryListSettings>
    implements $DiaryListSettingsCopyWith<$Res> {
  _$DiaryListSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeColor = null,
    Object? themeBorderColor = null,
    Object? themePanelBackgroundColor = null,
  }) {
    return _then(_value.copyWith(
      themeColor: null == themeColor
          ? _value.themeColor
          : themeColor // ignore: cast_nullable_to_non_nullable
              as String,
      themeBorderColor: null == themeBorderColor
          ? _value.themeBorderColor
          : themeBorderColor // ignore: cast_nullable_to_non_nullable
              as String,
      themePanelBackgroundColor: null == themePanelBackgroundColor
          ? _value.themePanelBackgroundColor
          : themePanelBackgroundColor // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DiaryListSettingsCopyWith<$Res>
    implements $DiaryListSettingsCopyWith<$Res> {
  factory _$$_DiaryListSettingsCopyWith(_$_DiaryListSettings value,
          $Res Function(_$_DiaryListSettings) then) =
      __$$_DiaryListSettingsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String themeColor,
      String themeBorderColor,
      String themePanelBackgroundColor});
}

/// @nodoc
class __$$_DiaryListSettingsCopyWithImpl<$Res>
    extends _$DiaryListSettingsCopyWithImpl<$Res, _$_DiaryListSettings>
    implements _$$_DiaryListSettingsCopyWith<$Res> {
  __$$_DiaryListSettingsCopyWithImpl(
      _$_DiaryListSettings _value, $Res Function(_$_DiaryListSettings) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeColor = null,
    Object? themeBorderColor = null,
    Object? themePanelBackgroundColor = null,
  }) {
    return _then(_$_DiaryListSettings(
      themeColor: null == themeColor
          ? _value.themeColor
          : themeColor // ignore: cast_nullable_to_non_nullable
              as String,
      themeBorderColor: null == themeBorderColor
          ? _value.themeBorderColor
          : themeBorderColor // ignore: cast_nullable_to_non_nullable
              as String,
      themePanelBackgroundColor: null == themePanelBackgroundColor
          ? _value.themePanelBackgroundColor
          : themePanelBackgroundColor // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DiaryListSettings implements _DiaryListSettings {
  const _$_DiaryListSettings(
      {required this.themeColor,
      required this.themeBorderColor,
      required this.themePanelBackgroundColor});

  factory _$_DiaryListSettings.fromJson(Map<String, dynamic> json) =>
      _$$_DiaryListSettingsFromJson(json);

  @override
  final String themeColor;
  @override
  final String themeBorderColor;
  @override
  final String themePanelBackgroundColor;

  @override
  String toString() {
    return 'DiaryListSettings(themeColor: $themeColor, themeBorderColor: $themeBorderColor, themePanelBackgroundColor: $themePanelBackgroundColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiaryListSettings &&
            (identical(other.themeColor, themeColor) ||
                other.themeColor == themeColor) &&
            (identical(other.themeBorderColor, themeBorderColor) ||
                other.themeBorderColor == themeBorderColor) &&
            (identical(other.themePanelBackgroundColor,
                    themePanelBackgroundColor) ||
                other.themePanelBackgroundColor == themePanelBackgroundColor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, themeColor, themeBorderColor, themePanelBackgroundColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiaryListSettingsCopyWith<_$_DiaryListSettings> get copyWith =>
      __$$_DiaryListSettingsCopyWithImpl<_$_DiaryListSettings>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiaryListSettingsToJson(
      this,
    );
  }
}

abstract class _DiaryListSettings implements DiaryListSettings {
  const factory _DiaryListSettings(
      {required final String themeColor,
      required final String themeBorderColor,
      required final String themePanelBackgroundColor}) = _$_DiaryListSettings;

  factory _DiaryListSettings.fromJson(Map<String, dynamic> json) =
      _$_DiaryListSettings.fromJson;

  @override
  String get themeColor;
  @override
  String get themeBorderColor;
  @override
  String get themePanelBackgroundColor;
  @override
  @JsonKey(ignore: true)
  _$$_DiaryListSettingsCopyWith<_$_DiaryListSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
