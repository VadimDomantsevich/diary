// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diary_cell_text_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiaryCellTextSettings _$DiaryCellTextSettingsFromJson(
    Map<String, dynamic> json) {
  return _DiaryCellTextSettings.fromJson(json);
}

/// @nodoc
mixin _$DiaryCellTextSettings {
  AlignmentsEnum get alignment => throw _privateConstructorUsedError;
  FontWeightEnum get fontWeight => throw _privateConstructorUsedError;
  TextDecorationEnum get textDecoration => throw _privateConstructorUsedError;
  FontStyleEnum get fontStyle => throw _privateConstructorUsedError;
  double get fontSize => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiaryCellTextSettingsCopyWith<DiaryCellTextSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiaryCellTextSettingsCopyWith<$Res> {
  factory $DiaryCellTextSettingsCopyWith(DiaryCellTextSettings value,
          $Res Function(DiaryCellTextSettings) then) =
      _$DiaryCellTextSettingsCopyWithImpl<$Res, DiaryCellTextSettings>;
  @useResult
  $Res call(
      {AlignmentsEnum alignment,
      FontWeightEnum fontWeight,
      TextDecorationEnum textDecoration,
      FontStyleEnum fontStyle,
      double fontSize,
      String color});
}

/// @nodoc
class _$DiaryCellTextSettingsCopyWithImpl<$Res,
        $Val extends DiaryCellTextSettings>
    implements $DiaryCellTextSettingsCopyWith<$Res> {
  _$DiaryCellTextSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alignment = null,
    Object? fontWeight = null,
    Object? textDecoration = null,
    Object? fontStyle = null,
    Object? fontSize = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      alignment: null == alignment
          ? _value.alignment
          : alignment // ignore: cast_nullable_to_non_nullable
              as AlignmentsEnum,
      fontWeight: null == fontWeight
          ? _value.fontWeight
          : fontWeight // ignore: cast_nullable_to_non_nullable
              as FontWeightEnum,
      textDecoration: null == textDecoration
          ? _value.textDecoration
          : textDecoration // ignore: cast_nullable_to_non_nullable
              as TextDecorationEnum,
      fontStyle: null == fontStyle
          ? _value.fontStyle
          : fontStyle // ignore: cast_nullable_to_non_nullable
              as FontStyleEnum,
      fontSize: null == fontSize
          ? _value.fontSize
          : fontSize // ignore: cast_nullable_to_non_nullable
              as double,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DiaryCellTextSettingsCopyWith<$Res>
    implements $DiaryCellTextSettingsCopyWith<$Res> {
  factory _$$_DiaryCellTextSettingsCopyWith(_$_DiaryCellTextSettings value,
          $Res Function(_$_DiaryCellTextSettings) then) =
      __$$_DiaryCellTextSettingsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AlignmentsEnum alignment,
      FontWeightEnum fontWeight,
      TextDecorationEnum textDecoration,
      FontStyleEnum fontStyle,
      double fontSize,
      String color});
}

/// @nodoc
class __$$_DiaryCellTextSettingsCopyWithImpl<$Res>
    extends _$DiaryCellTextSettingsCopyWithImpl<$Res, _$_DiaryCellTextSettings>
    implements _$$_DiaryCellTextSettingsCopyWith<$Res> {
  __$$_DiaryCellTextSettingsCopyWithImpl(_$_DiaryCellTextSettings _value,
      $Res Function(_$_DiaryCellTextSettings) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alignment = null,
    Object? fontWeight = null,
    Object? textDecoration = null,
    Object? fontStyle = null,
    Object? fontSize = null,
    Object? color = null,
  }) {
    return _then(_$_DiaryCellTextSettings(
      alignment: null == alignment
          ? _value.alignment
          : alignment // ignore: cast_nullable_to_non_nullable
              as AlignmentsEnum,
      fontWeight: null == fontWeight
          ? _value.fontWeight
          : fontWeight // ignore: cast_nullable_to_non_nullable
              as FontWeightEnum,
      textDecoration: null == textDecoration
          ? _value.textDecoration
          : textDecoration // ignore: cast_nullable_to_non_nullable
              as TextDecorationEnum,
      fontStyle: null == fontStyle
          ? _value.fontStyle
          : fontStyle // ignore: cast_nullable_to_non_nullable
              as FontStyleEnum,
      fontSize: null == fontSize
          ? _value.fontSize
          : fontSize // ignore: cast_nullable_to_non_nullable
              as double,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DiaryCellTextSettings implements _DiaryCellTextSettings {
  const _$_DiaryCellTextSettings(
      {required this.alignment,
      required this.fontWeight,
      required this.textDecoration,
      required this.fontStyle,
      required this.fontSize,
      required this.color});

  factory _$_DiaryCellTextSettings.fromJson(Map<String, dynamic> json) =>
      _$$_DiaryCellTextSettingsFromJson(json);

  @override
  final AlignmentsEnum alignment;
  @override
  final FontWeightEnum fontWeight;
  @override
  final TextDecorationEnum textDecoration;
  @override
  final FontStyleEnum fontStyle;
  @override
  final double fontSize;
  @override
  final String color;

  @override
  String toString() {
    return 'DiaryCellTextSettings(alignment: $alignment, fontWeight: $fontWeight, textDecoration: $textDecoration, fontStyle: $fontStyle, fontSize: $fontSize, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiaryCellTextSettings &&
            (identical(other.alignment, alignment) ||
                other.alignment == alignment) &&
            (identical(other.fontWeight, fontWeight) ||
                other.fontWeight == fontWeight) &&
            (identical(other.textDecoration, textDecoration) ||
                other.textDecoration == textDecoration) &&
            (identical(other.fontStyle, fontStyle) ||
                other.fontStyle == fontStyle) &&
            (identical(other.fontSize, fontSize) ||
                other.fontSize == fontSize) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, alignment, fontWeight,
      textDecoration, fontStyle, fontSize, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiaryCellTextSettingsCopyWith<_$_DiaryCellTextSettings> get copyWith =>
      __$$_DiaryCellTextSettingsCopyWithImpl<_$_DiaryCellTextSettings>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiaryCellTextSettingsToJson(
      this,
    );
  }
}

abstract class _DiaryCellTextSettings implements DiaryCellTextSettings {
  const factory _DiaryCellTextSettings(
      {required final AlignmentsEnum alignment,
      required final FontWeightEnum fontWeight,
      required final TextDecorationEnum textDecoration,
      required final FontStyleEnum fontStyle,
      required final double fontSize,
      required final String color}) = _$_DiaryCellTextSettings;

  factory _DiaryCellTextSettings.fromJson(Map<String, dynamic> json) =
      _$_DiaryCellTextSettings.fromJson;

  @override
  AlignmentsEnum get alignment;
  @override
  FontWeightEnum get fontWeight;
  @override
  TextDecorationEnum get textDecoration;
  @override
  FontStyleEnum get fontStyle;
  @override
  double get fontSize;
  @override
  String get color;
  @override
  @JsonKey(ignore: true)
  _$$_DiaryCellTextSettingsCopyWith<_$_DiaryCellTextSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
