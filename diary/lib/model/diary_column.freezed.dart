// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diary_column.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiaryColumn _$DiaryColumnFromJson(Map<String, dynamic> json) {
  return _DiaryColumn.fromJson(json);
}

/// @nodoc
mixin _$DiaryColumn {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get columnsCount => throw _privateConstructorUsedError;
  DateTime get creationTime => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  DiaryColumnSettings get settings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiaryColumnCopyWith<DiaryColumn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiaryColumnCopyWith<$Res> {
  factory $DiaryColumnCopyWith(
          DiaryColumn value, $Res Function(DiaryColumn) then) =
      _$DiaryColumnCopyWithImpl<$Res, DiaryColumn>;
  @useResult
  $Res call(
      {String id,
      String name,
      int columnsCount,
      DateTime creationTime,
      @JsonKey(includeToJson: false) DiaryColumnSettings settings});

  $DiaryColumnSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class _$DiaryColumnCopyWithImpl<$Res, $Val extends DiaryColumn>
    implements $DiaryColumnCopyWith<$Res> {
  _$DiaryColumnCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? columnsCount = null,
    Object? creationTime = null,
    Object? settings = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      columnsCount: null == columnsCount
          ? _value.columnsCount
          : columnsCount // ignore: cast_nullable_to_non_nullable
              as int,
      creationTime: null == creationTime
          ? _value.creationTime
          : creationTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
abstract class _$$_DiaryColumnCopyWith<$Res>
    implements $DiaryColumnCopyWith<$Res> {
  factory _$$_DiaryColumnCopyWith(
          _$_DiaryColumn value, $Res Function(_$_DiaryColumn) then) =
      __$$_DiaryColumnCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      int columnsCount,
      DateTime creationTime,
      @JsonKey(includeToJson: false) DiaryColumnSettings settings});

  @override
  $DiaryColumnSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class __$$_DiaryColumnCopyWithImpl<$Res>
    extends _$DiaryColumnCopyWithImpl<$Res, _$_DiaryColumn>
    implements _$$_DiaryColumnCopyWith<$Res> {
  __$$_DiaryColumnCopyWithImpl(
      _$_DiaryColumn _value, $Res Function(_$_DiaryColumn) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? columnsCount = null,
    Object? creationTime = null,
    Object? settings = null,
  }) {
    return _then(_$_DiaryColumn(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      columnsCount: null == columnsCount
          ? _value.columnsCount
          : columnsCount // ignore: cast_nullable_to_non_nullable
              as int,
      creationTime: null == creationTime
          ? _value.creationTime
          : creationTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as DiaryColumnSettings,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DiaryColumn implements _DiaryColumn {
  const _$_DiaryColumn(
      {required this.id,
      required this.name,
      required this.columnsCount,
      required this.creationTime,
      @JsonKey(includeToJson: false) required this.settings});

  factory _$_DiaryColumn.fromJson(Map<String, dynamic> json) =>
      _$$_DiaryColumnFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int columnsCount;
  @override
  final DateTime creationTime;
  @override
  @JsonKey(includeToJson: false)
  final DiaryColumnSettings settings;

  @override
  String toString() {
    return 'DiaryColumn(id: $id, name: $name, columnsCount: $columnsCount, creationTime: $creationTime, settings: $settings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiaryColumn &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.columnsCount, columnsCount) ||
                other.columnsCount == columnsCount) &&
            (identical(other.creationTime, creationTime) ||
                other.creationTime == creationTime) &&
            (identical(other.settings, settings) ||
                other.settings == settings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, columnsCount, creationTime, settings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiaryColumnCopyWith<_$_DiaryColumn> get copyWith =>
      __$$_DiaryColumnCopyWithImpl<_$_DiaryColumn>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiaryColumnToJson(
      this,
    );
  }
}

abstract class _DiaryColumn implements DiaryColumn {
  const factory _DiaryColumn(
      {required final String id,
      required final String name,
      required final int columnsCount,
      required final DateTime creationTime,
      @JsonKey(includeToJson: false)
          required final DiaryColumnSettings settings}) = _$_DiaryColumn;

  factory _DiaryColumn.fromJson(Map<String, dynamic> json) =
      _$_DiaryColumn.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get columnsCount;
  @override
  DateTime get creationTime;
  @override
  @JsonKey(includeToJson: false)
  DiaryColumnSettings get settings;
  @override
  @JsonKey(ignore: true)
  _$$_DiaryColumnCopyWith<_$_DiaryColumn> get copyWith =>
      throw _privateConstructorUsedError;
}
