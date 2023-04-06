// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diary_cell.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiaryCell _$DiaryCellFromJson(Map<String, dynamic> json) {
  return _DiaryCell.fromJson(json);
}

/// @nodoc
mixin _$DiaryCell {
  String get columnName => throw _privateConstructorUsedError;
  int get columnPosition => throw _privateConstructorUsedError;
  int get day => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  DiaryCellSettings get settings => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  DiaryCellTextSettings get textSettings => throw _privateConstructorUsedError;
  int get capitalColumnPosition => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiaryCellCopyWith<DiaryCell> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiaryCellCopyWith<$Res> {
  factory $DiaryCellCopyWith(DiaryCell value, $Res Function(DiaryCell) then) =
      _$DiaryCellCopyWithImpl<$Res, DiaryCell>;
  @useResult
  $Res call(
      {String columnName,
      int columnPosition,
      int day,
      String content,
      @JsonKey(includeToJson: false) DiaryCellSettings settings,
      @JsonKey(includeToJson: false) DiaryCellTextSettings textSettings,
      int capitalColumnPosition});

  $DiaryCellSettingsCopyWith<$Res> get settings;
  $DiaryCellTextSettingsCopyWith<$Res> get textSettings;
}

/// @nodoc
class _$DiaryCellCopyWithImpl<$Res, $Val extends DiaryCell>
    implements $DiaryCellCopyWith<$Res> {
  _$DiaryCellCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? columnName = null,
    Object? columnPosition = null,
    Object? day = null,
    Object? content = null,
    Object? settings = null,
    Object? textSettings = null,
    Object? capitalColumnPosition = null,
  }) {
    return _then(_value.copyWith(
      columnName: null == columnName
          ? _value.columnName
          : columnName // ignore: cast_nullable_to_non_nullable
              as String,
      columnPosition: null == columnPosition
          ? _value.columnPosition
          : columnPosition // ignore: cast_nullable_to_non_nullable
              as int,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as DiaryCellSettings,
      textSettings: null == textSettings
          ? _value.textSettings
          : textSettings // ignore: cast_nullable_to_non_nullable
              as DiaryCellTextSettings,
      capitalColumnPosition: null == capitalColumnPosition
          ? _value.capitalColumnPosition
          : capitalColumnPosition // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DiaryCellSettingsCopyWith<$Res> get settings {
    return $DiaryCellSettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DiaryCellTextSettingsCopyWith<$Res> get textSettings {
    return $DiaryCellTextSettingsCopyWith<$Res>(_value.textSettings, (value) {
      return _then(_value.copyWith(textSettings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DiaryCellCopyWith<$Res> implements $DiaryCellCopyWith<$Res> {
  factory _$$_DiaryCellCopyWith(
          _$_DiaryCell value, $Res Function(_$_DiaryCell) then) =
      __$$_DiaryCellCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String columnName,
      int columnPosition,
      int day,
      String content,
      @JsonKey(includeToJson: false) DiaryCellSettings settings,
      @JsonKey(includeToJson: false) DiaryCellTextSettings textSettings,
      int capitalColumnPosition});

  @override
  $DiaryCellSettingsCopyWith<$Res> get settings;
  @override
  $DiaryCellTextSettingsCopyWith<$Res> get textSettings;
}

/// @nodoc
class __$$_DiaryCellCopyWithImpl<$Res>
    extends _$DiaryCellCopyWithImpl<$Res, _$_DiaryCell>
    implements _$$_DiaryCellCopyWith<$Res> {
  __$$_DiaryCellCopyWithImpl(
      _$_DiaryCell _value, $Res Function(_$_DiaryCell) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? columnName = null,
    Object? columnPosition = null,
    Object? day = null,
    Object? content = null,
    Object? settings = null,
    Object? textSettings = null,
    Object? capitalColumnPosition = null,
  }) {
    return _then(_$_DiaryCell(
      columnName: null == columnName
          ? _value.columnName
          : columnName // ignore: cast_nullable_to_non_nullable
              as String,
      columnPosition: null == columnPosition
          ? _value.columnPosition
          : columnPosition // ignore: cast_nullable_to_non_nullable
              as int,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as DiaryCellSettings,
      textSettings: null == textSettings
          ? _value.textSettings
          : textSettings // ignore: cast_nullable_to_non_nullable
              as DiaryCellTextSettings,
      capitalColumnPosition: null == capitalColumnPosition
          ? _value.capitalColumnPosition
          : capitalColumnPosition // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DiaryCell implements _DiaryCell {
  const _$_DiaryCell(
      {required this.columnName,
      required this.columnPosition,
      required this.day,
      required this.content,
      @JsonKey(includeToJson: false) required this.settings,
      @JsonKey(includeToJson: false) required this.textSettings,
      required this.capitalColumnPosition});

  factory _$_DiaryCell.fromJson(Map<String, dynamic> json) =>
      _$$_DiaryCellFromJson(json);

  @override
  final String columnName;
  @override
  final int columnPosition;
  @override
  final int day;
  @override
  final String content;
  @override
  @JsonKey(includeToJson: false)
  final DiaryCellSettings settings;
  @override
  @JsonKey(includeToJson: false)
  final DiaryCellTextSettings textSettings;
  @override
  final int capitalColumnPosition;

  @override
  int compareTo(other) {
    if (day < other.day ||
        day == other.day &&
            columnPosition < other.columnPosition &&
            capitalColumnPosition == other.capitalColumnPosition ||
        day == other.day &&
            capitalColumnPosition < other.capitalColumnPosition) {
      return -1;
    }
    if (day > other.day ||
        day == other.day &&
            columnPosition > other.columnPosition &&
            capitalColumnPosition == other.capitalColumnPosition ||
        day == other.day &&
            capitalColumnPosition > other.capitalColumnPosition) {
      return 1;
    }

    return 0;
  }

  @override
  String toString() {
    return 'DiaryCell(columnName: $columnName, columnPosition: $columnPosition, day: $day, content: $content, settings: $settings, textSettings: $textSettings, capitalColumnPosition: $capitalColumnPosition)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiaryCell &&
            (identical(other.columnName, columnName) ||
                other.columnName == columnName) &&
            (identical(other.columnPosition, columnPosition) ||
                other.columnPosition == columnPosition) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.textSettings, textSettings) ||
                other.textSettings == textSettings) &&
            (identical(other.capitalColumnPosition, capitalColumnPosition) ||
                other.capitalColumnPosition == capitalColumnPosition));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, columnName, columnPosition, day,
      content, settings, textSettings, capitalColumnPosition);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiaryCellCopyWith<_$_DiaryCell> get copyWith =>
      __$$_DiaryCellCopyWithImpl<_$_DiaryCell>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiaryCellToJson(
      this,
    );
  }
}

abstract class _DiaryCell implements DiaryCell {
  const factory _DiaryCell(
      {required final String columnName,
      required final int columnPosition,
      required final int day,
      required final String content,
      @JsonKey(includeToJson: false)
          required final DiaryCellSettings settings,
      @JsonKey(includeToJson: false)
          required final DiaryCellTextSettings textSettings,
      required final int capitalColumnPosition}) = _$_DiaryCell;

  factory _DiaryCell.fromJson(Map<String, dynamic> json) =
      _$_DiaryCell.fromJson;

  @override
  String get columnName;
  @override
  int get columnPosition;
  @override
  int get day;
  @override
  String get content;
  @override
  @JsonKey(includeToJson: false)
  DiaryCellSettings get settings;
  @override
  @JsonKey(includeToJson: false)
  DiaryCellTextSettings get textSettings;
  @override
  int get capitalColumnPosition;
  @override
  @JsonKey(ignore: true)
  _$$_DiaryCellCopyWith<_$_DiaryCell> get copyWith =>
      throw _privateConstructorUsedError;
}
