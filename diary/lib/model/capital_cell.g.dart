// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'capital_cell.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CapitalCellCWProxy {
  CapitalCell columnId(String columnId);

  CapitalCell name(String name);

  CapitalCell settings(DiaryColumnSettings settings);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CapitalCell(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CapitalCell(...).copyWith(id: 12, name: "My name")
  /// ````
  CapitalCell call({
    String? columnId,
    String? name,
    DiaryColumnSettings? settings,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCapitalCell.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCapitalCell.copyWith.fieldName(...)`
class _$CapitalCellCWProxyImpl implements _$CapitalCellCWProxy {
  final CapitalCell _value;

  const _$CapitalCellCWProxyImpl(this._value);

  @override
  CapitalCell columnId(String columnId) => this(columnId: columnId);

  @override
  CapitalCell name(String name) => this(name: name);

  @override
  CapitalCell settings(DiaryColumnSettings settings) =>
      this(settings: settings);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CapitalCell(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CapitalCell(...).copyWith(id: 12, name: "My name")
  /// ````
  CapitalCell call({
    Object? columnId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? settings = const $CopyWithPlaceholder(),
  }) {
    return CapitalCell(
      columnId: columnId == const $CopyWithPlaceholder() || columnId == null
          ? _value.columnId
          // ignore: cast_nullable_to_non_nullable
          : columnId as String,
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

extension $CapitalCellCopyWith on CapitalCell {
  /// Returns a callable class that can be used as follows: `instanceOfCapitalCell.copyWith(...)` or like so:`instanceOfCapitalCell.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CapitalCellCWProxy get copyWith => _$CapitalCellCWProxyImpl(this);
}
