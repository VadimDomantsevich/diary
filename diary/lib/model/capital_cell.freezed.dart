// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'capital_cell.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CapitalCell {
  String get name => throw _privateConstructorUsedError;
  String get columnId => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  DiaryColumnSettings get settings => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CapitalCellCopyWith<CapitalCell> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CapitalCellCopyWith<$Res> {
  factory $CapitalCellCopyWith(
          CapitalCell value, $Res Function(CapitalCell) then) =
      _$CapitalCellCopyWithImpl<$Res, CapitalCell>;
  @useResult
  $Res call(
      {String name,
      String columnId,
      @JsonKey(includeToJson: false) DiaryColumnSettings settings});

  $DiaryColumnSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class _$CapitalCellCopyWithImpl<$Res, $Val extends CapitalCell>
    implements $CapitalCellCopyWith<$Res> {
  _$CapitalCellCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? columnId = null,
    Object? settings = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      columnId: null == columnId
          ? _value.columnId
          : columnId // ignore: cast_nullable_to_non_nullable
              as String,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as DiaryColumnSettings,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DiaryColumnSettingsCopyWith<$Res> get settings {
    return $DiaryColumnSettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CapitalCellCopyWith<$Res>
    implements $CapitalCellCopyWith<$Res> {
  factory _$$_CapitalCellCopyWith(
          _$_CapitalCell value, $Res Function(_$_CapitalCell) then) =
      __$$_CapitalCellCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String columnId,
      @JsonKey(includeToJson: false) DiaryColumnSettings settings});

  @override
  $DiaryColumnSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class __$$_CapitalCellCopyWithImpl<$Res>
    extends _$CapitalCellCopyWithImpl<$Res, _$_CapitalCell>
    implements _$$_CapitalCellCopyWith<$Res> {
  __$$_CapitalCellCopyWithImpl(
      _$_CapitalCell _value, $Res Function(_$_CapitalCell) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? columnId = null,
    Object? settings = null,
  }) {
    return _then(_$_CapitalCell(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      columnId: null == columnId
          ? _value.columnId
          : columnId // ignore: cast_nullable_to_non_nullable
              as String,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as DiaryColumnSettings,
    ));
  }
}

/// @nodoc

class _$_CapitalCell implements _CapitalCell {
  const _$_CapitalCell(
      {required this.name,
      required this.columnId,
      @JsonKey(includeToJson: false) required this.settings});

  @override
  final String name;
  @override
  final String columnId;
  @override
  @JsonKey(includeToJson: false)
  final DiaryColumnSettings settings;

  @override
  String toString() {
    return 'CapitalCell(name: $name, columnId: $columnId, settings: $settings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CapitalCell &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.columnId, columnId) ||
                other.columnId == columnId) &&
            (identical(other.settings, settings) ||
                other.settings == settings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, columnId, settings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CapitalCellCopyWith<_$_CapitalCell> get copyWith =>
      __$$_CapitalCellCopyWithImpl<_$_CapitalCell>(this, _$identity);
}

abstract class _CapitalCell implements CapitalCell {
  const factory _CapitalCell(
      {required final String name,
      required final String columnId,
      @JsonKey(includeToJson: false)
          required final DiaryColumnSettings settings}) = _$_CapitalCell;

  @override
  String get name;
  @override
  String get columnId;
  @override
  @JsonKey(includeToJson: false)
  DiaryColumnSettings get settings;
  @override
  @JsonKey(ignore: true)
  _$$_CapitalCellCopyWith<_$_CapitalCell> get copyWith =>
      throw _privateConstructorUsedError;
}
