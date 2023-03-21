// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diary_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiaryList _$DiaryListFromJson(Map<String, dynamic> json) {
  return _DiaryList.fromJson(json);
}

/// @nodoc
mixin _$DiaryList {
  String get name => throw _privateConstructorUsedError;
  DateTime get listDate => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  DiaryListSettings get settings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiaryListCopyWith<DiaryList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiaryListCopyWith<$Res> {
  factory $DiaryListCopyWith(DiaryList value, $Res Function(DiaryList) then) =
      _$DiaryListCopyWithImpl<$Res, DiaryList>;
  @useResult
  $Res call(
      {String name,
      DateTime listDate,
      String uid,
      @JsonKey(includeToJson: false) DiaryListSettings settings});

  $DiaryListSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class _$DiaryListCopyWithImpl<$Res, $Val extends DiaryList>
    implements $DiaryListCopyWith<$Res> {
  _$DiaryListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? listDate = null,
    Object? uid = null,
    Object? settings = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      listDate: null == listDate
          ? _value.listDate
          : listDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as DiaryListSettings,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DiaryListSettingsCopyWith<$Res> get settings {
    return $DiaryListSettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DiaryListCopyWith<$Res> implements $DiaryListCopyWith<$Res> {
  factory _$$_DiaryListCopyWith(
          _$_DiaryList value, $Res Function(_$_DiaryList) then) =
      __$$_DiaryListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      DateTime listDate,
      String uid,
      @JsonKey(includeToJson: false) DiaryListSettings settings});

  @override
  $DiaryListSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class __$$_DiaryListCopyWithImpl<$Res>
    extends _$DiaryListCopyWithImpl<$Res, _$_DiaryList>
    implements _$$_DiaryListCopyWith<$Res> {
  __$$_DiaryListCopyWithImpl(
      _$_DiaryList _value, $Res Function(_$_DiaryList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? listDate = null,
    Object? uid = null,
    Object? settings = null,
  }) {
    return _then(_$_DiaryList(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      listDate: null == listDate
          ? _value.listDate
          : listDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as DiaryListSettings,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DiaryList implements _DiaryList {
  const _$_DiaryList(
      {required this.name,
      required this.listDate,
      required this.uid,
      @JsonKey(includeToJson: false) required this.settings});

  factory _$_DiaryList.fromJson(Map<String, dynamic> json) =>
      _$$_DiaryListFromJson(json);

  @override
  final String name;
  @override
  final DateTime listDate;
  @override
  final String uid;
  @override
  @JsonKey(includeToJson: false)
  final DiaryListSettings settings;

  @override
  String toString() {
    return 'DiaryList(name: $name, listDate: $listDate, uid: $uid, settings: $settings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiaryList &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.listDate, listDate) ||
                other.listDate == listDate) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.settings, settings) ||
                other.settings == settings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, listDate, uid, settings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiaryListCopyWith<_$_DiaryList> get copyWith =>
      __$$_DiaryListCopyWithImpl<_$_DiaryList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiaryListToJson(
      this,
    );
  }
}

abstract class _DiaryList implements DiaryList {
  const factory _DiaryList(
      {required final String name,
      required final DateTime listDate,
      required final String uid,
      @JsonKey(includeToJson: false)
          required final DiaryListSettings settings}) = _$_DiaryList;

  factory _DiaryList.fromJson(Map<String, dynamic> json) =
      _$_DiaryList.fromJson;

  @override
  String get name;
  @override
  DateTime get listDate;
  @override
  String get uid;
  @override
  @JsonKey(includeToJson: false)
  DiaryListSettings get settings;
  @override
  @JsonKey(ignore: true)
  _$$_DiaryListCopyWith<_$_DiaryList> get copyWith =>
      throw _privateConstructorUsedError;
}
