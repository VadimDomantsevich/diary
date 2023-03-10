// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DiaryListCWProxy {
  DiaryList listDate(DateTime listDate);

  DiaryList name(String name);

  DiaryList settings(DiaryListSettings settings);

  DiaryList uid(String uid);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DiaryList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DiaryList(...).copyWith(id: 12, name: "My name")
  /// ````
  DiaryList call({
    DateTime? listDate,
    String? name,
    DiaryListSettings? settings,
    String? uid,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDiaryList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDiaryList.copyWith.fieldName(...)`
class _$DiaryListCWProxyImpl implements _$DiaryListCWProxy {
  final DiaryList _value;

  const _$DiaryListCWProxyImpl(this._value);

  @override
  DiaryList listDate(DateTime listDate) => this(listDate: listDate);

  @override
  DiaryList name(String name) => this(name: name);

  @override
  DiaryList settings(DiaryListSettings settings) => this(settings: settings);

  @override
  DiaryList uid(String uid) => this(uid: uid);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DiaryList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DiaryList(...).copyWith(id: 12, name: "My name")
  /// ````
  DiaryList call({
    Object? listDate = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? settings = const $CopyWithPlaceholder(),
    Object? uid = const $CopyWithPlaceholder(),
  }) {
    return DiaryList(
      listDate: listDate == const $CopyWithPlaceholder() || listDate == null
          ? _value.listDate
          // ignore: cast_nullable_to_non_nullable
          : listDate as DateTime,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      settings: settings == const $CopyWithPlaceholder() || settings == null
          ? _value.settings
          // ignore: cast_nullable_to_non_nullable
          : settings as DiaryListSettings,
      uid: uid == const $CopyWithPlaceholder() || uid == null
          ? _value.uid
          // ignore: cast_nullable_to_non_nullable
          : uid as String,
    );
  }
}

extension $DiaryListCopyWith on DiaryList {
  /// Returns a callable class that can be used as follows: `instanceOfDiaryList.copyWith(...)` or like so:`instanceOfDiaryList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DiaryListCWProxy get copyWith => _$DiaryListCWProxyImpl(this);
}
