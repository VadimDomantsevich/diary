// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_column.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DiaryColumnCWProxy {
  DiaryColumn columnsCount(int columnsCount);

  DiaryColumn creationTime(DateTime creationTime);

  DiaryColumn id(String id);

  DiaryColumn name(String name);

  DiaryColumn settings(DiaryColumnSettings settings);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DiaryColumn(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DiaryColumn(...).copyWith(id: 12, name: "My name")
  /// ````
  DiaryColumn call({
    int? columnsCount,
    DateTime? creationTime,
    String? id,
    String? name,
    DiaryColumnSettings? settings,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDiaryColumn.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDiaryColumn.copyWith.fieldName(...)`
class _$DiaryColumnCWProxyImpl implements _$DiaryColumnCWProxy {
  final DiaryColumn _value;

  const _$DiaryColumnCWProxyImpl(this._value);

  @override
  DiaryColumn columnsCount(int columnsCount) =>
      this(columnsCount: columnsCount);

  @override
  DiaryColumn creationTime(DateTime creationTime) =>
      this(creationTime: creationTime);

  @override
  DiaryColumn id(String id) => this(id: id);

  @override
  DiaryColumn name(String name) => this(name: name);

  @override
  DiaryColumn settings(DiaryColumnSettings settings) =>
      this(settings: settings);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DiaryColumn(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DiaryColumn(...).copyWith(id: 12, name: "My name")
  /// ````
  DiaryColumn call({
    Object? columnsCount = const $CopyWithPlaceholder(),
    Object? creationTime = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? settings = const $CopyWithPlaceholder(),
  }) {
    return DiaryColumn(
      columnsCount:
          columnsCount == const $CopyWithPlaceholder() || columnsCount == null
              ? _value.columnsCount
              // ignore: cast_nullable_to_non_nullable
              : columnsCount as int,
      creationTime:
          creationTime == const $CopyWithPlaceholder() || creationTime == null
              ? _value.creationTime
              // ignore: cast_nullable_to_non_nullable
              : creationTime as DateTime,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      settings: settings == const $CopyWithPlaceholder() || settings == null
          ? _value.settings
          // ignore: cast_nullable_to_non_nullable
          : settings as DiaryColumnSettings,
    );
  }
}

extension $DiaryColumnCopyWith on DiaryColumn {
  /// Returns a callable class that can be used as follows: `instanceOfDiaryColumn.copyWith(...)` or like so:`instanceOfDiaryColumn.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DiaryColumnCWProxy get copyWith => _$DiaryColumnCWProxyImpl(this);
}
