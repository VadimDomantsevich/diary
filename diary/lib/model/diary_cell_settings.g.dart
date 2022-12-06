// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_cell_settings.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DiaryCellSettingsCWProxy {
  DiaryCellSettings alignment(AlignmentsEnum alignment);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DiaryCellSettings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DiaryCellSettings(...).copyWith(id: 12, name: "My name")
  /// ````
  DiaryCellSettings call({
    AlignmentsEnum? alignment,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDiaryCellSettings.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDiaryCellSettings.copyWith.fieldName(...)`
class _$DiaryCellSettingsCWProxyImpl implements _$DiaryCellSettingsCWProxy {
  final DiaryCellSettings _value;

  const _$DiaryCellSettingsCWProxyImpl(this._value);

  @override
  DiaryCellSettings alignment(AlignmentsEnum alignment) =>
      this(alignment: alignment);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DiaryCellSettings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DiaryCellSettings(...).copyWith(id: 12, name: "My name")
  /// ````
  DiaryCellSettings call({
    Object? alignment = const $CopyWithPlaceholder(),
  }) {
    return DiaryCellSettings(
      alignment: alignment == const $CopyWithPlaceholder() || alignment == null
          ? _value.alignment
          // ignore: cast_nullable_to_non_nullable
          : alignment as AlignmentsEnum,
    );
  }
}

extension $DiaryCellSettingsCopyWith on DiaryCellSettings {
  /// Returns a callable class that can be used as follows: `instanceOfDiaryCellSettings.copyWith(...)` or like so:`instanceOfDiaryCellSettings.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DiaryCellSettingsCWProxy get copyWith =>
      _$DiaryCellSettingsCWProxyImpl(this);
}
