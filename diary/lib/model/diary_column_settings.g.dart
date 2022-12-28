// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_column_settings.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DiaryColumnSettingsCWProxy {
  DiaryColumnSettings width(double width);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DiaryColumnSettings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DiaryColumnSettings(...).copyWith(id: 12, name: "My name")
  /// ````
  DiaryColumnSettings call({
    double? width,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDiaryColumnSettings.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDiaryColumnSettings.copyWith.fieldName(...)`
class _$DiaryColumnSettingsCWProxyImpl implements _$DiaryColumnSettingsCWProxy {
  final DiaryColumnSettings _value;

  const _$DiaryColumnSettingsCWProxyImpl(this._value);

  @override
  DiaryColumnSettings width(double width) => this(width: width);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DiaryColumnSettings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DiaryColumnSettings(...).copyWith(id: 12, name: "My name")
  /// ````
  DiaryColumnSettings call({
    Object? width = const $CopyWithPlaceholder(),
  }) {
    return DiaryColumnSettings(
      width: width == const $CopyWithPlaceholder() || width == null
          ? _value.width
          // ignore: cast_nullable_to_non_nullable
          : width as double,
    );
  }
}

extension $DiaryColumnSettingsCopyWith on DiaryColumnSettings {
  /// Returns a callable class that can be used as follows: `instanceOfDiaryColumnSettings.copyWith(...)` or like so:`instanceOfDiaryColumnSettings.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DiaryColumnSettingsCWProxy get copyWith =>
      _$DiaryColumnSettingsCWProxyImpl(this);
}
