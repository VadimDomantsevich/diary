part of 'diary_cell_edit_bloc.dart';

@freezed
class DiaryCellEditEvent with _$DiaryCellEditEvent {
  const factory DiaryCellEditEvent.startTextEditing({
    required DiaryCell firstSelectedCell,
    required DiaryCellTextSettings defaultTextSettings,
    required DiaryCellSettings defaultSettings,
  }) = StartTextEditingEvent;

  const factory DiaryCellEditEvent.startCellEditing({
    required DiaryCell firstSelectedCell,
  }) = StartCellEditingEvent;

  const factory DiaryCellEditEvent.startColorEditing({
    required ColorEditingEnum colorEditingEnum,
    required Color defaultColor,
    BordersEditingEnum? bordersEditingEnum,
    BordersStyleEnum? bordersStyleEnum,
  }) = StartColorEditingEvent;

  const factory DiaryCellEditEvent.changeCell({
    FontWeightEnum? fontWeight,
    TextDecorationEnum? textDecoration,
    FontStyleEnum? fontStyle,
    double? fontSize,
    String? color,
    HorizontalAlignmentsEnum? horizontalAlignment,
    VerticalAlignmentsEnum? verticalAlignment,
  }) = ChangeCellEvent;

  const factory DiaryCellEditEvent.changeColor({
    required MainColorsEnum mainColor,
    String? color,
  }) = ChangeColorEvent;

  const factory DiaryCellEditEvent.reloadColor({
    required MainColorsEnum mainColor,
    required Color color,
  }) = ReloadColorEvent;

  const factory DiaryCellEditEvent.startBordersEditing() =
      StartBordersEditingEvent;

  const factory DiaryCellEditEvent.changeBorders({
    BordersEditingEnum? bordersEditingEnum,
    BordersStyleEnum? bordersStyleEnum,
    Color? color,
  }) = ChangeBordersEvent;

  const factory DiaryCellEditEvent.startCapitalCellTextEditing({
    required CapitalCell selectedCapitalCell,
    required DiaryColumnSettings defaultSettings,
  }) = StartCapitalCellTextEditingEvent;

  const factory DiaryCellEditEvent.startCapitalCellEditing({
    required CapitalCell selectedCapitalCell,
  }) = StartCapitalCellEditingEvent;

  const factory DiaryCellEditEvent.startCapitalCellBordersEditing({
    required CapitalCell capitalCell,
  }) = StartCapitalCellBordersEditingEvent;

  const factory DiaryCellEditEvent.startColumnsCountEditing() =
      StartColumnsCountEditingEvent;

  const factory DiaryCellEditEvent.changeColumnsCount({
    required int columnsCount,
  }) = ChangeColumnsCountEvent;
}
