// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'diary_cell_edit_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DiaryCellEditState {
  DiaryList get diaryList => throw _privateConstructorUsedError;
  DiaryCell get diaryCell => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DiaryList diaryList, DiaryCell diaryCell)
        cellSelected,
    required TResult Function(DiaryList diaryList, DiaryCell diaryCell) editing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DiaryList diaryList, DiaryCell diaryCell)? cellSelected,
    TResult? Function(DiaryList diaryList, DiaryCell diaryCell)? editing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DiaryList diaryList, DiaryCell diaryCell)? cellSelected,
    TResult Function(DiaryList diaryList, DiaryCell diaryCell)? editing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CellSelectedState value) cellSelected,
    required TResult Function(_CellEditingState value) editing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CellSelectedState value)? cellSelected,
    TResult? Function(_CellEditingState value)? editing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CellSelectedState value)? cellSelected,
    TResult Function(_CellEditingState value)? editing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DiaryCellEditStateCopyWith<DiaryCellEditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiaryCellEditStateCopyWith<$Res> {
  factory $DiaryCellEditStateCopyWith(
          DiaryCellEditState value, $Res Function(DiaryCellEditState) then) =
      _$DiaryCellEditStateCopyWithImpl<$Res, DiaryCellEditState>;
  @useResult
  $Res call({DiaryList diaryList, DiaryCell diaryCell});
}

/// @nodoc
class _$DiaryCellEditStateCopyWithImpl<$Res, $Val extends DiaryCellEditState>
    implements $DiaryCellEditStateCopyWith<$Res> {
  _$DiaryCellEditStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diaryList = null,
    Object? diaryCell = null,
  }) {
    return _then(_value.copyWith(
      diaryList: null == diaryList
          ? _value.diaryList
          : diaryList // ignore: cast_nullable_to_non_nullable
              as DiaryList,
      diaryCell: null == diaryCell
          ? _value.diaryCell
          : diaryCell // ignore: cast_nullable_to_non_nullable
              as DiaryCell,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CellSelectedStateCopyWith<$Res>
    implements $DiaryCellEditStateCopyWith<$Res> {
  factory _$$_CellSelectedStateCopyWith(_$_CellSelectedState value,
          $Res Function(_$_CellSelectedState) then) =
      __$$_CellSelectedStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DiaryList diaryList, DiaryCell diaryCell});
}

/// @nodoc
class __$$_CellSelectedStateCopyWithImpl<$Res>
    extends _$DiaryCellEditStateCopyWithImpl<$Res, _$_CellSelectedState>
    implements _$$_CellSelectedStateCopyWith<$Res> {
  __$$_CellSelectedStateCopyWithImpl(
      _$_CellSelectedState _value, $Res Function(_$_CellSelectedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diaryList = null,
    Object? diaryCell = null,
  }) {
    return _then(_$_CellSelectedState(
      diaryList: null == diaryList
          ? _value.diaryList
          : diaryList // ignore: cast_nullable_to_non_nullable
              as DiaryList,
      diaryCell: null == diaryCell
          ? _value.diaryCell
          : diaryCell // ignore: cast_nullable_to_non_nullable
              as DiaryCell,
    ));
  }
}

/// @nodoc

class _$_CellSelectedState implements _CellSelectedState {
  const _$_CellSelectedState(
      {required this.diaryList, required this.diaryCell});

  @override
  final DiaryList diaryList;
  @override
  final DiaryCell diaryCell;

  @override
  String toString() {
    return 'DiaryCellEditState.cellSelected(diaryList: $diaryList, diaryCell: $diaryCell)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CellSelectedState &&
            (identical(other.diaryList, diaryList) ||
                other.diaryList == diaryList) &&
            (identical(other.diaryCell, diaryCell) ||
                other.diaryCell == diaryCell));
  }

  @override
  int get hashCode => Object.hash(runtimeType, diaryList, diaryCell);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CellSelectedStateCopyWith<_$_CellSelectedState> get copyWith =>
      __$$_CellSelectedStateCopyWithImpl<_$_CellSelectedState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DiaryList diaryList, DiaryCell diaryCell)
        cellSelected,
    required TResult Function(DiaryList diaryList, DiaryCell diaryCell) editing,
  }) {
    return cellSelected(diaryList, diaryCell);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DiaryList diaryList, DiaryCell diaryCell)? cellSelected,
    TResult? Function(DiaryList diaryList, DiaryCell diaryCell)? editing,
  }) {
    return cellSelected?.call(diaryList, diaryCell);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DiaryList diaryList, DiaryCell diaryCell)? cellSelected,
    TResult Function(DiaryList diaryList, DiaryCell diaryCell)? editing,
    required TResult orElse(),
  }) {
    if (cellSelected != null) {
      return cellSelected(diaryList, diaryCell);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CellSelectedState value) cellSelected,
    required TResult Function(_CellEditingState value) editing,
  }) {
    return cellSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CellSelectedState value)? cellSelected,
    TResult? Function(_CellEditingState value)? editing,
  }) {
    return cellSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CellSelectedState value)? cellSelected,
    TResult Function(_CellEditingState value)? editing,
    required TResult orElse(),
  }) {
    if (cellSelected != null) {
      return cellSelected(this);
    }
    return orElse();
  }
}

abstract class _CellSelectedState implements DiaryCellEditState {
  const factory _CellSelectedState(
      {required final DiaryList diaryList,
      required final DiaryCell diaryCell}) = _$_CellSelectedState;

  @override
  DiaryList get diaryList;
  @override
  DiaryCell get diaryCell;
  @override
  @JsonKey(ignore: true)
  _$$_CellSelectedStateCopyWith<_$_CellSelectedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CellEditingStateCopyWith<$Res>
    implements $DiaryCellEditStateCopyWith<$Res> {
  factory _$$_CellEditingStateCopyWith(
          _$_CellEditingState value, $Res Function(_$_CellEditingState) then) =
      __$$_CellEditingStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DiaryList diaryList, DiaryCell diaryCell});
}

/// @nodoc
class __$$_CellEditingStateCopyWithImpl<$Res>
    extends _$DiaryCellEditStateCopyWithImpl<$Res, _$_CellEditingState>
    implements _$$_CellEditingStateCopyWith<$Res> {
  __$$_CellEditingStateCopyWithImpl(
      _$_CellEditingState _value, $Res Function(_$_CellEditingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diaryList = null,
    Object? diaryCell = null,
  }) {
    return _then(_$_CellEditingState(
      diaryList: null == diaryList
          ? _value.diaryList
          : diaryList // ignore: cast_nullable_to_non_nullable
              as DiaryList,
      diaryCell: null == diaryCell
          ? _value.diaryCell
          : diaryCell // ignore: cast_nullable_to_non_nullable
              as DiaryCell,
    ));
  }
}

/// @nodoc

class _$_CellEditingState implements _CellEditingState {
  const _$_CellEditingState({required this.diaryList, required this.diaryCell});

  @override
  final DiaryList diaryList;
  @override
  final DiaryCell diaryCell;

  @override
  String toString() {
    return 'DiaryCellEditState.editing(diaryList: $diaryList, diaryCell: $diaryCell)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CellEditingState &&
            (identical(other.diaryList, diaryList) ||
                other.diaryList == diaryList) &&
            (identical(other.diaryCell, diaryCell) ||
                other.diaryCell == diaryCell));
  }

  @override
  int get hashCode => Object.hash(runtimeType, diaryList, diaryCell);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CellEditingStateCopyWith<_$_CellEditingState> get copyWith =>
      __$$_CellEditingStateCopyWithImpl<_$_CellEditingState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DiaryList diaryList, DiaryCell diaryCell)
        cellSelected,
    required TResult Function(DiaryList diaryList, DiaryCell diaryCell) editing,
  }) {
    return editing(diaryList, diaryCell);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DiaryList diaryList, DiaryCell diaryCell)? cellSelected,
    TResult? Function(DiaryList diaryList, DiaryCell diaryCell)? editing,
  }) {
    return editing?.call(diaryList, diaryCell);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DiaryList diaryList, DiaryCell diaryCell)? cellSelected,
    TResult Function(DiaryList diaryList, DiaryCell diaryCell)? editing,
    required TResult orElse(),
  }) {
    if (editing != null) {
      return editing(diaryList, diaryCell);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CellSelectedState value) cellSelected,
    required TResult Function(_CellEditingState value) editing,
  }) {
    return editing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CellSelectedState value)? cellSelected,
    TResult? Function(_CellEditingState value)? editing,
  }) {
    return editing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CellSelectedState value)? cellSelected,
    TResult Function(_CellEditingState value)? editing,
    required TResult orElse(),
  }) {
    if (editing != null) {
      return editing(this);
    }
    return orElse();
  }
}

abstract class _CellEditingState implements DiaryCellEditState {
  const factory _CellEditingState(
      {required final DiaryList diaryList,
      required final DiaryCell diaryCell}) = _$_CellEditingState;

  @override
  DiaryList get diaryList;
  @override
  DiaryCell get diaryCell;
  @override
  @JsonKey(ignore: true)
  _$$_CellEditingStateCopyWith<_$_CellEditingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DiaryCellEditEvent {
  DiaryList get diaryList => throw _privateConstructorUsedError;
  DiaryCell get diaryCell => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DiaryList diaryList, DiaryCell diaryCell)
        editCell,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DiaryList diaryList, DiaryCell diaryCell)? editCell,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DiaryList diaryList, DiaryCell diaryCell)? editCell,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditCellEvent value) editCell,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditCellEvent value)? editCell,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditCellEvent value)? editCell,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DiaryCellEditEventCopyWith<DiaryCellEditEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiaryCellEditEventCopyWith<$Res> {
  factory $DiaryCellEditEventCopyWith(
          DiaryCellEditEvent value, $Res Function(DiaryCellEditEvent) then) =
      _$DiaryCellEditEventCopyWithImpl<$Res, DiaryCellEditEvent>;
  @useResult
  $Res call({DiaryList diaryList, DiaryCell diaryCell});
}

/// @nodoc
class _$DiaryCellEditEventCopyWithImpl<$Res, $Val extends DiaryCellEditEvent>
    implements $DiaryCellEditEventCopyWith<$Res> {
  _$DiaryCellEditEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diaryList = null,
    Object? diaryCell = null,
  }) {
    return _then(_value.copyWith(
      diaryList: null == diaryList
          ? _value.diaryList
          : diaryList // ignore: cast_nullable_to_non_nullable
              as DiaryList,
      diaryCell: null == diaryCell
          ? _value.diaryCell
          : diaryCell // ignore: cast_nullable_to_non_nullable
              as DiaryCell,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditCellEventCopyWith<$Res>
    implements $DiaryCellEditEventCopyWith<$Res> {
  factory _$$EditCellEventCopyWith(
          _$EditCellEvent value, $Res Function(_$EditCellEvent) then) =
      __$$EditCellEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DiaryList diaryList, DiaryCell diaryCell});
}

/// @nodoc
class __$$EditCellEventCopyWithImpl<$Res>
    extends _$DiaryCellEditEventCopyWithImpl<$Res, _$EditCellEvent>
    implements _$$EditCellEventCopyWith<$Res> {
  __$$EditCellEventCopyWithImpl(
      _$EditCellEvent _value, $Res Function(_$EditCellEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diaryList = null,
    Object? diaryCell = null,
  }) {
    return _then(_$EditCellEvent(
      diaryList: null == diaryList
          ? _value.diaryList
          : diaryList // ignore: cast_nullable_to_non_nullable
              as DiaryList,
      diaryCell: null == diaryCell
          ? _value.diaryCell
          : diaryCell // ignore: cast_nullable_to_non_nullable
              as DiaryCell,
    ));
  }
}

/// @nodoc

class _$EditCellEvent implements EditCellEvent {
  const _$EditCellEvent({required this.diaryList, required this.diaryCell});

  @override
  final DiaryList diaryList;
  @override
  final DiaryCell diaryCell;

  @override
  String toString() {
    return 'DiaryCellEditEvent.editCell(diaryList: $diaryList, diaryCell: $diaryCell)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditCellEvent &&
            (identical(other.diaryList, diaryList) ||
                other.diaryList == diaryList) &&
            (identical(other.diaryCell, diaryCell) ||
                other.diaryCell == diaryCell));
  }

  @override
  int get hashCode => Object.hash(runtimeType, diaryList, diaryCell);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditCellEventCopyWith<_$EditCellEvent> get copyWith =>
      __$$EditCellEventCopyWithImpl<_$EditCellEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DiaryList diaryList, DiaryCell diaryCell)
        editCell,
  }) {
    return editCell(diaryList, diaryCell);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DiaryList diaryList, DiaryCell diaryCell)? editCell,
  }) {
    return editCell?.call(diaryList, diaryCell);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DiaryList diaryList, DiaryCell diaryCell)? editCell,
    required TResult orElse(),
  }) {
    if (editCell != null) {
      return editCell(diaryList, diaryCell);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditCellEvent value) editCell,
  }) {
    return editCell(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditCellEvent value)? editCell,
  }) {
    return editCell?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditCellEvent value)? editCell,
    required TResult orElse(),
  }) {
    if (editCell != null) {
      return editCell(this);
    }
    return orElse();
  }
}

abstract class EditCellEvent implements DiaryCellEditEvent {
  const factory EditCellEvent(
      {required final DiaryList diaryList,
      required final DiaryCell diaryCell}) = _$EditCellEvent;

  @override
  DiaryList get diaryList;
  @override
  DiaryCell get diaryCell;
  @override
  @JsonKey(ignore: true)
  _$$EditCellEventCopyWith<_$EditCellEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
