// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'grid_display_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GridDisplayEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double scaleFactor,
            DiaryList diaryList,
            List<DiaryColumn> diaryColumns,
            List<DiaryCell> diaryCells,
            bool isScaled)
        getConstraints,
    required TResult Function(PointerEvent details) onPointerSelectMove,
    required TResult Function(ScaleEndDetails details) onInteractionEnd,
    required TResult Function(PointerDownEvent details,
            GlobalObjectKey<State<StatefulWidget>> selectedCellKey)
        onPointerDown,
    required TResult Function(PointerUpEvent details) onPointerUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            double scaleFactor,
            DiaryList diaryList,
            List<DiaryColumn> diaryColumns,
            List<DiaryCell> diaryCells,
            bool isScaled)?
        getConstraints,
    TResult? Function(PointerEvent details)? onPointerSelectMove,
    TResult? Function(ScaleEndDetails details)? onInteractionEnd,
    TResult? Function(PointerDownEvent details,
            GlobalObjectKey<State<StatefulWidget>> selectedCellKey)?
        onPointerDown,
    TResult? Function(PointerUpEvent details)? onPointerUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            double scaleFactor,
            DiaryList diaryList,
            List<DiaryColumn> diaryColumns,
            List<DiaryCell> diaryCells,
            bool isScaled)?
        getConstraints,
    TResult Function(PointerEvent details)? onPointerSelectMove,
    TResult Function(ScaleEndDetails details)? onInteractionEnd,
    TResult Function(PointerDownEvent details,
            GlobalObjectKey<State<StatefulWidget>> selectedCellKey)?
        onPointerDown,
    TResult Function(PointerUpEvent details)? onPointerUp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetConstraintsEvent value) getConstraints,
    required TResult Function(_OnPointerSelectMoveEvent value)
        onPointerSelectMove,
    required TResult Function(_OnInteractionEndEvent value) onInteractionEnd,
    required TResult Function(_OnPointerDownEvent value) onPointerDown,
    required TResult Function(_OnPointerUpEvent value) onPointerUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetConstraintsEvent value)? getConstraints,
    TResult? Function(_OnPointerSelectMoveEvent value)? onPointerSelectMove,
    TResult? Function(_OnInteractionEndEvent value)? onInteractionEnd,
    TResult? Function(_OnPointerDownEvent value)? onPointerDown,
    TResult? Function(_OnPointerUpEvent value)? onPointerUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetConstraintsEvent value)? getConstraints,
    TResult Function(_OnPointerSelectMoveEvent value)? onPointerSelectMove,
    TResult Function(_OnInteractionEndEvent value)? onInteractionEnd,
    TResult Function(_OnPointerDownEvent value)? onPointerDown,
    TResult Function(_OnPointerUpEvent value)? onPointerUp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GridDisplayEventCopyWith<$Res> {
  factory $GridDisplayEventCopyWith(
          GridDisplayEvent value, $Res Function(GridDisplayEvent) then) =
      _$GridDisplayEventCopyWithImpl<$Res, GridDisplayEvent>;
}

/// @nodoc
class _$GridDisplayEventCopyWithImpl<$Res, $Val extends GridDisplayEvent>
    implements $GridDisplayEventCopyWith<$Res> {
  _$GridDisplayEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetConstraintsEventCopyWith<$Res> {
  factory _$$_GetConstraintsEventCopyWith(_$_GetConstraintsEvent value,
          $Res Function(_$_GetConstraintsEvent) then) =
      __$$_GetConstraintsEventCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {double scaleFactor,
      DiaryList diaryList,
      List<DiaryColumn> diaryColumns,
      List<DiaryCell> diaryCells,
      bool isScaled});
}

/// @nodoc
class __$$_GetConstraintsEventCopyWithImpl<$Res>
    extends _$GridDisplayEventCopyWithImpl<$Res, _$_GetConstraintsEvent>
    implements _$$_GetConstraintsEventCopyWith<$Res> {
  __$$_GetConstraintsEventCopyWithImpl(_$_GetConstraintsEvent _value,
      $Res Function(_$_GetConstraintsEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scaleFactor = null,
    Object? diaryList = null,
    Object? diaryColumns = null,
    Object? diaryCells = null,
    Object? isScaled = null,
  }) {
    return _then(_$_GetConstraintsEvent(
      scaleFactor: null == scaleFactor
          ? _value.scaleFactor
          : scaleFactor // ignore: cast_nullable_to_non_nullable
              as double,
      diaryList: null == diaryList
          ? _value.diaryList
          : diaryList // ignore: cast_nullable_to_non_nullable
              as DiaryList,
      diaryColumns: null == diaryColumns
          ? _value._diaryColumns
          : diaryColumns // ignore: cast_nullable_to_non_nullable
              as List<DiaryColumn>,
      diaryCells: null == diaryCells
          ? _value._diaryCells
          : diaryCells // ignore: cast_nullable_to_non_nullable
              as List<DiaryCell>,
      isScaled: null == isScaled
          ? _value.isScaled
          : isScaled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_GetConstraintsEvent implements _GetConstraintsEvent {
  const _$_GetConstraintsEvent(
      {required this.scaleFactor,
      required this.diaryList,
      required final List<DiaryColumn> diaryColumns,
      required final List<DiaryCell> diaryCells,
      required this.isScaled})
      : _diaryColumns = diaryColumns,
        _diaryCells = diaryCells;

  @override
  final double scaleFactor;
  @override
  final DiaryList diaryList;
  final List<DiaryColumn> _diaryColumns;
  @override
  List<DiaryColumn> get diaryColumns {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_diaryColumns);
  }

  final List<DiaryCell> _diaryCells;
  @override
  List<DiaryCell> get diaryCells {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_diaryCells);
  }

  @override
  final bool isScaled;

  @override
  String toString() {
    return 'GridDisplayEvent.getConstraints(scaleFactor: $scaleFactor, diaryList: $diaryList, diaryColumns: $diaryColumns, diaryCells: $diaryCells, isScaled: $isScaled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetConstraintsEvent &&
            (identical(other.scaleFactor, scaleFactor) ||
                other.scaleFactor == scaleFactor) &&
            (identical(other.diaryList, diaryList) ||
                other.diaryList == diaryList) &&
            const DeepCollectionEquality()
                .equals(other._diaryColumns, _diaryColumns) &&
            const DeepCollectionEquality()
                .equals(other._diaryCells, _diaryCells) &&
            (identical(other.isScaled, isScaled) ||
                other.isScaled == isScaled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      scaleFactor,
      diaryList,
      const DeepCollectionEquality().hash(_diaryColumns),
      const DeepCollectionEquality().hash(_diaryCells),
      isScaled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetConstraintsEventCopyWith<_$_GetConstraintsEvent> get copyWith =>
      __$$_GetConstraintsEventCopyWithImpl<_$_GetConstraintsEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double scaleFactor,
            DiaryList diaryList,
            List<DiaryColumn> diaryColumns,
            List<DiaryCell> diaryCells,
            bool isScaled)
        getConstraints,
    required TResult Function(PointerEvent details) onPointerSelectMove,
    required TResult Function(ScaleEndDetails details) onInteractionEnd,
    required TResult Function(PointerDownEvent details,
            GlobalObjectKey<State<StatefulWidget>> selectedCellKey)
        onPointerDown,
    required TResult Function(PointerUpEvent details) onPointerUp,
  }) {
    return getConstraints(
        scaleFactor, diaryList, diaryColumns, diaryCells, isScaled);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            double scaleFactor,
            DiaryList diaryList,
            List<DiaryColumn> diaryColumns,
            List<DiaryCell> diaryCells,
            bool isScaled)?
        getConstraints,
    TResult? Function(PointerEvent details)? onPointerSelectMove,
    TResult? Function(ScaleEndDetails details)? onInteractionEnd,
    TResult? Function(PointerDownEvent details,
            GlobalObjectKey<State<StatefulWidget>> selectedCellKey)?
        onPointerDown,
    TResult? Function(PointerUpEvent details)? onPointerUp,
  }) {
    return getConstraints?.call(
        scaleFactor, diaryList, diaryColumns, diaryCells, isScaled);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            double scaleFactor,
            DiaryList diaryList,
            List<DiaryColumn> diaryColumns,
            List<DiaryCell> diaryCells,
            bool isScaled)?
        getConstraints,
    TResult Function(PointerEvent details)? onPointerSelectMove,
    TResult Function(ScaleEndDetails details)? onInteractionEnd,
    TResult Function(PointerDownEvent details,
            GlobalObjectKey<State<StatefulWidget>> selectedCellKey)?
        onPointerDown,
    TResult Function(PointerUpEvent details)? onPointerUp,
    required TResult orElse(),
  }) {
    if (getConstraints != null) {
      return getConstraints(
          scaleFactor, diaryList, diaryColumns, diaryCells, isScaled);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetConstraintsEvent value) getConstraints,
    required TResult Function(_OnPointerSelectMoveEvent value)
        onPointerSelectMove,
    required TResult Function(_OnInteractionEndEvent value) onInteractionEnd,
    required TResult Function(_OnPointerDownEvent value) onPointerDown,
    required TResult Function(_OnPointerUpEvent value) onPointerUp,
  }) {
    return getConstraints(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetConstraintsEvent value)? getConstraints,
    TResult? Function(_OnPointerSelectMoveEvent value)? onPointerSelectMove,
    TResult? Function(_OnInteractionEndEvent value)? onInteractionEnd,
    TResult? Function(_OnPointerDownEvent value)? onPointerDown,
    TResult? Function(_OnPointerUpEvent value)? onPointerUp,
  }) {
    return getConstraints?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetConstraintsEvent value)? getConstraints,
    TResult Function(_OnPointerSelectMoveEvent value)? onPointerSelectMove,
    TResult Function(_OnInteractionEndEvent value)? onInteractionEnd,
    TResult Function(_OnPointerDownEvent value)? onPointerDown,
    TResult Function(_OnPointerUpEvent value)? onPointerUp,
    required TResult orElse(),
  }) {
    if (getConstraints != null) {
      return getConstraints(this);
    }
    return orElse();
  }
}

abstract class _GetConstraintsEvent implements GridDisplayEvent {
  const factory _GetConstraintsEvent(
      {required final double scaleFactor,
      required final DiaryList diaryList,
      required final List<DiaryColumn> diaryColumns,
      required final List<DiaryCell> diaryCells,
      required final bool isScaled}) = _$_GetConstraintsEvent;

  double get scaleFactor;
  DiaryList get diaryList;
  List<DiaryColumn> get diaryColumns;
  List<DiaryCell> get diaryCells;
  bool get isScaled;
  @JsonKey(ignore: true)
  _$$_GetConstraintsEventCopyWith<_$_GetConstraintsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_OnPointerSelectMoveEventCopyWith<$Res> {
  factory _$$_OnPointerSelectMoveEventCopyWith(
          _$_OnPointerSelectMoveEvent value,
          $Res Function(_$_OnPointerSelectMoveEvent) then) =
      __$$_OnPointerSelectMoveEventCopyWithImpl<$Res>;
  @useResult
  $Res call({PointerEvent details});
}

/// @nodoc
class __$$_OnPointerSelectMoveEventCopyWithImpl<$Res>
    extends _$GridDisplayEventCopyWithImpl<$Res, _$_OnPointerSelectMoveEvent>
    implements _$$_OnPointerSelectMoveEventCopyWith<$Res> {
  __$$_OnPointerSelectMoveEventCopyWithImpl(_$_OnPointerSelectMoveEvent _value,
      $Res Function(_$_OnPointerSelectMoveEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = null,
  }) {
    return _then(_$_OnPointerSelectMoveEvent(
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as PointerEvent,
    ));
  }
}

/// @nodoc

class _$_OnPointerSelectMoveEvent implements _OnPointerSelectMoveEvent {
  const _$_OnPointerSelectMoveEvent({required this.details});

  @override
  final PointerEvent details;

  @override
  String toString() {
    return 'GridDisplayEvent.onPointerSelectMove(details: $details)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnPointerSelectMoveEvent &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode => Object.hash(runtimeType, details);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnPointerSelectMoveEventCopyWith<_$_OnPointerSelectMoveEvent>
      get copyWith => __$$_OnPointerSelectMoveEventCopyWithImpl<
          _$_OnPointerSelectMoveEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double scaleFactor,
            DiaryList diaryList,
            List<DiaryColumn> diaryColumns,
            List<DiaryCell> diaryCells,
            bool isScaled)
        getConstraints,
    required TResult Function(PointerEvent details) onPointerSelectMove,
    required TResult Function(ScaleEndDetails details) onInteractionEnd,
    required TResult Function(PointerDownEvent details,
            GlobalObjectKey<State<StatefulWidget>> selectedCellKey)
        onPointerDown,
    required TResult Function(PointerUpEvent details) onPointerUp,
  }) {
    return onPointerSelectMove(details);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            double scaleFactor,
            DiaryList diaryList,
            List<DiaryColumn> diaryColumns,
            List<DiaryCell> diaryCells,
            bool isScaled)?
        getConstraints,
    TResult? Function(PointerEvent details)? onPointerSelectMove,
    TResult? Function(ScaleEndDetails details)? onInteractionEnd,
    TResult? Function(PointerDownEvent details,
            GlobalObjectKey<State<StatefulWidget>> selectedCellKey)?
        onPointerDown,
    TResult? Function(PointerUpEvent details)? onPointerUp,
  }) {
    return onPointerSelectMove?.call(details);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            double scaleFactor,
            DiaryList diaryList,
            List<DiaryColumn> diaryColumns,
            List<DiaryCell> diaryCells,
            bool isScaled)?
        getConstraints,
    TResult Function(PointerEvent details)? onPointerSelectMove,
    TResult Function(ScaleEndDetails details)? onInteractionEnd,
    TResult Function(PointerDownEvent details,
            GlobalObjectKey<State<StatefulWidget>> selectedCellKey)?
        onPointerDown,
    TResult Function(PointerUpEvent details)? onPointerUp,
    required TResult orElse(),
  }) {
    if (onPointerSelectMove != null) {
      return onPointerSelectMove(details);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetConstraintsEvent value) getConstraints,
    required TResult Function(_OnPointerSelectMoveEvent value)
        onPointerSelectMove,
    required TResult Function(_OnInteractionEndEvent value) onInteractionEnd,
    required TResult Function(_OnPointerDownEvent value) onPointerDown,
    required TResult Function(_OnPointerUpEvent value) onPointerUp,
  }) {
    return onPointerSelectMove(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetConstraintsEvent value)? getConstraints,
    TResult? Function(_OnPointerSelectMoveEvent value)? onPointerSelectMove,
    TResult? Function(_OnInteractionEndEvent value)? onInteractionEnd,
    TResult? Function(_OnPointerDownEvent value)? onPointerDown,
    TResult? Function(_OnPointerUpEvent value)? onPointerUp,
  }) {
    return onPointerSelectMove?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetConstraintsEvent value)? getConstraints,
    TResult Function(_OnPointerSelectMoveEvent value)? onPointerSelectMove,
    TResult Function(_OnInteractionEndEvent value)? onInteractionEnd,
    TResult Function(_OnPointerDownEvent value)? onPointerDown,
    TResult Function(_OnPointerUpEvent value)? onPointerUp,
    required TResult orElse(),
  }) {
    if (onPointerSelectMove != null) {
      return onPointerSelectMove(this);
    }
    return orElse();
  }
}

abstract class _OnPointerSelectMoveEvent implements GridDisplayEvent {
  const factory _OnPointerSelectMoveEvent(
      {required final PointerEvent details}) = _$_OnPointerSelectMoveEvent;

  PointerEvent get details;
  @JsonKey(ignore: true)
  _$$_OnPointerSelectMoveEventCopyWith<_$_OnPointerSelectMoveEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_OnInteractionEndEventCopyWith<$Res> {
  factory _$$_OnInteractionEndEventCopyWith(_$_OnInteractionEndEvent value,
          $Res Function(_$_OnInteractionEndEvent) then) =
      __$$_OnInteractionEndEventCopyWithImpl<$Res>;
  @useResult
  $Res call({ScaleEndDetails details});
}

/// @nodoc
class __$$_OnInteractionEndEventCopyWithImpl<$Res>
    extends _$GridDisplayEventCopyWithImpl<$Res, _$_OnInteractionEndEvent>
    implements _$$_OnInteractionEndEventCopyWith<$Res> {
  __$$_OnInteractionEndEventCopyWithImpl(_$_OnInteractionEndEvent _value,
      $Res Function(_$_OnInteractionEndEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = null,
  }) {
    return _then(_$_OnInteractionEndEvent(
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as ScaleEndDetails,
    ));
  }
}

/// @nodoc

class _$_OnInteractionEndEvent implements _OnInteractionEndEvent {
  const _$_OnInteractionEndEvent({required this.details});

  @override
  final ScaleEndDetails details;

  @override
  String toString() {
    return 'GridDisplayEvent.onInteractionEnd(details: $details)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnInteractionEndEvent &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode => Object.hash(runtimeType, details);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnInteractionEndEventCopyWith<_$_OnInteractionEndEvent> get copyWith =>
      __$$_OnInteractionEndEventCopyWithImpl<_$_OnInteractionEndEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double scaleFactor,
            DiaryList diaryList,
            List<DiaryColumn> diaryColumns,
            List<DiaryCell> diaryCells,
            bool isScaled)
        getConstraints,
    required TResult Function(PointerEvent details) onPointerSelectMove,
    required TResult Function(ScaleEndDetails details) onInteractionEnd,
    required TResult Function(PointerDownEvent details,
            GlobalObjectKey<State<StatefulWidget>> selectedCellKey)
        onPointerDown,
    required TResult Function(PointerUpEvent details) onPointerUp,
  }) {
    return onInteractionEnd(details);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            double scaleFactor,
            DiaryList diaryList,
            List<DiaryColumn> diaryColumns,
            List<DiaryCell> diaryCells,
            bool isScaled)?
        getConstraints,
    TResult? Function(PointerEvent details)? onPointerSelectMove,
    TResult? Function(ScaleEndDetails details)? onInteractionEnd,
    TResult? Function(PointerDownEvent details,
            GlobalObjectKey<State<StatefulWidget>> selectedCellKey)?
        onPointerDown,
    TResult? Function(PointerUpEvent details)? onPointerUp,
  }) {
    return onInteractionEnd?.call(details);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            double scaleFactor,
            DiaryList diaryList,
            List<DiaryColumn> diaryColumns,
            List<DiaryCell> diaryCells,
            bool isScaled)?
        getConstraints,
    TResult Function(PointerEvent details)? onPointerSelectMove,
    TResult Function(ScaleEndDetails details)? onInteractionEnd,
    TResult Function(PointerDownEvent details,
            GlobalObjectKey<State<StatefulWidget>> selectedCellKey)?
        onPointerDown,
    TResult Function(PointerUpEvent details)? onPointerUp,
    required TResult orElse(),
  }) {
    if (onInteractionEnd != null) {
      return onInteractionEnd(details);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetConstraintsEvent value) getConstraints,
    required TResult Function(_OnPointerSelectMoveEvent value)
        onPointerSelectMove,
    required TResult Function(_OnInteractionEndEvent value) onInteractionEnd,
    required TResult Function(_OnPointerDownEvent value) onPointerDown,
    required TResult Function(_OnPointerUpEvent value) onPointerUp,
  }) {
    return onInteractionEnd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetConstraintsEvent value)? getConstraints,
    TResult? Function(_OnPointerSelectMoveEvent value)? onPointerSelectMove,
    TResult? Function(_OnInteractionEndEvent value)? onInteractionEnd,
    TResult? Function(_OnPointerDownEvent value)? onPointerDown,
    TResult? Function(_OnPointerUpEvent value)? onPointerUp,
  }) {
    return onInteractionEnd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetConstraintsEvent value)? getConstraints,
    TResult Function(_OnPointerSelectMoveEvent value)? onPointerSelectMove,
    TResult Function(_OnInteractionEndEvent value)? onInteractionEnd,
    TResult Function(_OnPointerDownEvent value)? onPointerDown,
    TResult Function(_OnPointerUpEvent value)? onPointerUp,
    required TResult orElse(),
  }) {
    if (onInteractionEnd != null) {
      return onInteractionEnd(this);
    }
    return orElse();
  }
}

abstract class _OnInteractionEndEvent implements GridDisplayEvent {
  const factory _OnInteractionEndEvent(
      {required final ScaleEndDetails details}) = _$_OnInteractionEndEvent;

  ScaleEndDetails get details;
  @JsonKey(ignore: true)
  _$$_OnInteractionEndEventCopyWith<_$_OnInteractionEndEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_OnPointerDownEventCopyWith<$Res> {
  factory _$$_OnPointerDownEventCopyWith(_$_OnPointerDownEvent value,
          $Res Function(_$_OnPointerDownEvent) then) =
      __$$_OnPointerDownEventCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {PointerDownEvent details,
      GlobalObjectKey<State<StatefulWidget>> selectedCellKey});
}

/// @nodoc
class __$$_OnPointerDownEventCopyWithImpl<$Res>
    extends _$GridDisplayEventCopyWithImpl<$Res, _$_OnPointerDownEvent>
    implements _$$_OnPointerDownEventCopyWith<$Res> {
  __$$_OnPointerDownEventCopyWithImpl(
      _$_OnPointerDownEvent _value, $Res Function(_$_OnPointerDownEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = null,
    Object? selectedCellKey = null,
  }) {
    return _then(_$_OnPointerDownEvent(
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as PointerDownEvent,
      selectedCellKey: null == selectedCellKey
          ? _value.selectedCellKey
          : selectedCellKey // ignore: cast_nullable_to_non_nullable
              as GlobalObjectKey<State<StatefulWidget>>,
    ));
  }
}

/// @nodoc

class _$_OnPointerDownEvent implements _OnPointerDownEvent {
  const _$_OnPointerDownEvent(
      {required this.details, required this.selectedCellKey});

  @override
  final PointerDownEvent details;
  @override
  final GlobalObjectKey<State<StatefulWidget>> selectedCellKey;

  @override
  String toString() {
    return 'GridDisplayEvent.onPointerDown(details: $details, selectedCellKey: $selectedCellKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnPointerDownEvent &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.selectedCellKey, selectedCellKey) ||
                other.selectedCellKey == selectedCellKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, details, selectedCellKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnPointerDownEventCopyWith<_$_OnPointerDownEvent> get copyWith =>
      __$$_OnPointerDownEventCopyWithImpl<_$_OnPointerDownEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double scaleFactor,
            DiaryList diaryList,
            List<DiaryColumn> diaryColumns,
            List<DiaryCell> diaryCells,
            bool isScaled)
        getConstraints,
    required TResult Function(PointerEvent details) onPointerSelectMove,
    required TResult Function(ScaleEndDetails details) onInteractionEnd,
    required TResult Function(PointerDownEvent details,
            GlobalObjectKey<State<StatefulWidget>> selectedCellKey)
        onPointerDown,
    required TResult Function(PointerUpEvent details) onPointerUp,
  }) {
    return onPointerDown(details, selectedCellKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            double scaleFactor,
            DiaryList diaryList,
            List<DiaryColumn> diaryColumns,
            List<DiaryCell> diaryCells,
            bool isScaled)?
        getConstraints,
    TResult? Function(PointerEvent details)? onPointerSelectMove,
    TResult? Function(ScaleEndDetails details)? onInteractionEnd,
    TResult? Function(PointerDownEvent details,
            GlobalObjectKey<State<StatefulWidget>> selectedCellKey)?
        onPointerDown,
    TResult? Function(PointerUpEvent details)? onPointerUp,
  }) {
    return onPointerDown?.call(details, selectedCellKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            double scaleFactor,
            DiaryList diaryList,
            List<DiaryColumn> diaryColumns,
            List<DiaryCell> diaryCells,
            bool isScaled)?
        getConstraints,
    TResult Function(PointerEvent details)? onPointerSelectMove,
    TResult Function(ScaleEndDetails details)? onInteractionEnd,
    TResult Function(PointerDownEvent details,
            GlobalObjectKey<State<StatefulWidget>> selectedCellKey)?
        onPointerDown,
    TResult Function(PointerUpEvent details)? onPointerUp,
    required TResult orElse(),
  }) {
    if (onPointerDown != null) {
      return onPointerDown(details, selectedCellKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetConstraintsEvent value) getConstraints,
    required TResult Function(_OnPointerSelectMoveEvent value)
        onPointerSelectMove,
    required TResult Function(_OnInteractionEndEvent value) onInteractionEnd,
    required TResult Function(_OnPointerDownEvent value) onPointerDown,
    required TResult Function(_OnPointerUpEvent value) onPointerUp,
  }) {
    return onPointerDown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetConstraintsEvent value)? getConstraints,
    TResult? Function(_OnPointerSelectMoveEvent value)? onPointerSelectMove,
    TResult? Function(_OnInteractionEndEvent value)? onInteractionEnd,
    TResult? Function(_OnPointerDownEvent value)? onPointerDown,
    TResult? Function(_OnPointerUpEvent value)? onPointerUp,
  }) {
    return onPointerDown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetConstraintsEvent value)? getConstraints,
    TResult Function(_OnPointerSelectMoveEvent value)? onPointerSelectMove,
    TResult Function(_OnInteractionEndEvent value)? onInteractionEnd,
    TResult Function(_OnPointerDownEvent value)? onPointerDown,
    TResult Function(_OnPointerUpEvent value)? onPointerUp,
    required TResult orElse(),
  }) {
    if (onPointerDown != null) {
      return onPointerDown(this);
    }
    return orElse();
  }
}

abstract class _OnPointerDownEvent implements GridDisplayEvent {
  const factory _OnPointerDownEvent(
      {required final PointerDownEvent details,
      required final GlobalObjectKey<State<StatefulWidget>>
          selectedCellKey}) = _$_OnPointerDownEvent;

  PointerDownEvent get details;
  GlobalObjectKey<State<StatefulWidget>> get selectedCellKey;
  @JsonKey(ignore: true)
  _$$_OnPointerDownEventCopyWith<_$_OnPointerDownEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_OnPointerUpEventCopyWith<$Res> {
  factory _$$_OnPointerUpEventCopyWith(
          _$_OnPointerUpEvent value, $Res Function(_$_OnPointerUpEvent) then) =
      __$$_OnPointerUpEventCopyWithImpl<$Res>;
  @useResult
  $Res call({PointerUpEvent details});
}

/// @nodoc
class __$$_OnPointerUpEventCopyWithImpl<$Res>
    extends _$GridDisplayEventCopyWithImpl<$Res, _$_OnPointerUpEvent>
    implements _$$_OnPointerUpEventCopyWith<$Res> {
  __$$_OnPointerUpEventCopyWithImpl(
      _$_OnPointerUpEvent _value, $Res Function(_$_OnPointerUpEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = null,
  }) {
    return _then(_$_OnPointerUpEvent(
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as PointerUpEvent,
    ));
  }
}

/// @nodoc

class _$_OnPointerUpEvent implements _OnPointerUpEvent {
  const _$_OnPointerUpEvent({required this.details});

  @override
  final PointerUpEvent details;

  @override
  String toString() {
    return 'GridDisplayEvent.onPointerUp(details: $details)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnPointerUpEvent &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode => Object.hash(runtimeType, details);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnPointerUpEventCopyWith<_$_OnPointerUpEvent> get copyWith =>
      __$$_OnPointerUpEventCopyWithImpl<_$_OnPointerUpEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double scaleFactor,
            DiaryList diaryList,
            List<DiaryColumn> diaryColumns,
            List<DiaryCell> diaryCells,
            bool isScaled)
        getConstraints,
    required TResult Function(PointerEvent details) onPointerSelectMove,
    required TResult Function(ScaleEndDetails details) onInteractionEnd,
    required TResult Function(PointerDownEvent details,
            GlobalObjectKey<State<StatefulWidget>> selectedCellKey)
        onPointerDown,
    required TResult Function(PointerUpEvent details) onPointerUp,
  }) {
    return onPointerUp(details);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            double scaleFactor,
            DiaryList diaryList,
            List<DiaryColumn> diaryColumns,
            List<DiaryCell> diaryCells,
            bool isScaled)?
        getConstraints,
    TResult? Function(PointerEvent details)? onPointerSelectMove,
    TResult? Function(ScaleEndDetails details)? onInteractionEnd,
    TResult? Function(PointerDownEvent details,
            GlobalObjectKey<State<StatefulWidget>> selectedCellKey)?
        onPointerDown,
    TResult? Function(PointerUpEvent details)? onPointerUp,
  }) {
    return onPointerUp?.call(details);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            double scaleFactor,
            DiaryList diaryList,
            List<DiaryColumn> diaryColumns,
            List<DiaryCell> diaryCells,
            bool isScaled)?
        getConstraints,
    TResult Function(PointerEvent details)? onPointerSelectMove,
    TResult Function(ScaleEndDetails details)? onInteractionEnd,
    TResult Function(PointerDownEvent details,
            GlobalObjectKey<State<StatefulWidget>> selectedCellKey)?
        onPointerDown,
    TResult Function(PointerUpEvent details)? onPointerUp,
    required TResult orElse(),
  }) {
    if (onPointerUp != null) {
      return onPointerUp(details);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetConstraintsEvent value) getConstraints,
    required TResult Function(_OnPointerSelectMoveEvent value)
        onPointerSelectMove,
    required TResult Function(_OnInteractionEndEvent value) onInteractionEnd,
    required TResult Function(_OnPointerDownEvent value) onPointerDown,
    required TResult Function(_OnPointerUpEvent value) onPointerUp,
  }) {
    return onPointerUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetConstraintsEvent value)? getConstraints,
    TResult? Function(_OnPointerSelectMoveEvent value)? onPointerSelectMove,
    TResult? Function(_OnInteractionEndEvent value)? onInteractionEnd,
    TResult? Function(_OnPointerDownEvent value)? onPointerDown,
    TResult? Function(_OnPointerUpEvent value)? onPointerUp,
  }) {
    return onPointerUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetConstraintsEvent value)? getConstraints,
    TResult Function(_OnPointerSelectMoveEvent value)? onPointerSelectMove,
    TResult Function(_OnInteractionEndEvent value)? onInteractionEnd,
    TResult Function(_OnPointerDownEvent value)? onPointerDown,
    TResult Function(_OnPointerUpEvent value)? onPointerUp,
    required TResult orElse(),
  }) {
    if (onPointerUp != null) {
      return onPointerUp(this);
    }
    return orElse();
  }
}

abstract class _OnPointerUpEvent implements GridDisplayEvent {
  const factory _OnPointerUpEvent({required final PointerUpEvent details}) =
      _$_OnPointerUpEvent;

  PointerUpEvent get details;
  @JsonKey(ignore: true)
  _$$_OnPointerUpEventCopyWith<_$_OnPointerUpEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GridDisplayState {
  double get scaleFactor => throw _privateConstructorUsedError;
  TransformationController get transformationController =>
      throw _privateConstructorUsedError;
  double get translateX => throw _privateConstructorUsedError;
  double get translateY => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double scaleFactor,
            TransformationController transformationController,
            double translateX,
            double translateY)
        initial,
    required TResult Function(
            double scaleFactor,
            double width,
            double height,
            TransformationController transformationController,
            double translateX,
            double translateY)
        loaded,
    required TResult Function(
            double scaleFactor,
            double width,
            double height,
            TransformationController transformationController,
            double translateX,
            double translateY)
        selectedMoving,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            double scaleFactor,
            TransformationController transformationController,
            double translateX,
            double translateY)?
        initial,
    TResult? Function(
            double scaleFactor,
            double width,
            double height,
            TransformationController transformationController,
            double translateX,
            double translateY)?
        loaded,
    TResult? Function(
            double scaleFactor,
            double width,
            double height,
            TransformationController transformationController,
            double translateX,
            double translateY)?
        selectedMoving,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            double scaleFactor,
            TransformationController transformationController,
            double translateX,
            double translateY)?
        initial,
    TResult Function(
            double scaleFactor,
            double width,
            double height,
            TransformationController transformationController,
            double translateX,
            double translateY)?
        loaded,
    TResult Function(
            double scaleFactor,
            double width,
            double height,
            TransformationController transformationController,
            double translateX,
            double translateY)?
        selectedMoving,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_SelectedMoving value) selectedMoving,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_SelectedMoving value)? selectedMoving,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_SelectedMoving value)? selectedMoving,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GridDisplayStateCopyWith<GridDisplayState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GridDisplayStateCopyWith<$Res> {
  factory $GridDisplayStateCopyWith(
          GridDisplayState value, $Res Function(GridDisplayState) then) =
      _$GridDisplayStateCopyWithImpl<$Res, GridDisplayState>;
  @useResult
  $Res call(
      {double scaleFactor,
      TransformationController transformationController,
      double translateX,
      double translateY});
}

/// @nodoc
class _$GridDisplayStateCopyWithImpl<$Res, $Val extends GridDisplayState>
    implements $GridDisplayStateCopyWith<$Res> {
  _$GridDisplayStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scaleFactor = null,
    Object? transformationController = null,
    Object? translateX = null,
    Object? translateY = null,
  }) {
    return _then(_value.copyWith(
      scaleFactor: null == scaleFactor
          ? _value.scaleFactor
          : scaleFactor // ignore: cast_nullable_to_non_nullable
              as double,
      transformationController: null == transformationController
          ? _value.transformationController
          : transformationController // ignore: cast_nullable_to_non_nullable
              as TransformationController,
      translateX: null == translateX
          ? _value.translateX
          : translateX // ignore: cast_nullable_to_non_nullable
              as double,
      translateY: null == translateY
          ? _value.translateY
          : translateY // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $GridDisplayStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double scaleFactor,
      TransformationController transformationController,
      double translateX,
      double translateY});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$GridDisplayStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scaleFactor = null,
    Object? transformationController = null,
    Object? translateX = null,
    Object? translateY = null,
  }) {
    return _then(_$_Initial(
      scaleFactor: null == scaleFactor
          ? _value.scaleFactor
          : scaleFactor // ignore: cast_nullable_to_non_nullable
              as double,
      transformationController: null == transformationController
          ? _value.transformationController
          : transformationController // ignore: cast_nullable_to_non_nullable
              as TransformationController,
      translateX: null == translateX
          ? _value.translateX
          : translateX // ignore: cast_nullable_to_non_nullable
              as double,
      translateY: null == translateY
          ? _value.translateY
          : translateY // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required this.scaleFactor,
      required this.transformationController,
      required this.translateX,
      required this.translateY});

  @override
  final double scaleFactor;
  @override
  final TransformationController transformationController;
  @override
  final double translateX;
  @override
  final double translateY;

  @override
  String toString() {
    return 'GridDisplayState.initial(scaleFactor: $scaleFactor, transformationController: $transformationController, translateX: $translateX, translateY: $translateY)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.scaleFactor, scaleFactor) ||
                other.scaleFactor == scaleFactor) &&
            (identical(
                    other.transformationController, transformationController) ||
                other.transformationController == transformationController) &&
            (identical(other.translateX, translateX) ||
                other.translateX == translateX) &&
            (identical(other.translateY, translateY) ||
                other.translateY == translateY));
  }

  @override
  int get hashCode => Object.hash(runtimeType, scaleFactor,
      transformationController, translateX, translateY);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double scaleFactor,
            TransformationController transformationController,
            double translateX,
            double translateY)
        initial,
    required TResult Function(
            double scaleFactor,
            double width,
            double height,
            TransformationController transformationController,
            double translateX,
            double translateY)
        loaded,
    required TResult Function(
            double scaleFactor,
            double width,
            double height,
            TransformationController transformationController,
            double translateX,
            double translateY)
        selectedMoving,
  }) {
    return initial(
        scaleFactor, transformationController, translateX, translateY);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            double scaleFactor,
            TransformationController transformationController,
            double translateX,
            double translateY)?
        initial,
    TResult? Function(
            double scaleFactor,
            double width,
            double height,
            TransformationController transformationController,
            double translateX,
            double translateY)?
        loaded,
    TResult? Function(
            double scaleFactor,
            double width,
            double height,
            TransformationController transformationController,
            double translateX,
            double translateY)?
        selectedMoving,
  }) {
    return initial?.call(
        scaleFactor, transformationController, translateX, translateY);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            double scaleFactor,
            TransformationController transformationController,
            double translateX,
            double translateY)?
        initial,
    TResult Function(
            double scaleFactor,
            double width,
            double height,
            TransformationController transformationController,
            double translateX,
            double translateY)?
        loaded,
    TResult Function(
            double scaleFactor,
            double width,
            double height,
            TransformationController transformationController,
            double translateX,
            double translateY)?
        selectedMoving,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
          scaleFactor, transformationController, translateX, translateY);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_SelectedMoving value) selectedMoving,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_SelectedMoving value)? selectedMoving,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_SelectedMoving value)? selectedMoving,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements GridDisplayState {
  const factory _Initial(
      {required final double scaleFactor,
      required final TransformationController transformationController,
      required final double translateX,
      required final double translateY}) = _$_Initial;

  @override
  double get scaleFactor;
  @override
  TransformationController get transformationController;
  @override
  double get translateX;
  @override
  double get translateY;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res>
    implements $GridDisplayStateCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double scaleFactor,
      double width,
      double height,
      TransformationController transformationController,
      double translateX,
      double translateY});
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res>
    extends _$GridDisplayStateCopyWithImpl<$Res, _$_Loaded>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scaleFactor = null,
    Object? width = null,
    Object? height = null,
    Object? transformationController = null,
    Object? translateX = null,
    Object? translateY = null,
  }) {
    return _then(_$_Loaded(
      scaleFactor: null == scaleFactor
          ? _value.scaleFactor
          : scaleFactor // ignore: cast_nullable_to_non_nullable
              as double,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      transformationController: null == transformationController
          ? _value.transformationController
          : transformationController // ignore: cast_nullable_to_non_nullable
              as TransformationController,
      translateX: null == translateX
          ? _value.translateX
          : translateX // ignore: cast_nullable_to_non_nullable
              as double,
      translateY: null == translateY
          ? _value.translateY
          : translateY // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded(
      {required this.scaleFactor,
      required this.width,
      required this.height,
      required this.transformationController,
      required this.translateX,
      required this.translateY});

  @override
  final double scaleFactor;
  @override
  final double width;
  @override
  final double height;
  @override
  final TransformationController transformationController;
  @override
  final double translateX;
  @override
  final double translateY;

  @override
  String toString() {
    return 'GridDisplayState.loaded(scaleFactor: $scaleFactor, width: $width, height: $height, transformationController: $transformationController, translateX: $translateX, translateY: $translateY)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loaded &&
            (identical(other.scaleFactor, scaleFactor) ||
                other.scaleFactor == scaleFactor) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(
                    other.transformationController, transformationController) ||
                other.transformationController == transformationController) &&
            (identical(other.translateX, translateX) ||
                other.translateX == translateX) &&
            (identical(other.translateY, translateY) ||
                other.translateY == translateY));
  }

  @override
  int get hashCode => Object.hash(runtimeType, scaleFactor, width, height,
      transformationController, translateX, translateY);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      __$$_LoadedCopyWithImpl<_$_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double scaleFactor,
            TransformationController transformationController,
            double translateX,
            double translateY)
        initial,
    required TResult Function(
            double scaleFactor,
            double width,
            double height,
            TransformationController transformationController,
            double translateX,
            double translateY)
        loaded,
    required TResult Function(
            double scaleFactor,
            double width,
            double height,
            TransformationController transformationController,
            double translateX,
            double translateY)
        selectedMoving,
  }) {
    return loaded(scaleFactor, width, height, transformationController,
        translateX, translateY);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            double scaleFactor,
            TransformationController transformationController,
            double translateX,
            double translateY)?
        initial,
    TResult? Function(
            double scaleFactor,
            double width,
            double height,
            TransformationController transformationController,
            double translateX,
            double translateY)?
        loaded,
    TResult? Function(
            double scaleFactor,
            double width,
            double height,
            TransformationController transformationController,
            double translateX,
            double translateY)?
        selectedMoving,
  }) {
    return loaded?.call(scaleFactor, width, height, transformationController,
        translateX, translateY);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            double scaleFactor,
            TransformationController transformationController,
            double translateX,
            double translateY)?
        initial,
    TResult Function(
            double scaleFactor,
            double width,
            double height,
            TransformationController transformationController,
            double translateX,
            double translateY)?
        loaded,
    TResult Function(
            double scaleFactor,
            double width,
            double height,
            TransformationController transformationController,
            double translateX,
            double translateY)?
        selectedMoving,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(scaleFactor, width, height, transformationController,
          translateX, translateY);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_SelectedMoving value) selectedMoving,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_SelectedMoving value)? selectedMoving,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_SelectedMoving value)? selectedMoving,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements GridDisplayState {
  const factory _Loaded(
      {required final double scaleFactor,
      required final double width,
      required final double height,
      required final TransformationController transformationController,
      required final double translateX,
      required final double translateY}) = _$_Loaded;

  @override
  double get scaleFactor;
  double get width;
  double get height;
  @override
  TransformationController get transformationController;
  @override
  double get translateX;
  @override
  double get translateY;
  @override
  @JsonKey(ignore: true)
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SelectedMovingCopyWith<$Res>
    implements $GridDisplayStateCopyWith<$Res> {
  factory _$$_SelectedMovingCopyWith(
          _$_SelectedMoving value, $Res Function(_$_SelectedMoving) then) =
      __$$_SelectedMovingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double scaleFactor,
      double width,
      double height,
      TransformationController transformationController,
      double translateX,
      double translateY});
}

/// @nodoc
class __$$_SelectedMovingCopyWithImpl<$Res>
    extends _$GridDisplayStateCopyWithImpl<$Res, _$_SelectedMoving>
    implements _$$_SelectedMovingCopyWith<$Res> {
  __$$_SelectedMovingCopyWithImpl(
      _$_SelectedMoving _value, $Res Function(_$_SelectedMoving) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scaleFactor = null,
    Object? width = null,
    Object? height = null,
    Object? transformationController = null,
    Object? translateX = null,
    Object? translateY = null,
  }) {
    return _then(_$_SelectedMoving(
      scaleFactor: null == scaleFactor
          ? _value.scaleFactor
          : scaleFactor // ignore: cast_nullable_to_non_nullable
              as double,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      transformationController: null == transformationController
          ? _value.transformationController
          : transformationController // ignore: cast_nullable_to_non_nullable
              as TransformationController,
      translateX: null == translateX
          ? _value.translateX
          : translateX // ignore: cast_nullable_to_non_nullable
              as double,
      translateY: null == translateY
          ? _value.translateY
          : translateY // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_SelectedMoving implements _SelectedMoving {
  const _$_SelectedMoving(
      {required this.scaleFactor,
      required this.width,
      required this.height,
      required this.transformationController,
      required this.translateX,
      required this.translateY});

  @override
  final double scaleFactor;
  @override
  final double width;
  @override
  final double height;
  @override
  final TransformationController transformationController;
  @override
  final double translateX;
  @override
  final double translateY;

  @override
  String toString() {
    return 'GridDisplayState.selectedMoving(scaleFactor: $scaleFactor, width: $width, height: $height, transformationController: $transformationController, translateX: $translateX, translateY: $translateY)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SelectedMoving &&
            (identical(other.scaleFactor, scaleFactor) ||
                other.scaleFactor == scaleFactor) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(
                    other.transformationController, transformationController) ||
                other.transformationController == transformationController) &&
            (identical(other.translateX, translateX) ||
                other.translateX == translateX) &&
            (identical(other.translateY, translateY) ||
                other.translateY == translateY));
  }

  @override
  int get hashCode => Object.hash(runtimeType, scaleFactor, width, height,
      transformationController, translateX, translateY);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SelectedMovingCopyWith<_$_SelectedMoving> get copyWith =>
      __$$_SelectedMovingCopyWithImpl<_$_SelectedMoving>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double scaleFactor,
            TransformationController transformationController,
            double translateX,
            double translateY)
        initial,
    required TResult Function(
            double scaleFactor,
            double width,
            double height,
            TransformationController transformationController,
            double translateX,
            double translateY)
        loaded,
    required TResult Function(
            double scaleFactor,
            double width,
            double height,
            TransformationController transformationController,
            double translateX,
            double translateY)
        selectedMoving,
  }) {
    return selectedMoving(scaleFactor, width, height, transformationController,
        translateX, translateY);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            double scaleFactor,
            TransformationController transformationController,
            double translateX,
            double translateY)?
        initial,
    TResult? Function(
            double scaleFactor,
            double width,
            double height,
            TransformationController transformationController,
            double translateX,
            double translateY)?
        loaded,
    TResult? Function(
            double scaleFactor,
            double width,
            double height,
            TransformationController transformationController,
            double translateX,
            double translateY)?
        selectedMoving,
  }) {
    return selectedMoving?.call(scaleFactor, width, height,
        transformationController, translateX, translateY);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            double scaleFactor,
            TransformationController transformationController,
            double translateX,
            double translateY)?
        initial,
    TResult Function(
            double scaleFactor,
            double width,
            double height,
            TransformationController transformationController,
            double translateX,
            double translateY)?
        loaded,
    TResult Function(
            double scaleFactor,
            double width,
            double height,
            TransformationController transformationController,
            double translateX,
            double translateY)?
        selectedMoving,
    required TResult orElse(),
  }) {
    if (selectedMoving != null) {
      return selectedMoving(scaleFactor, width, height,
          transformationController, translateX, translateY);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_SelectedMoving value) selectedMoving,
  }) {
    return selectedMoving(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_SelectedMoving value)? selectedMoving,
  }) {
    return selectedMoving?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_SelectedMoving value)? selectedMoving,
    required TResult orElse(),
  }) {
    if (selectedMoving != null) {
      return selectedMoving(this);
    }
    return orElse();
  }
}

abstract class _SelectedMoving implements GridDisplayState {
  const factory _SelectedMoving(
      {required final double scaleFactor,
      required final double width,
      required final double height,
      required final TransformationController transformationController,
      required final double translateX,
      required final double translateY}) = _$_SelectedMoving;

  @override
  double get scaleFactor;
  double get width;
  double get height;
  @override
  TransformationController get transformationController;
  @override
  double get translateX;
  @override
  double get translateY;
  @override
  @JsonKey(ignore: true)
  _$$_SelectedMovingCopyWith<_$_SelectedMoving> get copyWith =>
      throw _privateConstructorUsedError;
}
