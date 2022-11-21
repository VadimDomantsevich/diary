// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_cell.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DiaryCellCWProxy {
  DiaryCell columnName(String columnName);

  DiaryCell columnPosition(int columnPosition);

  DiaryCell content(dynamic content);

  DiaryCell dataType(DataTypesEnum dataType);

  DiaryCell day(int day);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DiaryCell(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DiaryCell(...).copyWith(id: 12, name: "My name")
  /// ````
  DiaryCell call({
    String? columnName,
    int? columnPosition,
    dynamic? content,
    DataTypesEnum? dataType,
    int? day,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDiaryCell.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDiaryCell.copyWith.fieldName(...)`
class _$DiaryCellCWProxyImpl implements _$DiaryCellCWProxy {
  final DiaryCell _value;

  const _$DiaryCellCWProxyImpl(this._value);

  @override
  DiaryCell columnName(String columnName) => this(columnName: columnName);

  @override
  DiaryCell columnPosition(int columnPosition) =>
      this(columnPosition: columnPosition);

  @override
  DiaryCell content(dynamic content) => this(content: content);

  @override
  DiaryCell dataType(DataTypesEnum dataType) => this(dataType: dataType);

  @override
  DiaryCell day(int day) => this(day: day);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DiaryCell(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DiaryCell(...).copyWith(id: 12, name: "My name")
  /// ````
  DiaryCell call({
    Object? columnName = const $CopyWithPlaceholder(),
    Object? columnPosition = const $CopyWithPlaceholder(),
    Object? content = const $CopyWithPlaceholder(),
    Object? dataType = const $CopyWithPlaceholder(),
    Object? day = const $CopyWithPlaceholder(),
  }) {
    return DiaryCell(
      columnName:
          columnName == const $CopyWithPlaceholder() || columnName == null
              ? _value.columnName
              // ignore: cast_nullable_to_non_nullable
              : columnName as String,
      columnPosition: columnPosition == const $CopyWithPlaceholder() ||
              columnPosition == null
          ? _value.columnPosition
          // ignore: cast_nullable_to_non_nullable
          : columnPosition as int,
      content: content == const $CopyWithPlaceholder() || content == null
          ? _value.content
          // ignore: cast_nullable_to_non_nullable
          : content as dynamic,
      dataType: dataType == const $CopyWithPlaceholder() || dataType == null
          ? _value.dataType
          // ignore: cast_nullable_to_non_nullable
          : dataType as DataTypesEnum,
      day: day == const $CopyWithPlaceholder() || day == null
          ? _value.day
          // ignore: cast_nullable_to_non_nullable
          : day as int,
    );
  }
}

extension $DiaryCellCopyWith on DiaryCell {
  /// Returns a callable class that can be used as follows: `instanceOfDiaryCell.copyWith(...)` or like so:`instanceOfDiaryCell.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DiaryCellCWProxy get copyWith => _$DiaryCellCWProxyImpl(this);
}
