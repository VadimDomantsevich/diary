// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_cell_text_settings.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DiaryCellTextSettingsCWProxy {
  DiaryCellTextSettings alignment(AlignmentsEnum alignment);

  DiaryCellTextSettings color(String color);

  DiaryCellTextSettings fontSize(double fontSize);

  DiaryCellTextSettings fontStyle(FontStyleEnum fontStyle);

  DiaryCellTextSettings fontWeight(FontWeightEnum fontWeight);

  DiaryCellTextSettings textDecoration(TextDecorationEnum textDecoration);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DiaryCellTextSettings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DiaryCellTextSettings(...).copyWith(id: 12, name: "My name")
  /// ````
  DiaryCellTextSettings call({
    AlignmentsEnum? alignment,
    String? color,
    double? fontSize,
    FontStyleEnum? fontStyle,
    FontWeightEnum? fontWeight,
    TextDecorationEnum? textDecoration,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDiaryCellTextSettings.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDiaryCellTextSettings.copyWith.fieldName(...)`
class _$DiaryCellTextSettingsCWProxyImpl
    implements _$DiaryCellTextSettingsCWProxy {
  final DiaryCellTextSettings _value;

  const _$DiaryCellTextSettingsCWProxyImpl(this._value);

  @override
  DiaryCellTextSettings alignment(AlignmentsEnum alignment) =>
      this(alignment: alignment);

  @override
  DiaryCellTextSettings color(String color) => this(color: color);

  @override
  DiaryCellTextSettings fontSize(double fontSize) => this(fontSize: fontSize);

  @override
  DiaryCellTextSettings fontStyle(FontStyleEnum fontStyle) =>
      this(fontStyle: fontStyle);

  @override
  DiaryCellTextSettings fontWeight(FontWeightEnum fontWeight) =>
      this(fontWeight: fontWeight);

  @override
  DiaryCellTextSettings textDecoration(TextDecorationEnum textDecoration) =>
      this(textDecoration: textDecoration);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DiaryCellTextSettings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DiaryCellTextSettings(...).copyWith(id: 12, name: "My name")
  /// ````
  DiaryCellTextSettings call({
    Object? alignment = const $CopyWithPlaceholder(),
    Object? color = const $CopyWithPlaceholder(),
    Object? fontSize = const $CopyWithPlaceholder(),
    Object? fontStyle = const $CopyWithPlaceholder(),
    Object? fontWeight = const $CopyWithPlaceholder(),
    Object? textDecoration = const $CopyWithPlaceholder(),
  }) {
    return DiaryCellTextSettings(
      alignment: alignment == const $CopyWithPlaceholder() || alignment == null
          ? _value.alignment
          // ignore: cast_nullable_to_non_nullable
          : alignment as AlignmentsEnum,
      color: color == const $CopyWithPlaceholder() || color == null
          ? _value.color
          // ignore: cast_nullable_to_non_nullable
          : color as String,
      fontSize: fontSize == const $CopyWithPlaceholder() || fontSize == null
          ? _value.fontSize
          // ignore: cast_nullable_to_non_nullable
          : fontSize as double,
      fontStyle: fontStyle == const $CopyWithPlaceholder() || fontStyle == null
          ? _value.fontStyle
          // ignore: cast_nullable_to_non_nullable
          : fontStyle as FontStyleEnum,
      fontWeight:
          fontWeight == const $CopyWithPlaceholder() || fontWeight == null
              ? _value.fontWeight
              // ignore: cast_nullable_to_non_nullable
              : fontWeight as FontWeightEnum,
      textDecoration: textDecoration == const $CopyWithPlaceholder() ||
              textDecoration == null
          ? _value.textDecoration
          // ignore: cast_nullable_to_non_nullable
          : textDecoration as TextDecorationEnum,
    );
  }
}

extension $DiaryCellTextSettingsCopyWith on DiaryCellTextSettings {
  /// Returns a callable class that can be used as follows: `instanceOfDiaryCellTextSettings.copyWith(...)` or like so:`instanceOfDiaryCellTextSettings.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DiaryCellTextSettingsCWProxy get copyWith =>
      _$DiaryCellTextSettingsCWProxyImpl(this);
}
