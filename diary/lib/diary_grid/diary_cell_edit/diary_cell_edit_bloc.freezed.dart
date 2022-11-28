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
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(DiaryCell diaryCell) cellSelected,
    required TResult Function(DiaryCell diaryCell) editing,
    required TResult Function(List<DiaryCell> diaryCells) cellsSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(DiaryCell diaryCell)? cellSelected,
    TResult? Function(DiaryCell diaryCell)? editing,
    TResult? Function(List<DiaryCell> diaryCells)? cellsSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DiaryCell diaryCell)? cellSelected,
    TResult Function(DiaryCell diaryCell)? editing,
    TResult Function(List<DiaryCell> diaryCells)? cellsSelected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CellSelectedState value) cellSelected,
    required TResult Function(_CellEditingState value) editing,
    required TResult Function(_CellsSelectedState value) cellsSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CellSelectedState value)? cellSelected,
    TResult? Function(_CellEditingState value)? editing,
    TResult? Function(_CellsSelectedState value)? cellsSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CellSelectedState value)? cellSelected,
    TResult Function(_CellEditingState value)? editing,
    TResult Function(_CellsSelectedState value)? cellsSelected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiaryCellEditStateCopyWith<$Res> {
  factory $DiaryCellEditStateCopyWith(
          DiaryCellEditState value, $Res Function(DiaryCellEditState) then) =
      _$DiaryCellEditStateCopyWithImpl<$Res, DiaryCellEditState>;
}

/// @nodoc
class _$DiaryCellEditStateCopyWithImpl<$Res, $Val extends DiaryCellEditState>
    implements $DiaryCellEditStateCopyWith<$Res> {
  _$DiaryCellEditStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$DiaryCellEditStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'DiaryCellEditState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(DiaryCell diaryCell) cellSelected,
    required TResult Function(DiaryCell diaryCell) editing,
    required TResult Function(List<DiaryCell> diaryCells) cellsSelected,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(DiaryCell diaryCell)? cellSelected,
    TResult? Function(DiaryCell diaryCell)? editing,
    TResult? Function(List<DiaryCell> diaryCells)? cellsSelected,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DiaryCell diaryCell)? cellSelected,
    TResult Function(DiaryCell diaryCell)? editing,
    TResult Function(List<DiaryCell> diaryCells)? cellsSelected,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CellSelectedState value) cellSelected,
    required TResult Function(_CellEditingState value) editing,
    required TResult Function(_CellsSelectedState value) cellsSelected,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CellSelectedState value)? cellSelected,
    TResult? Function(_CellEditingState value)? editing,
    TResult? Function(_CellsSelectedState value)? cellsSelected,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CellSelectedState value)? cellSelected,
    TResult Function(_CellEditingState value)? editing,
    TResult Function(_CellsSelectedState value)? cellsSelected,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements DiaryCellEditState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_CellSelectedStateCopyWith<$Res> {
  factory _$$_CellSelectedStateCopyWith(_$_CellSelectedState value,
          $Res Function(_$_CellSelectedState) then) =
      __$$_CellSelectedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({DiaryCell diaryCell});
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
    Object? diaryCell = null,
  }) {
    return _then(_$_CellSelectedState(
      diaryCell: null == diaryCell
          ? _value.diaryCell
          : diaryCell // ignore: cast_nullable_to_non_nullable
              as DiaryCell,
    ));
  }
}

/// @nodoc

class _$_CellSelectedState implements _CellSelectedState {
  const _$_CellSelectedState({required this.diaryCell});

  @override
  final DiaryCell diaryCell;

  @override
  String toString() {
    return 'DiaryCellEditState.cellSelected(diaryCell: $diaryCell)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CellSelectedState &&
            (identical(other.diaryCell, diaryCell) ||
                other.diaryCell == diaryCell));
  }

  @override
  int get hashCode => Object.hash(runtimeType, diaryCell);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CellSelectedStateCopyWith<_$_CellSelectedState> get copyWith =>
      __$$_CellSelectedStateCopyWithImpl<_$_CellSelectedState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(DiaryCell diaryCell) cellSelected,
    required TResult Function(DiaryCell diaryCell) editing,
    required TResult Function(List<DiaryCell> diaryCells) cellsSelected,
  }) {
    return cellSelected(diaryCell);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(DiaryCell diaryCell)? cellSelected,
    TResult? Function(DiaryCell diaryCell)? editing,
    TResult? Function(List<DiaryCell> diaryCells)? cellsSelected,
  }) {
    return cellSelected?.call(diaryCell);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DiaryCell diaryCell)? cellSelected,
    TResult Function(DiaryCell diaryCell)? editing,
    TResult Function(List<DiaryCell> diaryCells)? cellsSelected,
    required TResult orElse(),
  }) {
    if (cellSelected != null) {
      return cellSelected(diaryCell);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CellSelectedState value) cellSelected,
    required TResult Function(_CellEditingState value) editing,
    required TResult Function(_CellsSelectedState value) cellsSelected,
  }) {
    return cellSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CellSelectedState value)? cellSelected,
    TResult? Function(_CellEditingState value)? editing,
    TResult? Function(_CellsSelectedState value)? cellsSelected,
  }) {
    return cellSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CellSelectedState value)? cellSelected,
    TResult Function(_CellEditingState value)? editing,
    TResult Function(_CellsSelectedState value)? cellsSelected,
    required TResult orElse(),
  }) {
    if (cellSelected != null) {
      return cellSelected(this);
    }
    return orElse();
  }
}

abstract class _CellSelectedState implements DiaryCellEditState {
  const factory _CellSelectedState({required final DiaryCell diaryCell}) =
      _$_CellSelectedState;

  DiaryCell get diaryCell;
  @JsonKey(ignore: true)
  _$$_CellSelectedStateCopyWith<_$_CellSelectedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CellEditingStateCopyWith<$Res> {
  factory _$$_CellEditingStateCopyWith(
          _$_CellEditingState value, $Res Function(_$_CellEditingState) then) =
      __$$_CellEditingStateCopyWithImpl<$Res>;
  @useResult
  $Res call({DiaryCell diaryCell});
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
    Object? diaryCell = null,
  }) {
    return _then(_$_CellEditingState(
      diaryCell: null == diaryCell
          ? _value.diaryCell
          : diaryCell // ignore: cast_nullable_to_non_nullable
              as DiaryCell,
    ));
  }
}

/// @nodoc

class _$_CellEditingState implements _CellEditingState {
  const _$_CellEditingState({required this.diaryCell});

  @override
  final DiaryCell diaryCell;

  @override
  String toString() {
    return 'DiaryCellEditState.editing(diaryCell: $diaryCell)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CellEditingState &&
            (identical(other.diaryCell, diaryCell) ||
                other.diaryCell == diaryCell));
  }

  @override
  int get hashCode => Object.hash(runtimeType, diaryCell);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CellEditingStateCopyWith<_$_CellEditingState> get copyWith =>
      __$$_CellEditingStateCopyWithImpl<_$_CellEditingState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(DiaryCell diaryCell) cellSelected,
    required TResult Function(DiaryCell diaryCell) editing,
    required TResult Function(List<DiaryCell> diaryCells) cellsSelected,
  }) {
    return editing(diaryCell);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(DiaryCell diaryCell)? cellSelected,
    TResult? Function(DiaryCell diaryCell)? editing,
    TResult? Function(List<DiaryCell> diaryCells)? cellsSelected,
  }) {
    return editing?.call(diaryCell);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DiaryCell diaryCell)? cellSelected,
    TResult Function(DiaryCell diaryCell)? editing,
    TResult Function(List<DiaryCell> diaryCells)? cellsSelected,
    required TResult orElse(),
  }) {
    if (editing != null) {
      return editing(diaryCell);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CellSelectedState value) cellSelected,
    required TResult Function(_CellEditingState value) editing,
    required TResult Function(_CellsSelectedState value) cellsSelected,
  }) {
    return editing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CellSelectedState value)? cellSelected,
    TResult? Function(_CellEditingState value)? editing,
    TResult? Function(_CellsSelectedState value)? cellsSelected,
  }) {
    return editing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CellSelectedState value)? cellSelected,
    TResult Function(_CellEditingState value)? editing,
    TResult Function(_CellsSelectedState value)? cellsSelected,
    required TResult orElse(),
  }) {
    if (editing != null) {
      return editing(this);
    }
    return orElse();
  }
}

abstract class _CellEditingState implements DiaryCellEditState {
  const factory _CellEditingState({required final DiaryCell diaryCell}) =
      _$_CellEditingState;

  DiaryCell get diaryCell;
  @JsonKey(ignore: true)
  _$$_CellEditingStateCopyWith<_$_CellEditingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CellsSelectedStateCopyWith<$Res> {
  factory _$$_CellsSelectedStateCopyWith(_$_CellsSelectedState value,
          $Res Function(_$_CellsSelectedState) then) =
      __$$_CellsSelectedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<DiaryCell> diaryCells});
}

/// @nodoc
class __$$_CellsSelectedStateCopyWithImpl<$Res>
    extends _$DiaryCellEditStateCopyWithImpl<$Res, _$_CellsSelectedState>
    implements _$$_CellsSelectedStateCopyWith<$Res> {
  __$$_CellsSelectedStateCopyWithImpl(
      _$_CellsSelectedState _value, $Res Function(_$_CellsSelectedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diaryCells = null,
  }) {
    return _then(_$_CellsSelectedState(
      diaryCells: null == diaryCells
          ? _value._diaryCells
          : diaryCells // ignore: cast_nullable_to_non_nullable
              as List<DiaryCell>,
    ));
  }
}

/// @nodoc

class _$_CellsSelectedState implements _CellsSelectedState {
  const _$_CellsSelectedState({required final List<DiaryCell> diaryCells})
      : _diaryCells = diaryCells;

  final List<DiaryCell> _diaryCells;
  @override
  List<DiaryCell> get diaryCells {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_diaryCells);
  }

  @override
  String toString() {
    return 'DiaryCellEditState.cellsSelected(diaryCells: $diaryCells)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CellsSelectedState &&
            const DeepCollectionEquality()
                .equals(other._diaryCells, _diaryCells));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_diaryCells));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CellsSelectedStateCopyWith<_$_CellsSelectedState> get copyWith =>
      __$$_CellsSelectedStateCopyWithImpl<_$_CellsSelectedState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(DiaryCell diaryCell) cellSelected,
    required TResult Function(DiaryCell diaryCell) editing,
    required TResult Function(List<DiaryCell> diaryCells) cellsSelected,
  }) {
    return cellsSelected(diaryCells);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(DiaryCell diaryCell)? cellSelected,
    TResult? Function(DiaryCell diaryCell)? editing,
    TResult? Function(List<DiaryCell> diaryCells)? cellsSelected,
  }) {
    return cellsSelected?.call(diaryCells);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DiaryCell diaryCell)? cellSelected,
    TResult Function(DiaryCell diaryCell)? editing,
    TResult Function(List<DiaryCell> diaryCells)? cellsSelected,
    required TResult orElse(),
  }) {
    if (cellsSelected != null) {
      return cellsSelected(diaryCells);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CellSelectedState value) cellSelected,
    required TResult Function(_CellEditingState value) editing,
    required TResult Function(_CellsSelectedState value) cellsSelected,
  }) {
    return cellsSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CellSelectedState value)? cellSelected,
    TResult? Function(_CellEditingState value)? editing,
    TResult? Function(_CellsSelectedState value)? cellsSelected,
  }) {
    return cellsSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CellSelectedState value)? cellSelected,
    TResult Function(_CellEditingState value)? editing,
    TResult Function(_CellsSelectedState value)? cellsSelected,
    required TResult orElse(),
  }) {
    if (cellsSelected != null) {
      return cellsSelected(this);
    }
    return orElse();
  }
}

abstract class _CellsSelectedState implements DiaryCellEditState {
  const factory _CellsSelectedState(
      {required final List<DiaryCell> diaryCells}) = _$_CellsSelectedState;

  List<DiaryCell> get diaryCells;
  @JsonKey(ignore: true)
  _$$_CellsSelectedStateCopyWith<_$_CellsSelectedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DiaryCellEditEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DiaryCell diaryCell) selectCell,
    required TResult Function(
            DiaryCell diaryCell, DataTypesEnum dataType, dynamic content)
        editCell,
    required TResult Function(DiaryCell diaryCell) copyCell,
    required TResult Function(List<DiaryCell> diaryCells) selectCells,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DiaryCell diaryCell)? selectCell,
    TResult? Function(
            DiaryCell diaryCell, DataTypesEnum dataType, dynamic content)?
        editCell,
    TResult? Function(DiaryCell diaryCell)? copyCell,
    TResult? Function(List<DiaryCell> diaryCells)? selectCells,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DiaryCell diaryCell)? selectCell,
    TResult Function(
            DiaryCell diaryCell, DataTypesEnum dataType, dynamic content)?
        editCell,
    TResult Function(DiaryCell diaryCell)? copyCell,
    TResult Function(List<DiaryCell> diaryCells)? selectCells,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectCellEvent value) selectCell,
    required TResult Function(EditCellEvent value) editCell,
    required TResult Function(CopyCellEvent value) copyCell,
    required TResult Function(SelectCellsEvent value) selectCells,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectCellEvent value)? selectCell,
    TResult? Function(EditCellEvent value)? editCell,
    TResult? Function(CopyCellEvent value)? copyCell,
    TResult? Function(SelectCellsEvent value)? selectCells,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectCellEvent value)? selectCell,
    TResult Function(EditCellEvent value)? editCell,
    TResult Function(CopyCellEvent value)? copyCell,
    TResult Function(SelectCellsEvent value)? selectCells,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiaryCellEditEventCopyWith<$Res> {
  factory $DiaryCellEditEventCopyWith(
          DiaryCellEditEvent value, $Res Function(DiaryCellEditEvent) then) =
      _$DiaryCellEditEventCopyWithImpl<$Res, DiaryCellEditEvent>;
}

/// @nodoc
class _$DiaryCellEditEventCopyWithImpl<$Res, $Val extends DiaryCellEditEvent>
    implements $DiaryCellEditEventCopyWith<$Res> {
  _$DiaryCellEditEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SelectCellEventCopyWith<$Res> {
  factory _$$SelectCellEventCopyWith(
          _$SelectCellEvent value, $Res Function(_$SelectCellEvent) then) =
      __$$SelectCellEventCopyWithImpl<$Res>;
  @useResult
  $Res call({DiaryCell diaryCell});
}

/// @nodoc
class __$$SelectCellEventCopyWithImpl<$Res>
    extends _$DiaryCellEditEventCopyWithImpl<$Res, _$SelectCellEvent>
    implements _$$SelectCellEventCopyWith<$Res> {
  __$$SelectCellEventCopyWithImpl(
      _$SelectCellEvent _value, $Res Function(_$SelectCellEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diaryCell = null,
  }) {
    return _then(_$SelectCellEvent(
      diaryCell: null == diaryCell
          ? _value.diaryCell
          : diaryCell // ignore: cast_nullable_to_non_nullable
              as DiaryCell,
    ));
  }
}

/// @nodoc

class _$SelectCellEvent implements SelectCellEvent {
  const _$SelectCellEvent({required this.diaryCell});

  @override
  final DiaryCell diaryCell;

  @override
  String toString() {
    return 'DiaryCellEditEvent.selectCell(diaryCell: $diaryCell)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectCellEvent &&
            (identical(other.diaryCell, diaryCell) ||
                other.diaryCell == diaryCell));
  }

  @override
  int get hashCode => Object.hash(runtimeType, diaryCell);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectCellEventCopyWith<_$SelectCellEvent> get copyWith =>
      __$$SelectCellEventCopyWithImpl<_$SelectCellEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DiaryCell diaryCell) selectCell,
    required TResult Function(
            DiaryCell diaryCell, DataTypesEnum dataType, dynamic content)
        editCell,
    required TResult Function(DiaryCell diaryCell) copyCell,
    required TResult Function(List<DiaryCell> diaryCells) selectCells,
  }) {
    return selectCell(diaryCell);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DiaryCell diaryCell)? selectCell,
    TResult? Function(
            DiaryCell diaryCell, DataTypesEnum dataType, dynamic content)?
        editCell,
    TResult? Function(DiaryCell diaryCell)? copyCell,
    TResult? Function(List<DiaryCell> diaryCells)? selectCells,
  }) {
    return selectCell?.call(diaryCell);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DiaryCell diaryCell)? selectCell,
    TResult Function(
            DiaryCell diaryCell, DataTypesEnum dataType, dynamic content)?
        editCell,
    TResult Function(DiaryCell diaryCell)? copyCell,
    TResult Function(List<DiaryCell> diaryCells)? selectCells,
    required TResult orElse(),
  }) {
    if (selectCell != null) {
      return selectCell(diaryCell);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectCellEvent value) selectCell,
    required TResult Function(EditCellEvent value) editCell,
    required TResult Function(CopyCellEvent value) copyCell,
    required TResult Function(SelectCellsEvent value) selectCells,
  }) {
    return selectCell(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectCellEvent value)? selectCell,
    TResult? Function(EditCellEvent value)? editCell,
    TResult? Function(CopyCellEvent value)? copyCell,
    TResult? Function(SelectCellsEvent value)? selectCells,
  }) {
    return selectCell?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectCellEvent value)? selectCell,
    TResult Function(EditCellEvent value)? editCell,
    TResult Function(CopyCellEvent value)? copyCell,
    TResult Function(SelectCellsEvent value)? selectCells,
    required TResult orElse(),
  }) {
    if (selectCell != null) {
      return selectCell(this);
    }
    return orElse();
  }
}

abstract class SelectCellEvent implements DiaryCellEditEvent {
  const factory SelectCellEvent({required final DiaryCell diaryCell}) =
      _$SelectCellEvent;

  DiaryCell get diaryCell;
  @JsonKey(ignore: true)
  _$$SelectCellEventCopyWith<_$SelectCellEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditCellEventCopyWith<$Res> {
  factory _$$EditCellEventCopyWith(
          _$EditCellEvent value, $Res Function(_$EditCellEvent) then) =
      __$$EditCellEventCopyWithImpl<$Res>;
  @useResult
  $Res call({DiaryCell diaryCell, DataTypesEnum dataType, dynamic content});
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
    Object? diaryCell = null,
    Object? dataType = null,
    Object? content = null,
  }) {
    return _then(_$EditCellEvent(
      diaryCell: null == diaryCell
          ? _value.diaryCell
          : diaryCell // ignore: cast_nullable_to_non_nullable
              as DiaryCell,
      dataType: null == dataType
          ? _value.dataType
          : dataType // ignore: cast_nullable_to_non_nullable
              as DataTypesEnum,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$EditCellEvent implements EditCellEvent {
  const _$EditCellEvent(
      {required this.diaryCell, required this.dataType, required this.content});

  @override
  final DiaryCell diaryCell;
  @override
  final DataTypesEnum dataType;
  @override
  final dynamic content;

  @override
  String toString() {
    return 'DiaryCellEditEvent.editCell(diaryCell: $diaryCell, dataType: $dataType, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditCellEvent &&
            (identical(other.diaryCell, diaryCell) ||
                other.diaryCell == diaryCell) &&
            (identical(other.dataType, dataType) ||
                other.dataType == dataType) &&
            const DeepCollectionEquality().equals(other.content, content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, diaryCell, dataType,
      const DeepCollectionEquality().hash(content));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditCellEventCopyWith<_$EditCellEvent> get copyWith =>
      __$$EditCellEventCopyWithImpl<_$EditCellEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DiaryCell diaryCell) selectCell,
    required TResult Function(
            DiaryCell diaryCell, DataTypesEnum dataType, dynamic content)
        editCell,
    required TResult Function(DiaryCell diaryCell) copyCell,
    required TResult Function(List<DiaryCell> diaryCells) selectCells,
  }) {
    return editCell(diaryCell, dataType, content);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DiaryCell diaryCell)? selectCell,
    TResult? Function(
            DiaryCell diaryCell, DataTypesEnum dataType, dynamic content)?
        editCell,
    TResult? Function(DiaryCell diaryCell)? copyCell,
    TResult? Function(List<DiaryCell> diaryCells)? selectCells,
  }) {
    return editCell?.call(diaryCell, dataType, content);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DiaryCell diaryCell)? selectCell,
    TResult Function(
            DiaryCell diaryCell, DataTypesEnum dataType, dynamic content)?
        editCell,
    TResult Function(DiaryCell diaryCell)? copyCell,
    TResult Function(List<DiaryCell> diaryCells)? selectCells,
    required TResult orElse(),
  }) {
    if (editCell != null) {
      return editCell(diaryCell, dataType, content);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectCellEvent value) selectCell,
    required TResult Function(EditCellEvent value) editCell,
    required TResult Function(CopyCellEvent value) copyCell,
    required TResult Function(SelectCellsEvent value) selectCells,
  }) {
    return editCell(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectCellEvent value)? selectCell,
    TResult? Function(EditCellEvent value)? editCell,
    TResult? Function(CopyCellEvent value)? copyCell,
    TResult? Function(SelectCellsEvent value)? selectCells,
  }) {
    return editCell?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectCellEvent value)? selectCell,
    TResult Function(EditCellEvent value)? editCell,
    TResult Function(CopyCellEvent value)? copyCell,
    TResult Function(SelectCellsEvent value)? selectCells,
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
      {required final DiaryCell diaryCell,
      required final DataTypesEnum dataType,
      required final dynamic content}) = _$EditCellEvent;

  DiaryCell get diaryCell;
  DataTypesEnum get dataType;
  dynamic get content;
  @JsonKey(ignore: true)
  _$$EditCellEventCopyWith<_$EditCellEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CopyCellEventCopyWith<$Res> {
  factory _$$CopyCellEventCopyWith(
          _$CopyCellEvent value, $Res Function(_$CopyCellEvent) then) =
      __$$CopyCellEventCopyWithImpl<$Res>;
  @useResult
  $Res call({DiaryCell diaryCell});
}

/// @nodoc
class __$$CopyCellEventCopyWithImpl<$Res>
    extends _$DiaryCellEditEventCopyWithImpl<$Res, _$CopyCellEvent>
    implements _$$CopyCellEventCopyWith<$Res> {
  __$$CopyCellEventCopyWithImpl(
      _$CopyCellEvent _value, $Res Function(_$CopyCellEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diaryCell = null,
  }) {
    return _then(_$CopyCellEvent(
      diaryCell: null == diaryCell
          ? _value.diaryCell
          : diaryCell // ignore: cast_nullable_to_non_nullable
              as DiaryCell,
    ));
  }
}

/// @nodoc

class _$CopyCellEvent implements CopyCellEvent {
  const _$CopyCellEvent({required this.diaryCell});

  @override
  final DiaryCell diaryCell;

  @override
  String toString() {
    return 'DiaryCellEditEvent.copyCell(diaryCell: $diaryCell)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CopyCellEvent &&
            (identical(other.diaryCell, diaryCell) ||
                other.diaryCell == diaryCell));
  }

  @override
  int get hashCode => Object.hash(runtimeType, diaryCell);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CopyCellEventCopyWith<_$CopyCellEvent> get copyWith =>
      __$$CopyCellEventCopyWithImpl<_$CopyCellEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DiaryCell diaryCell) selectCell,
    required TResult Function(
            DiaryCell diaryCell, DataTypesEnum dataType, dynamic content)
        editCell,
    required TResult Function(DiaryCell diaryCell) copyCell,
    required TResult Function(List<DiaryCell> diaryCells) selectCells,
  }) {
    return copyCell(diaryCell);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DiaryCell diaryCell)? selectCell,
    TResult? Function(
            DiaryCell diaryCell, DataTypesEnum dataType, dynamic content)?
        editCell,
    TResult? Function(DiaryCell diaryCell)? copyCell,
    TResult? Function(List<DiaryCell> diaryCells)? selectCells,
  }) {
    return copyCell?.call(diaryCell);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DiaryCell diaryCell)? selectCell,
    TResult Function(
            DiaryCell diaryCell, DataTypesEnum dataType, dynamic content)?
        editCell,
    TResult Function(DiaryCell diaryCell)? copyCell,
    TResult Function(List<DiaryCell> diaryCells)? selectCells,
    required TResult orElse(),
  }) {
    if (copyCell != null) {
      return copyCell(diaryCell);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectCellEvent value) selectCell,
    required TResult Function(EditCellEvent value) editCell,
    required TResult Function(CopyCellEvent value) copyCell,
    required TResult Function(SelectCellsEvent value) selectCells,
  }) {
    return copyCell(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectCellEvent value)? selectCell,
    TResult? Function(EditCellEvent value)? editCell,
    TResult? Function(CopyCellEvent value)? copyCell,
    TResult? Function(SelectCellsEvent value)? selectCells,
  }) {
    return copyCell?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectCellEvent value)? selectCell,
    TResult Function(EditCellEvent value)? editCell,
    TResult Function(CopyCellEvent value)? copyCell,
    TResult Function(SelectCellsEvent value)? selectCells,
    required TResult orElse(),
  }) {
    if (copyCell != null) {
      return copyCell(this);
    }
    return orElse();
  }
}

abstract class CopyCellEvent implements DiaryCellEditEvent {
  const factory CopyCellEvent({required final DiaryCell diaryCell}) =
      _$CopyCellEvent;

  DiaryCell get diaryCell;
  @JsonKey(ignore: true)
  _$$CopyCellEventCopyWith<_$CopyCellEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectCellsEventCopyWith<$Res> {
  factory _$$SelectCellsEventCopyWith(
          _$SelectCellsEvent value, $Res Function(_$SelectCellsEvent) then) =
      __$$SelectCellsEventCopyWithImpl<$Res>;
  @useResult
  $Res call({List<DiaryCell> diaryCells});
}

/// @nodoc
class __$$SelectCellsEventCopyWithImpl<$Res>
    extends _$DiaryCellEditEventCopyWithImpl<$Res, _$SelectCellsEvent>
    implements _$$SelectCellsEventCopyWith<$Res> {
  __$$SelectCellsEventCopyWithImpl(
      _$SelectCellsEvent _value, $Res Function(_$SelectCellsEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diaryCells = null,
  }) {
    return _then(_$SelectCellsEvent(
      diaryCells: null == diaryCells
          ? _value._diaryCells
          : diaryCells // ignore: cast_nullable_to_non_nullable
              as List<DiaryCell>,
    ));
  }
}

/// @nodoc

class _$SelectCellsEvent implements SelectCellsEvent {
  const _$SelectCellsEvent({required final List<DiaryCell> diaryCells})
      : _diaryCells = diaryCells;

  final List<DiaryCell> _diaryCells;
  @override
  List<DiaryCell> get diaryCells {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_diaryCells);
  }

  @override
  String toString() {
    return 'DiaryCellEditEvent.selectCells(diaryCells: $diaryCells)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectCellsEvent &&
            const DeepCollectionEquality()
                .equals(other._diaryCells, _diaryCells));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_diaryCells));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectCellsEventCopyWith<_$SelectCellsEvent> get copyWith =>
      __$$SelectCellsEventCopyWithImpl<_$SelectCellsEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DiaryCell diaryCell) selectCell,
    required TResult Function(
            DiaryCell diaryCell, DataTypesEnum dataType, dynamic content)
        editCell,
    required TResult Function(DiaryCell diaryCell) copyCell,
    required TResult Function(List<DiaryCell> diaryCells) selectCells,
  }) {
    return selectCells(diaryCells);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DiaryCell diaryCell)? selectCell,
    TResult? Function(
            DiaryCell diaryCell, DataTypesEnum dataType, dynamic content)?
        editCell,
    TResult? Function(DiaryCell diaryCell)? copyCell,
    TResult? Function(List<DiaryCell> diaryCells)? selectCells,
  }) {
    return selectCells?.call(diaryCells);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DiaryCell diaryCell)? selectCell,
    TResult Function(
            DiaryCell diaryCell, DataTypesEnum dataType, dynamic content)?
        editCell,
    TResult Function(DiaryCell diaryCell)? copyCell,
    TResult Function(List<DiaryCell> diaryCells)? selectCells,
    required TResult orElse(),
  }) {
    if (selectCells != null) {
      return selectCells(diaryCells);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectCellEvent value) selectCell,
    required TResult Function(EditCellEvent value) editCell,
    required TResult Function(CopyCellEvent value) copyCell,
    required TResult Function(SelectCellsEvent value) selectCells,
  }) {
    return selectCells(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectCellEvent value)? selectCell,
    TResult? Function(EditCellEvent value)? editCell,
    TResult? Function(CopyCellEvent value)? copyCell,
    TResult? Function(SelectCellsEvent value)? selectCells,
  }) {
    return selectCells?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectCellEvent value)? selectCell,
    TResult Function(EditCellEvent value)? editCell,
    TResult Function(CopyCellEvent value)? copyCell,
    TResult Function(SelectCellsEvent value)? selectCells,
    required TResult orElse(),
  }) {
    if (selectCells != null) {
      return selectCells(this);
    }
    return orElse();
  }
}

abstract class SelectCellsEvent implements DiaryCellEditEvent {
  const factory SelectCellsEvent({required final List<DiaryCell> diaryCells}) =
      _$SelectCellsEvent;

  List<DiaryCell> get diaryCells;
  @JsonKey(ignore: true)
  _$$SelectCellsEventCopyWith<_$SelectCellsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
