// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_column.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DiaryColumnCWProxy {
  DiaryColumn columnsCount(int columnsCount);

  DiaryColumn name(String name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DiaryColumn(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DiaryColumn(...).copyWith(id: 12, name: "My name")
  /// ````
  DiaryColumn call({
    int? columnsCount,
    String? name,
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
  DiaryColumn name(String name) => this(name: name);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DiaryColumn(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DiaryColumn(...).copyWith(id: 12, name: "My name")
  /// ````
  DiaryColumn call({
    Object? columnsCount = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return DiaryColumn(
      columnsCount:
          columnsCount == const $CopyWithPlaceholder() || columnsCount == null
              ? _value.columnsCount
              // ignore: cast_nullable_to_non_nullable
              : columnsCount as int,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
    );
  }
}

extension $DiaryColumnCopyWith on DiaryColumn {
  /// Returns a callable class that can be used as follows: `instanceOfDiaryColumn.copyWith(...)` or like so:`instanceOfDiaryColumn.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DiaryColumnCWProxy get copyWith => _$DiaryColumnCWProxyImpl(this);
}
