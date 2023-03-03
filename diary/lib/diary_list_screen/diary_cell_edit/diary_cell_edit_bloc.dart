import 'package:bloc/bloc.dart';
import 'package:diary/core/constants/colors/black_color_constants.dart';
import 'package:diary/core/constants/constants.dart';
import 'package:diary/core/constants/enums.dart';
import 'package:diary/core/extentions.dart';
import 'package:diary/model/capital_cell.dart';
import 'package:diary/model/diary_cell.dart';
import 'package:diary/model/diary_cell_settings.dart';
import 'package:diary/model/diary_cell_text_settings.dart';
import 'package:diary/model/diary_column_settings.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_cell_edit_state.dart';
part 'diary_cell_edit_event.dart';
part 'diary_cell_edit_bloc.freezed.dart';

class DiaryCellEditBloc extends Bloc<DiaryCellEditEvent, DiaryCellEditState> {
  DiaryCellEditBloc()
      : super(
          const DiaryCellEditState.initial(),
        ) {
    on<StartTextEditingEvent>(
        (event, emit) => _onStartTextEditingEvent(event, emit));
    on<StartColorEditingEvent>(
        (event, emit) => _onStartColorEditingEvent(event, emit));
    on<ChangeCellEvent>((event, emit) => _onChangeCellEvent(event, emit));
    on<ChangeColorEvent>((event, emit) => _onChangeColorEvent(event, emit));
    on<ReloadColorEvent>((event, emit) => _onReloadColorEvent(event, emit));
    on<StartCellEditingEvent>(
        (event, emit) => _onStartCellEditingEvent(event, emit));
    on<StartBordersEditingEvent>(
        (event, emit) => _onStartBordersEditingEvent(event, emit));
    on<ChangeBordersEvent>((event, emit) => _onChangeBordersEvent(event, emit));
    on<StartCapitalCellTextEditingEvent>(
        (event, emit) => _onStartCapitalCellTextEditingEvent(event, emit));
    on<StartCapitalCellEditingEvent>(
        (event, emit) => _onStartCapitalCellEditingEvent(event, emit));
    on<StartCapitalCellBordersEditingEvent>(
        (event, emit) => _onStartCapitalCellBordersEditingEvent(event, emit));
    on<StartColumnsCountEditingEvent>(
        (event, emit) => _onStartColumnsCountEditingEvent(event, emit));
    on<ChangeColumnsCountEvent>(
        (event, emit) => _onChangeColumnsCountEvent(event, emit));
  }

  void _onStartTextEditingEvent(
    StartTextEditingEvent event,
    Emitter<DiaryCellEditState> emit,
  ) {
    final isBold =
        event.firstSelectedCell.textSettings.fontWeight == FontWeightEnum.bold;
    final isItalic =
        event.firstSelectedCell.textSettings.fontStyle == FontStyleEnum.italic;
    final isUnderline = event.firstSelectedCell.textSettings.textDecoration ==
        TextDecorationEnum.underline;
    final isLineThrough = event.firstSelectedCell.textSettings.textDecoration ==
        TextDecorationEnum.lineThrough;
    final fontSize = event.firstSelectedCell.textSettings.fontSize;
    var isHorizontalLeft = false;
    var isHorizontalCenter = false;
    var isHorizontalRight = false;
    var isVerticalTop = false;
    var isVerticalCenter = false;
    var isVerticalBottom = false;
    switch (event.firstSelectedCell.textSettings.alignment) {
      case AlignmentsEnum.bottomCenter:
        isHorizontalCenter = true;
        isVerticalBottom = true;
        break;
      case AlignmentsEnum.bottomLeft:
        isHorizontalLeft = true;
        isVerticalBottom = true;
        break;
      case AlignmentsEnum.bottomRight:
        isHorizontalRight = true;
        isVerticalBottom = true;
        break;
      case AlignmentsEnum.center:
        isHorizontalCenter = true;
        isVerticalCenter = true;
        break;
      case AlignmentsEnum.centerLeft:
        isHorizontalLeft = true;
        isVerticalCenter = true;
        break;
      case AlignmentsEnum.centerRight:
        isHorizontalRight = true;
        isVerticalCenter = true;
        break;
      case AlignmentsEnum.topCenter:
        isHorizontalCenter = true;
        isVerticalTop = true;
        break;
      case AlignmentsEnum.topLeft:
        isHorizontalLeft = true;
        isVerticalTop = true;
        break;
      case AlignmentsEnum.topRight:
        isHorizontalRight = true;
        isVerticalTop = true;
        break;
    }
    emit(
      DiaryCellEditState.textEditing(
        isBold: isBold,
        isItalic: isItalic,
        isUnderline: isUnderline,
        isLineThrough: isLineThrough,
        fontSize: fontSize,
        color: event.firstSelectedCell.textSettings.color.toColor(),
        isHorizontalCenter: isHorizontalCenter,
        isHorizontalLeft: isHorizontalLeft,
        isHorizontalRight: isHorizontalRight,
        isVerticalBottom: isVerticalBottom,
        isVerticalCenter: isVerticalCenter,
        isVerticalTop: isVerticalTop,
        defaultTextSettings: event.defaultTextSettings,
        defaultSettings: event.defaultSettings,
      ),
    );
  }

  void _onStartCellEditingEvent(
    StartCellEditingEvent event,
    Emitter<DiaryCellEditState> emit,
  ) {
    final fillColor =
        event.firstSelectedCell.settings.backgroundColor.toColor();
    emit(
      DiaryCellEditState.cellEditing(
        fillColor: fillColor,
      ),
    );
  }

  void _onStartColorEditingEvent(
    StartColorEditingEvent event,
    Emitter<DiaryCellEditState> emit,
  ) {
    state.whenOrNull(
      cellEditing: (fillColor) {
        String mainColorString = fillColor.toColorString();
        final mainColor = mainColorString.toMainColorsEnum();
        emit(
          DiaryCellEditState.colorEditing(
            colorEditingEnum: event.colorEditingEnum,
            mainColor: mainColor,
            selectedColor: fillColor,
            defaultColor: event.defaultColor,
          ),
        );
      },
      textEditing: (
        isBold,
        isItalic,
        isUnderline,
        isLineThrough,
        fontSize,
        color,
        isHorizontalLeft,
        isHorizontalCenter,
        isHorizontalRight,
        isVerticalTop,
        isVerticalCenter,
        isVerticalBottom,
        defaultTextSettings,
        defaultSettings,
      ) {
        String mainColorString = color.toColorString();
        final mainColor = mainColorString.toMainColorsEnum();
        emit(
          DiaryCellEditState.colorEditing(
            colorEditingEnum: event.colorEditingEnum,
            mainColor: mainColor,
            selectedColor: color,
            defaultColor: event.defaultColor,
          ),
        );
      },
      bordersEditing: (bordersEditingEnum, bordersStyleEnum, bordersColor) {
        String mainColorString = bordersColor.toColorString();
        final mainColor = mainColorString.toMainColorsEnum();
        emit(
          DiaryCellEditState.colorEditing(
            colorEditingEnum: event.colorEditingEnum,
            mainColor: mainColor,
            selectedColor: bordersColor,
            defaultColor: event.defaultColor,
            bordersEditingEnum: bordersEditingEnum,
            bordersStyleEnum: bordersStyleEnum,
          ),
        );
      },
      capitalCellTextEditing: (
        isBold,
        isItalic,
        isUnderline,
        isLineThrough,
        fontSize,
        color,
        isHorizontalLeft,
        isHorizontalCenter,
        isHorizontalRight,
        isVerticalTop,
        isVerticalCenter,
        isVerticalBottom,
        defaultSettings,
      ) {
        String mainColorString = color.toColorString();
        final mainColor = mainColorString.toMainColorsEnum();
        emit(
          DiaryCellEditState.colorEditing(
            colorEditingEnum: event.colorEditingEnum,
            mainColor: mainColor,
            selectedColor: color,
            defaultColor: event.defaultColor,
          ),
        );
      },
      capitalCellEditing: (capitalCell) {
        String mainColorString =
            capitalCell.settings.capitalCellBackgroundColor;
        final mainColor = mainColorString.toMainColorsEnum();
        emit(
          DiaryCellEditState.colorEditing(
            colorEditingEnum: event.colorEditingEnum,
            mainColor: mainColor,
            selectedColor:
                capitalCell.settings.capitalCellBackgroundColor.toColor(),
            defaultColor: event.defaultColor,
          ),
        );
      },
      capitalCellBordersEditing: (bordersStyleEnum, bordersColor) {
        String mainColorString = bordersColor.toColorString();
        final mainColor = mainColorString.toMainColorsEnum();
        emit(
          DiaryCellEditState.colorEditing(
            colorEditingEnum: event.colorEditingEnum,
            mainColor: mainColor,
            selectedColor: bordersColor,
            defaultColor: event.defaultColor,
            bordersEditingEnum: event.bordersEditingEnum,
            bordersStyleEnum: bordersStyleEnum,
          ),
        );
      },
    );
  }

  void _onChangeCellEvent(
    ChangeCellEvent event,
    Emitter<DiaryCellEditState> emit,
  ) {
    state.whenOrNull(
      textEditing: (
        isBold,
        isItalic,
        isUnderline,
        isLineThrough,
        fontSize,
        color,
        isHorizontalLeft,
        isHorizontalCenter,
        isHorizontalRight,
        isVerticalTop,
        isVerticalCenter,
        isVerticalBottom,
        defaultTextSettings,
        defaultSettings,
      ) {
        var newColor = color;
        if (event.color != null) {
          newColor = event.color!.toColor();
        }
        final newFontWeightEnum = event.fontWeight ??
            (isBold ? FontWeightEnum.bold : FontWeightEnum.normal);
        final newIsBold =
            newFontWeightEnum == FontWeightEnum.bold ? true : false;
        final newFontStyleEnum = event.fontStyle ??
            (isItalic ? FontStyleEnum.italic : FontStyleEnum.normal);
        final newIsItalic =
            newFontStyleEnum == FontStyleEnum.italic ? true : false;
        final newTextDecorationEnum = event.textDecoration ??
            (isUnderline
                ? TextDecorationEnum.underline
                : isLineThrough
                    ? TextDecorationEnum.lineThrough
                    : TextDecorationEnum.none);
        final newIsUnderline =
            newTextDecorationEnum == TextDecorationEnum.underline
                ? true
                : false;
        final newIsLineThrough =
            newTextDecorationEnum == TextDecorationEnum.lineThrough
                ? true
                : false;
        var newFontSize = event.fontSize ?? fontSize;
        newFontSize < Constants.minFontSize
            ? newFontSize = Constants.minFontSize
            : newFontSize + 1;
        newFontSize > Constants.maxFontSize
            ? newFontSize = Constants.maxFontSize
            : newFontSize - 1;
        var newHorizontalLeft = false;
        var newHorizontalCenter = false;
        var newHorizontalRight = false;
        var newVerticalTop = false;
        var newVerticalCenter = false;
        var newVerticalBottom = false;
        switch (event.horizontalAlignment) {
          case HorizontalAlignmentsEnum.left:
            newHorizontalLeft = true;
            break;
          case HorizontalAlignmentsEnum.center:
            newHorizontalCenter = true;
            break;
          case HorizontalAlignmentsEnum.right:
            newHorizontalRight = true;
            break;
          case null:
            newHorizontalLeft = isHorizontalLeft;
            newHorizontalCenter = isHorizontalCenter;
            newHorizontalRight = isHorizontalRight;
            break;
        }
        switch (event.verticalAlignment) {
          case VerticalAlignmentsEnum.top:
            newVerticalTop = true;
            break;
          case VerticalAlignmentsEnum.center:
            newVerticalCenter = true;
            break;
          case VerticalAlignmentsEnum.bottom:
            newVerticalBottom = true;
            break;
          case null:
            newVerticalTop = isVerticalTop;
            newVerticalCenter = isVerticalCenter;
            newVerticalBottom = isVerticalBottom;
            break;
        }
        emit(
          DiaryCellEditState.textEditing(
            isBold: newIsBold,
            isItalic: newIsItalic,
            isUnderline: newIsUnderline,
            isLineThrough: newIsLineThrough,
            fontSize: newFontSize,
            color: newColor,
            isHorizontalLeft: newHorizontalLeft,
            isHorizontalCenter: newHorizontalCenter,
            isHorizontalRight: newHorizontalRight,
            isVerticalTop: newVerticalTop,
            isVerticalCenter: newVerticalCenter,
            isVerticalBottom: newVerticalBottom,
            defaultTextSettings: defaultTextSettings,
            defaultSettings: defaultSettings,
          ),
        );
      },
      capitalCellTextEditing: (
        isBold,
        isItalic,
        isUnderline,
        isLineThrough,
        fontSize,
        color,
        isHorizontalLeft,
        isHorizontalCenter,
        isHorizontalRight,
        isVerticalTop,
        isVerticalCenter,
        isVerticalBottom,
        defaultSettings,
      ) {
        var newColor = color;
        if (event.color != null) {
          newColor = event.color!.toColor();
        }
        final newFontWeightEnum = event.fontWeight ??
            (isBold ? FontWeightEnum.bold : FontWeightEnum.normal);
        final newIsBold =
            newFontWeightEnum == FontWeightEnum.bold ? true : false;
        final newFontStyleEnum = event.fontStyle ??
            (isItalic ? FontStyleEnum.italic : FontStyleEnum.normal);
        final newIsItalic =
            newFontStyleEnum == FontStyleEnum.italic ? true : false;
        final newTextDecorationEnum = event.textDecoration ??
            (isUnderline
                ? TextDecorationEnum.underline
                : isLineThrough
                    ? TextDecorationEnum.lineThrough
                    : TextDecorationEnum.none);
        final newIsUnderline =
            newTextDecorationEnum == TextDecorationEnum.underline
                ? true
                : false;
        final newIsLineThrough =
            newTextDecorationEnum == TextDecorationEnum.lineThrough
                ? true
                : false;
        var newFontSize = event.fontSize ?? fontSize;
        newFontSize < Constants.minFontSize
            ? newFontSize = Constants.minFontSize
            : newFontSize + 1;
        newFontSize > Constants.maxFontSize
            ? newFontSize = Constants.maxFontSize
            : newFontSize - 1;
        var newHorizontalLeft = false;
        var newHorizontalCenter = false;
        var newHorizontalRight = false;
        var newVerticalTop = false;
        var newVerticalCenter = false;
        var newVerticalBottom = false;
        switch (event.horizontalAlignment) {
          case HorizontalAlignmentsEnum.left:
            newHorizontalLeft = true;
            break;
          case HorizontalAlignmentsEnum.center:
            newHorizontalCenter = true;
            break;
          case HorizontalAlignmentsEnum.right:
            newHorizontalRight = true;
            break;
          case null:
            newHorizontalLeft = isHorizontalLeft;
            newHorizontalCenter = isHorizontalCenter;
            newHorizontalRight = isHorizontalRight;
            break;
        }
        switch (event.verticalAlignment) {
          case VerticalAlignmentsEnum.top:
            newVerticalTop = true;
            break;
          case VerticalAlignmentsEnum.center:
            newVerticalCenter = true;
            break;
          case VerticalAlignmentsEnum.bottom:
            newVerticalBottom = true;
            break;
          case null:
            newVerticalTop = isVerticalTop;
            newVerticalCenter = isVerticalCenter;
            newVerticalBottom = isVerticalBottom;
            break;
        }
        emit(
          DiaryCellEditState.capitalCellTextEditing(
            isBold: newIsBold,
            isItalic: newIsItalic,
            isUnderline: newIsUnderline,
            isLineThrough: newIsLineThrough,
            fontSize: newFontSize,
            color: newColor,
            isHorizontalLeft: newHorizontalLeft,
            isHorizontalCenter: newHorizontalCenter,
            isHorizontalRight: newHorizontalRight,
            isVerticalTop: newVerticalTop,
            isVerticalCenter: newVerticalCenter,
            isVerticalBottom: newVerticalBottom,
            defaultSettings: defaultSettings,
          ),
        );
      },
    );
  }

  void _onChangeColorEvent(
    ChangeColorEvent event,
    Emitter<DiaryCellEditState> emit,
  ) {
    state.whenOrNull(
      colorEditing: (colorEditingEnum, mainColor, selectedColor, defaultColor,
          bordersEditingEnum, bordersStyleEnum) {
        if (event.color != null) {
          final string = event.color!;
          final newSelectedColor = string.toColor();
          emit(
            DiaryCellEditState.colorEditing(
              colorEditingEnum: colorEditingEnum,
              mainColor: event.mainColor,
              selectedColor: newSelectedColor,
              defaultColor: defaultColor,
              bordersEditingEnum: bordersEditingEnum,
              bordersStyleEnum: bordersStyleEnum,
            ),
          );
        } else {
          final newSelectedColor = event.mainColor.toColor();
          emit(
            DiaryCellEditState.colorEditing(
              colorEditingEnum: colorEditingEnum,
              mainColor: event.mainColor,
              selectedColor: newSelectedColor,
              defaultColor: defaultColor,
              bordersEditingEnum: bordersEditingEnum,
              bordersStyleEnum: bordersStyleEnum,
            ),
          );
        }
      },
    );
  }

  void _onReloadColorEvent(
    ReloadColorEvent event,
    Emitter<DiaryCellEditState> emit,
  ) {
    state.whenOrNull(
      colorEditing: (colorEditingEnum, mainColor, selectedColor, defaultColor,
          bordersEditingEnum, bordersStyleEnum) {
        emit(
          DiaryCellEditState.colorEditing(
            colorEditingEnum: colorEditingEnum,
            mainColor: event.mainColor,
            selectedColor: event.color,
            defaultColor: defaultColor,
            bordersEditingEnum: bordersEditingEnum,
            bordersStyleEnum: bordersStyleEnum,
          ),
        );
      },
    );
  }

  void _onStartBordersEditingEvent(
    StartBordersEditingEvent event,
    Emitter<DiaryCellEditState> emit,
  ) {
    state.whenOrNull(
      cellEditing: (fillColor) {
        Color bordersColor =
            BlackColorConstants.black1.toColor(); //Depends on defaultSettings
        const bordersEditingEnum =
            BordersEditingEnum.none; //Depends on defaultSettings
        const bordersStyleEnum =
            BordersStyleEnum.thin; //Depends on defaultSettings
        emit(
          DiaryCellEditState.bordersEditing(
            bordersEditingEnum: bordersEditingEnum,
            bordersStyleEnum: bordersStyleEnum,
            bordersColor: bordersColor,
          ),
        );
      },
      colorEditing: (colorEditingEnum, mainColor, selectedColor, defaultColor,
          bordersEditingEnum, bordersStyleEnum) {
        Color bordersColor = selectedColor;
        emit(
          DiaryCellEditState.bordersEditing(
            bordersEditingEnum: bordersEditingEnum ?? BordersEditingEnum.none,
            bordersStyleEnum: bordersStyleEnum ?? BordersStyleEnum.thin,
            bordersColor: bordersColor,
          ),
        );
      },
    );
  }

  void _onStartCapitalCellBordersEditingEvent(
    StartCapitalCellBordersEditingEvent event,
    Emitter<DiaryCellEditState> emit,
  ) {
    state.whenOrNull(
      capitalCellEditing: (capitalCell) {
        Color bordersColor =
            event.capitalCell.settings.capitalCellBorderColor.toColor();
        var bordersStyleEnum = BordersStyleEnum.thin;
        final cellWidth = event.capitalCell.settings.capitalCellBorderWidth;
        cellWidth == BordersStyleEnum.thick.toDoubleWidth()
            ? bordersStyleEnum = BordersStyleEnum.thick
            : cellWidth == BordersStyleEnum.medium.toDoubleWidth()
                ? bordersStyleEnum = BordersStyleEnum.medium
                : bordersStyleEnum;
        emit(
          DiaryCellEditState.capitalCellBordersEditing(
            bordersStyleEnum: bordersStyleEnum,
            bordersColor: bordersColor,
          ),
        );
      },
      colorEditing: (colorEditingEnum, mainColor, selectedColor, defaultColor,
          bordersEditingEnum, bordersStyleEnum) {
        Color bordersColor = selectedColor;
        emit(
          DiaryCellEditState.capitalCellBordersEditing(
            bordersStyleEnum: bordersStyleEnum ?? BordersStyleEnum.thick,
            bordersColor: bordersColor,
          ),
        );
      },
    );
  }

  void _onChangeBordersEvent(
    ChangeBordersEvent event,
    Emitter<DiaryCellEditState> emit,
  ) {
    state.whenOrNull(
      bordersEditing: (bordersEditingEnum, bordersStyleEnum, bordersColor) {
        Color newBordersColor = event.color ?? bordersColor;
        final newBordersEditingEnum =
            event.bordersEditingEnum ?? bordersEditingEnum;
        final newBordersStyleEnum = event.bordersStyleEnum ?? bordersStyleEnum;
        emit(
          DiaryCellEditState.bordersEditing(
            bordersEditingEnum: newBordersEditingEnum,
            bordersStyleEnum: newBordersStyleEnum,
            bordersColor: newBordersColor,
          ),
        );
      },
      capitalCellBordersEditing: (bordersStyleEnum, bordersColor) {
        Color newBordersColor = event.color ?? bordersColor;
        final newBordersStyleEnum = event.bordersStyleEnum ?? bordersStyleEnum;
        emit(
          DiaryCellEditState.capitalCellBordersEditing(
            bordersStyleEnum: newBordersStyleEnum,
            bordersColor: newBordersColor,
          ),
        );
      },
    );
  }

  void _onStartCapitalCellTextEditingEvent(
    StartCapitalCellTextEditingEvent event,
    Emitter<DiaryCellEditState> emit,
  ) {
    final isBold = event.selectedCapitalCell.settings.capitalCellFontWeight ==
        FontWeightEnum.bold;
    final isItalic = event.selectedCapitalCell.settings.capitalCellFontStyle ==
        FontStyleEnum.italic;
    final isUnderline =
        event.selectedCapitalCell.settings.capitalCellTextDecoration ==
            TextDecorationEnum.underline;
    final isLineThrough =
        event.selectedCapitalCell.settings.capitalCellTextDecoration ==
            TextDecorationEnum.lineThrough;
    final fontSize = event.selectedCapitalCell.settings.capitalCellFontSize;
    var isHorizontalLeft = false;
    var isHorizontalCenter = false;
    var isHorizontalRight = false;
    var isVerticalTop = false;
    var isVerticalCenter = false;
    var isVerticalBottom = false;
    switch (event.selectedCapitalCell.settings.capitalCellAlignment) {
      case AlignmentsEnum.bottomCenter:
        isHorizontalCenter = true;
        isVerticalBottom = true;
        break;
      case AlignmentsEnum.bottomLeft:
        isHorizontalLeft = true;
        isVerticalBottom = true;
        break;
      case AlignmentsEnum.bottomRight:
        isHorizontalRight = true;
        isVerticalBottom = true;
        break;
      case AlignmentsEnum.center:
        isHorizontalCenter = true;
        isVerticalCenter = true;
        break;
      case AlignmentsEnum.centerLeft:
        isHorizontalLeft = true;
        isVerticalCenter = true;
        break;
      case AlignmentsEnum.centerRight:
        isHorizontalRight = true;
        isVerticalCenter = true;
        break;
      case AlignmentsEnum.topCenter:
        isHorizontalCenter = true;
        isVerticalTop = true;
        break;
      case AlignmentsEnum.topLeft:
        isHorizontalLeft = true;
        isVerticalTop = true;
        break;
      case AlignmentsEnum.topRight:
        isHorizontalRight = true;
        isVerticalTop = true;
        break;
    }
    emit(
      DiaryCellEditState.capitalCellTextEditing(
        isBold: isBold,
        isItalic: isItalic,
        isUnderline: isUnderline,
        isLineThrough: isLineThrough,
        fontSize: fontSize,
        color:
            event.selectedCapitalCell.settings.capitalCellTextColor.toColor(),
        isHorizontalCenter: isHorizontalCenter,
        isHorizontalLeft: isHorizontalLeft,
        isHorizontalRight: isHorizontalRight,
        isVerticalBottom: isVerticalBottom,
        isVerticalCenter: isVerticalCenter,
        isVerticalTop: isVerticalTop,
        defaultSettings: event.defaultSettings,
      ),
    );
  }

  void _onStartCapitalCellEditingEvent(
    StartCapitalCellEditingEvent event,
    Emitter<DiaryCellEditState> emit,
  ) {
    emit(
      DiaryCellEditState.capitalCellEditing(
        capitalCell: event.selectedCapitalCell,
      ),
    );
  }

  void _onStartColumnsCountEditingEvent(
    StartColumnsCountEditingEvent event,
    Emitter<DiaryCellEditState> emit,
  ) {
    emit(
      const DiaryCellEditState.columnsCountEditing(
        columnsCount: 1,
      ),
    );
  }

  void _onChangeColumnsCountEvent(
    ChangeColumnsCountEvent event,
    Emitter<DiaryCellEditState> emit,
  ) {
    state.whenOrNull(
      columnsCountEditing: (columnsCount) {
        var newColumnsCount = columnsCount;
        if (event.columnsCount < 1) {
          newColumnsCount = 1;
        } else if (event.columnsCount > 5) {
          newColumnsCount = 5;
        } else {
          newColumnsCount = event.columnsCount;
        }
        emit(
          DiaryCellEditState.columnsCountEditing(
            columnsCount: newColumnsCount,
          ),
        );
      },
    );
  }
}
