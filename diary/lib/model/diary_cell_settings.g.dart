// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_cell_settings.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DiaryCellSettingsCWProxy {
  DiaryCellSettings alignment(AlignmentsEnum alignment);

  DiaryCellSettings bottomBorderColor(String bottomBorderColor);

  DiaryCellSettings bottomBorderWidth(double bottomBorderWidth);

  DiaryCellSettings height(double height);

  DiaryCellSettings leftBorderColor(String leftBorderColor);

  DiaryCellSettings leftBorderWidth(double leftBorderWidth);

  DiaryCellSettings rightBorderColor(String rightBorderColor);

  DiaryCellSettings rightBorderWidth(double rightBorderWidth);

  DiaryCellSettings topBorderColor(String topBorderColor);

  DiaryCellSettings topBorderWidth(double topBorderWidth);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DiaryCellSettings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DiaryCellSettings(...).copyWith(id: 12, name: "My name")
  /// ````
  DiaryCellSettings call({
    AlignmentsEnum? alignment,
    String? bottomBorderColor,
    double? bottomBorderWidth,
    double? height,
    String? leftBorderColor,
    double? leftBorderWidth,
    String? rightBorderColor,
    double? rightBorderWidth,
    String? topBorderColor,
    double? topBorderWidth,
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
  DiaryCellSettings bottomBorderColor(String bottomBorderColor) =>
      this(bottomBorderColor: bottomBorderColor);

  @override
  DiaryCellSettings bottomBorderWidth(double bottomBorderWidth) =>
      this(bottomBorderWidth: bottomBorderWidth);

  @override
  DiaryCellSettings height(double height) => this(height: height);

  @override
  DiaryCellSettings leftBorderColor(String leftBorderColor) =>
      this(leftBorderColor: leftBorderColor);

  @override
  DiaryCellSettings leftBorderWidth(double leftBorderWidth) =>
      this(leftBorderWidth: leftBorderWidth);

  @override
  DiaryCellSettings rightBorderColor(String rightBorderColor) =>
      this(rightBorderColor: rightBorderColor);

  @override
  DiaryCellSettings rightBorderWidth(double rightBorderWidth) =>
      this(rightBorderWidth: rightBorderWidth);

  @override
  DiaryCellSettings topBorderColor(String topBorderColor) =>
      this(topBorderColor: topBorderColor);

  @override
  DiaryCellSettings topBorderWidth(double topBorderWidth) =>
      this(topBorderWidth: topBorderWidth);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DiaryCellSettings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DiaryCellSettings(...).copyWith(id: 12, name: "My name")
  /// ````
  DiaryCellSettings call({
    Object? alignment = const $CopyWithPlaceholder(),
    Object? bottomBorderColor = const $CopyWithPlaceholder(),
    Object? bottomBorderWidth = const $CopyWithPlaceholder(),
    Object? height = const $CopyWithPlaceholder(),
    Object? leftBorderColor = const $CopyWithPlaceholder(),
    Object? leftBorderWidth = const $CopyWithPlaceholder(),
    Object? rightBorderColor = const $CopyWithPlaceholder(),
    Object? rightBorderWidth = const $CopyWithPlaceholder(),
    Object? topBorderColor = const $CopyWithPlaceholder(),
    Object? topBorderWidth = const $CopyWithPlaceholder(),
  }) {
    return DiaryCellSettings(
      alignment: alignment == const $CopyWithPlaceholder() || alignment == null
          ? _value.alignment
          // ignore: cast_nullable_to_non_nullable
          : alignment as AlignmentsEnum,
      bottomBorderColor: bottomBorderColor == const $CopyWithPlaceholder() ||
              bottomBorderColor == null
          ? _value.bottomBorderColor
          // ignore: cast_nullable_to_non_nullable
          : bottomBorderColor as String,
      bottomBorderWidth: bottomBorderWidth == const $CopyWithPlaceholder() ||
              bottomBorderWidth == null
          ? _value.bottomBorderWidth
          // ignore: cast_nullable_to_non_nullable
          : bottomBorderWidth as double,
      height: height == const $CopyWithPlaceholder() || height == null
          ? _value.height
          // ignore: cast_nullable_to_non_nullable
          : height as double,
      leftBorderColor: leftBorderColor == const $CopyWithPlaceholder() ||
              leftBorderColor == null
          ? _value.leftBorderColor
          // ignore: cast_nullable_to_non_nullable
          : leftBorderColor as String,
      leftBorderWidth: leftBorderWidth == const $CopyWithPlaceholder() ||
              leftBorderWidth == null
          ? _value.leftBorderWidth
          // ignore: cast_nullable_to_non_nullable
          : leftBorderWidth as double,
      rightBorderColor: rightBorderColor == const $CopyWithPlaceholder() ||
              rightBorderColor == null
          ? _value.rightBorderColor
          // ignore: cast_nullable_to_non_nullable
          : rightBorderColor as String,
      rightBorderWidth: rightBorderWidth == const $CopyWithPlaceholder() ||
              rightBorderWidth == null
          ? _value.rightBorderWidth
          // ignore: cast_nullable_to_non_nullable
          : rightBorderWidth as double,
      topBorderColor: topBorderColor == const $CopyWithPlaceholder() ||
              topBorderColor == null
          ? _value.topBorderColor
          // ignore: cast_nullable_to_non_nullable
          : topBorderColor as String,
      topBorderWidth: topBorderWidth == const $CopyWithPlaceholder() ||
              topBorderWidth == null
          ? _value.topBorderWidth
          // ignore: cast_nullable_to_non_nullable
          : topBorderWidth as double,
    );
  }
}

extension $DiaryCellSettingsCopyWith on DiaryCellSettings {
  /// Returns a callable class that can be used as follows: `instanceOfDiaryCellSettings.copyWith(...)` or like so:`instanceOfDiaryCellSettings.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DiaryCellSettingsCWProxy get copyWith =>
      _$DiaryCellSettingsCWProxyImpl(this);
}
