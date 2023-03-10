// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_list_settings.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DiaryListSettingsCWProxy {
  DiaryListSettings themeBorderColor(String themeBorderColor);

  DiaryListSettings themeColor(String themeColor);

  DiaryListSettings themePanelBackgroundColor(String themePanelBackgroundColor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DiaryListSettings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DiaryListSettings(...).copyWith(id: 12, name: "My name")
  /// ````
  DiaryListSettings call({
    String? themeBorderColor,
    String? themeColor,
    String? themePanelBackgroundColor,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDiaryListSettings.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDiaryListSettings.copyWith.fieldName(...)`
class _$DiaryListSettingsCWProxyImpl implements _$DiaryListSettingsCWProxy {
  final DiaryListSettings _value;

  const _$DiaryListSettingsCWProxyImpl(this._value);

  @override
  DiaryListSettings themeBorderColor(String themeBorderColor) =>
      this(themeBorderColor: themeBorderColor);

  @override
  DiaryListSettings themeColor(String themeColor) =>
      this(themeColor: themeColor);

  @override
  DiaryListSettings themePanelBackgroundColor(
          String themePanelBackgroundColor) =>
      this(themePanelBackgroundColor: themePanelBackgroundColor);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DiaryListSettings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DiaryListSettings(...).copyWith(id: 12, name: "My name")
  /// ````
  DiaryListSettings call({
    Object? themeBorderColor = const $CopyWithPlaceholder(),
    Object? themeColor = const $CopyWithPlaceholder(),
    Object? themePanelBackgroundColor = const $CopyWithPlaceholder(),
  }) {
    return DiaryListSettings(
      themeBorderColor: themeBorderColor == const $CopyWithPlaceholder() ||
              themeBorderColor == null
          ? _value.themeBorderColor
          // ignore: cast_nullable_to_non_nullable
          : themeBorderColor as String,
      themeColor:
          themeColor == const $CopyWithPlaceholder() || themeColor == null
              ? _value.themeColor
              // ignore: cast_nullable_to_non_nullable
              : themeColor as String,
      themePanelBackgroundColor:
          themePanelBackgroundColor == const $CopyWithPlaceholder() ||
                  themePanelBackgroundColor == null
              ? _value.themePanelBackgroundColor
              // ignore: cast_nullable_to_non_nullable
              : themePanelBackgroundColor as String,
    );
  }
}

extension $DiaryListSettingsCopyWith on DiaryListSettings {
  /// Returns a callable class that can be used as follows: `instanceOfDiaryListSettings.copyWith(...)` or like so:`instanceOfDiaryListSettings.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DiaryListSettingsCWProxy get copyWith =>
      _$DiaryListSettingsCWProxyImpl(this);
}
