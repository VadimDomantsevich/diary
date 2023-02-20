// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diary_cells_edit_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DiaryCellsEditState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() textEditing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? textEditing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? textEditing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TextEditing value) textEditing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TextEditing value)? textEditing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TextEditing value)? textEditing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiaryCellsEditStateCopyWith<$Res> {
  factory $DiaryCellsEditStateCopyWith(
          DiaryCellsEditState value, $Res Function(DiaryCellsEditState) then) =
      _$DiaryCellsEditStateCopyWithImpl<$Res, DiaryCellsEditState>;
}

/// @nodoc
class _$DiaryCellsEditStateCopyWithImpl<$Res, $Val extends DiaryCellsEditState>
    implements $DiaryCellsEditStateCopyWith<$Res> {
  _$DiaryCellsEditStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_TextEditingCopyWith<$Res> {
  factory _$$_TextEditingCopyWith(
          _$_TextEditing value, $Res Function(_$_TextEditing) then) =
      __$$_TextEditingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_TextEditingCopyWithImpl<$Res>
    extends _$DiaryCellsEditStateCopyWithImpl<$Res, _$_TextEditing>
    implements _$$_TextEditingCopyWith<$Res> {
  __$$_TextEditingCopyWithImpl(
      _$_TextEditing _value, $Res Function(_$_TextEditing) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_TextEditing implements _TextEditing {
  const _$_TextEditing();

  @override
  String toString() {
    return 'DiaryCellsEditState.textEditing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_TextEditing);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() textEditing,
  }) {
    return textEditing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? textEditing,
  }) {
    return textEditing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? textEditing,
    required TResult orElse(),
  }) {
    if (textEditing != null) {
      return textEditing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TextEditing value) textEditing,
  }) {
    return textEditing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TextEditing value)? textEditing,
  }) {
    return textEditing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TextEditing value)? textEditing,
    required TResult orElse(),
  }) {
    if (textEditing != null) {
      return textEditing(this);
    }
    return orElse();
  }
}

abstract class _TextEditing implements DiaryCellsEditState {
  const factory _TextEditing() = _$_TextEditing;
}

/// @nodoc
mixin _$DiaryCellsEditEvent {
  HorizontalAlignmentsEnum get horizontalAlignment =>
      throw _privateConstructorUsedError;
  VerticalAlignmentsEnum get verticalAlignment =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HorizontalAlignmentsEnum horizontalAlignment,
            VerticalAlignmentsEnum verticalAlignment)
        selectAlignment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HorizontalAlignmentsEnum horizontalAlignment,
            VerticalAlignmentsEnum verticalAlignment)?
        selectAlignment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HorizontalAlignmentsEnum horizontalAlignment,
            VerticalAlignmentsEnum verticalAlignment)?
        selectAlignment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectAlignmentEvent value) selectAlignment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectAlignmentEvent value)? selectAlignment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectAlignmentEvent value)? selectAlignment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DiaryCellsEditEventCopyWith<DiaryCellsEditEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiaryCellsEditEventCopyWith<$Res> {
  factory $DiaryCellsEditEventCopyWith(
          DiaryCellsEditEvent value, $Res Function(DiaryCellsEditEvent) then) =
      _$DiaryCellsEditEventCopyWithImpl<$Res, DiaryCellsEditEvent>;
  @useResult
  $Res call(
      {HorizontalAlignmentsEnum horizontalAlignment,
      VerticalAlignmentsEnum verticalAlignment});
}

/// @nodoc
class _$DiaryCellsEditEventCopyWithImpl<$Res, $Val extends DiaryCellsEditEvent>
    implements $DiaryCellsEditEventCopyWith<$Res> {
  _$DiaryCellsEditEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? horizontalAlignment = null,
    Object? verticalAlignment = null,
  }) {
    return _then(_value.copyWith(
      horizontalAlignment: null == horizontalAlignment
          ? _value.horizontalAlignment
          : horizontalAlignment // ignore: cast_nullable_to_non_nullable
              as HorizontalAlignmentsEnum,
      verticalAlignment: null == verticalAlignment
          ? _value.verticalAlignment
          : verticalAlignment // ignore: cast_nullable_to_non_nullable
              as VerticalAlignmentsEnum,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectAlignmentEventCopyWith<$Res>
    implements $DiaryCellsEditEventCopyWith<$Res> {
  factory _$$SelectAlignmentEventCopyWith(_$SelectAlignmentEvent value,
          $Res Function(_$SelectAlignmentEvent) then) =
      __$$SelectAlignmentEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HorizontalAlignmentsEnum horizontalAlignment,
      VerticalAlignmentsEnum verticalAlignment});
}

/// @nodoc
class __$$SelectAlignmentEventCopyWithImpl<$Res>
    extends _$DiaryCellsEditEventCopyWithImpl<$Res, _$SelectAlignmentEvent>
    implements _$$SelectAlignmentEventCopyWith<$Res> {
  __$$SelectAlignmentEventCopyWithImpl(_$SelectAlignmentEvent _value,
      $Res Function(_$SelectAlignmentEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? horizontalAlignment = null,
    Object? verticalAlignment = null,
  }) {
    return _then(_$SelectAlignmentEvent(
      horizontalAlignment: null == horizontalAlignment
          ? _value.horizontalAlignment
          : horizontalAlignment // ignore: cast_nullable_to_non_nullable
              as HorizontalAlignmentsEnum,
      verticalAlignment: null == verticalAlignment
          ? _value.verticalAlignment
          : verticalAlignment // ignore: cast_nullable_to_non_nullable
              as VerticalAlignmentsEnum,
    ));
  }
}

/// @nodoc

class _$SelectAlignmentEvent implements SelectAlignmentEvent {
  const _$SelectAlignmentEvent(
      {required this.horizontalAlignment, required this.verticalAlignment});

  @override
  final HorizontalAlignmentsEnum horizontalAlignment;
  @override
  final VerticalAlignmentsEnum verticalAlignment;

  @override
  String toString() {
    return 'DiaryCellsEditEvent.selectAlignment(horizontalAlignment: $horizontalAlignment, verticalAlignment: $verticalAlignment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectAlignmentEvent &&
            (identical(other.horizontalAlignment, horizontalAlignment) ||
                other.horizontalAlignment == horizontalAlignment) &&
            (identical(other.verticalAlignment, verticalAlignment) ||
                other.verticalAlignment == verticalAlignment));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, horizontalAlignment, verticalAlignment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectAlignmentEventCopyWith<_$SelectAlignmentEvent> get copyWith =>
      __$$SelectAlignmentEventCopyWithImpl<_$SelectAlignmentEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HorizontalAlignmentsEnum horizontalAlignment,
            VerticalAlignmentsEnum verticalAlignment)
        selectAlignment,
  }) {
    return selectAlignment(horizontalAlignment, verticalAlignment);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HorizontalAlignmentsEnum horizontalAlignment,
            VerticalAlignmentsEnum verticalAlignment)?
        selectAlignment,
  }) {
    return selectAlignment?.call(horizontalAlignment, verticalAlignment);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HorizontalAlignmentsEnum horizontalAlignment,
            VerticalAlignmentsEnum verticalAlignment)?
        selectAlignment,
    required TResult orElse(),
  }) {
    if (selectAlignment != null) {
      return selectAlignment(horizontalAlignment, verticalAlignment);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectAlignmentEvent value) selectAlignment,
  }) {
    return selectAlignment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectAlignmentEvent value)? selectAlignment,
  }) {
    return selectAlignment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectAlignmentEvent value)? selectAlignment,
    required TResult orElse(),
  }) {
    if (selectAlignment != null) {
      return selectAlignment(this);
    }
    return orElse();
  }
}

abstract class SelectAlignmentEvent implements DiaryCellsEditEvent {
  const factory SelectAlignmentEvent(
          {required final HorizontalAlignmentsEnum horizontalAlignment,
          required final VerticalAlignmentsEnum verticalAlignment}) =
      _$SelectAlignmentEvent;

  @override
  HorizontalAlignmentsEnum get horizontalAlignment;
  @override
  VerticalAlignmentsEnum get verticalAlignment;
  @override
  @JsonKey(ignore: true)
  _$$SelectAlignmentEventCopyWith<_$SelectAlignmentEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
