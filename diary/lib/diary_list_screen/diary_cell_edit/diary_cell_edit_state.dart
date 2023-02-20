part of 'diary_cell_edit_bloc.dart';

@freezed
class DiaryCellEditState with _$DiaryCellEditState {
  const factory DiaryCellEditState.initial() = Initial;

  const factory DiaryCellEditState.textEditing({
    required bool isBold,
    required bool isItalic,
    required bool isUnderline,
    required bool isLineThrough,
    required double fontSize,
    required Color color,
    required bool isHorizontalLeft,
    required bool isHorizontalCenter,
    required bool isHorizontalRight,
    required bool isVerticalTop,
    required bool isVerticalCenter,
    required bool isVerticalBottom,
    required DiaryCellTextSettings defaultTextSettings,
    required DiaryCellSettings defaultSettings,
  }) = TextEditing;

  const factory DiaryCellEditState.colorEditing({
    required ColorEditingEnum colorEditingEnum,
    required MainColorsEnum mainColor,
    required Color selectedColor,
    required Color defaultColor,
    BordersEditingEnum? bordersEditingEnum,
    BordersStyleEnum? bordersStyleEnum,
  }) = ColorEditing;

  const factory DiaryCellEditState.cellEditing({
    required Color fillColor,
  }) = CellEditing;

  const factory DiaryCellEditState.bordersEditing({
    required BordersEditingEnum bordersEditingEnum,
    required BordersStyleEnum bordersStyleEnum,
    required Color bordersColor,
  }) = BordersEditing;
}
