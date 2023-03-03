// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_cell.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DiaryCellCWProxy {
  DiaryCell capitalColumnPosition(int capitalColumnPosition);

  DiaryCell columnName(String columnName);

  DiaryCell columnPosition(int columnPosition);

  DiaryCell content(dynamic content);

  DiaryCell day(int day);

  DiaryCell settings(DiaryCellSettings settings);

  DiaryCell textSettings(DiaryCellTextSettings textSettings);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DiaryCell(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DiaryCell(...).copyWith(id: 12, name: "My name")
  /// ````
  DiaryCell call({
    int? capitalColumnPosition,
    String? columnName,
    int? columnPosition,
    dynamic? content,
    int? day,
    DiaryCellSettings? settings,
    DiaryCellTextSettings? textSettings,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDiaryCell.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDiaryCell.copyWith.fieldName(...)`
class _$DiaryCellCWProxyImpl implements _$DiaryCellCWProxy {
  final DiaryCell _value;

  const _$DiaryCellCWProxyImpl(this._value);

  @override
  DiaryCell capitalColumnPosition(int capitalColumnPosition) =>
      this(capitalColumnPosition: capitalColumnPosition);

  @override
  DiaryCell columnName(String columnName) => this(columnName: columnName);

  @override
  DiaryCell columnPosition(int columnPosition) =>
      this(columnPosition: columnPosition);

  @override
  DiaryCell content(dynamic content) => this(content: content);

  @override
  DiaryCell day(int day) => this(day: day);

  @override
  DiaryCell settings(DiaryCellSettings settings) => this(settings: settings);

  @override
  DiaryCell textSettings(DiaryCellTextSettings textSettings) =>
      this(textSettings: textSettings);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DiaryCell(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DiaryCell(...).copyWith(id: 12, name: "My name")
  /// ````
  DiaryCell call({
    Object? capitalColumnPosition = const $CopyWithPlaceholder(),
    Object? columnName = const $CopyWithPlaceholder(),
    Object? columnPosition = const $CopyWithPlaceholder(),
    Object? content = const $CopyWithPlaceholder(),
    Object? day = const $CopyWithPlaceholder(),
    Object? settings = const $CopyWithPlaceholder(),
    Object? textSettings = const $CopyWithPlaceholder(),
  }) {
    return DiaryCell(
      capitalColumnPosition:
          capitalColumnPosition == const $CopyWithPlaceholder() ||
                  capitalColumnPosition == null
              ? _value.capitalColumnPosition
              // ignore: cast_nullable_to_non_nullable
              : capitalColumnPosition as int,
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
      day: day == const $CopyWithPlaceholder() || day == null
          ? _value.day
          // ignore: cast_nullable_to_non_nullable
          : day as int,
      settings: settings == const $CopyWithPlaceholder() || settings == null
          ? _value.settings
          // ignore: cast_nullable_to_non_nullable
          : settings as DiaryCellSettings,
      textSettings:
          textSettings == const $CopyWithPlaceholder() || textSettings == null
              ? _value.textSettings
              // ignore: cast_nullable_to_non_nullable
              : textSettings as DiaryCellTextSettings,
    );
  }
}

extension $DiaryCellCopyWith on DiaryCell {
  /// Returns a callable class that can be used as follows: `instanceOfDiaryCell.copyWith(...)` or like so:`instanceOfDiaryCell.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DiaryCellCWProxy get copyWith => _$DiaryCellCWProxyImpl(this);
}
