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
    on<StartTextEditingEvent>(_onStartTextEditingEvent);
    on<StartColorEditingEvent>(_onStartColorEditingEvent);
    on<ChangeCellEvent>(_onChangeCellEvent);
    on<ChangeColorEvent>(_onChangeColorEvent);
    on<ReloadColorEvent>(_onReloadColorEvent);
    on<StartCellEditingEvent>(_onStartCellEditingEvent);
    on<StartBordersEditingEvent>(_onStartBordersEditingEvent);
    on<ChangeBordersEvent>(_onChangeBordersEvent);
    on<StartCapitalCellTextEditingEvent>(_onStartCapitalCellTextEditingEvent);
    on<StartCapitalCellEditingEvent>(_onStartCapitalCellEditingEvent);
    on<StartCapitalCellBordersEditingEvent>(
        _onStartCapitalCellBordersEditingEvent);
    on<StartColumnsCountEditingEvent>(_onStartColumnsCountEditingEvent);
    on<ChangeColumnsCountEvent>(_onChangeColumnsCountEvent);
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
    state.mapOrNull(
      cellEditing: (value) {
        String mainColorString = value.fillColor.toColorString();
        final mainColor = mainColorString.toMainColorsEnum();
        emit(
          DiaryCellEditState.colorEditing(
            colorEditingEnum: event.colorEditingEnum,
            mainColor: mainColor,
            selectedColor: value.fillColor,
            defaultColor: event.defaultColor,
          ),
        );
      },
      textEditing: (value) {
        String mainColorString = value.color.toColorString();
        final mainColor = mainColorString.toMainColorsEnum();
        emit(
          DiaryCellEditState.colorEditing(
            colorEditingEnum: event.colorEditingEnum,
            mainColor: mainColor,
            selectedColor: value.color,
            defaultColor: event.defaultColor,
          ),
        );
      },
      bordersEditing: (value) {
        String mainColorString = value.bordersColor.toColorString();
        final mainColor = mainColorString.toMainColorsEnum();
        emit(
          DiaryCellEditState.colorEditing(
            colorEditingEnum: event.colorEditingEnum,
            mainColor: mainColor,
            selectedColor: value.bordersColor,
            defaultColor: event.defaultColor,
            bordersEditingEnum: value.bordersEditingEnum,
            bordersStyleEnum: value.bordersStyleEnum,
          ),
        );
      },
      capitalCellTextEditing: (value) {
        String mainColorString = value.color.toColorString();
        final mainColor = mainColorString.toMainColorsEnum();
        emit(
          DiaryCellEditState.colorEditing(
            colorEditingEnum: event.colorEditingEnum,
            mainColor: mainColor,
            selectedColor: value.color,
            defaultColor: event.defaultColor,
          ),
        );
      },
      capitalCellEditing: (value) {
        String mainColorString =
            value.capitalCell.settings.capitalCellBackgroundColor;
        final mainColor = mainColorString.toMainColorsEnum();
        emit(
          DiaryCellEditState.colorEditing(
            colorEditingEnum: event.colorEditingEnum,
            mainColor: mainColor,
            selectedColor:
                value.capitalCell.settings.capitalCellBackgroundColor.toColor(),
            defaultColor: event.defaultColor,
          ),
        );
      },
      capitalCellBordersEditing: (value) {
        String mainColorString = value.bordersColor.toColorString();
        final mainColor = mainColorString.toMainColorsEnum();
        emit(
          DiaryCellEditState.colorEditing(
            colorEditingEnum: event.colorEditingEnum,
            mainColor: mainColor,
            selectedColor: value.bordersColor,
            defaultColor: event.defaultColor,
            bordersEditingEnum: event.bordersEditingEnum,
            bordersStyleEnum: value.bordersStyleEnum,
          ),
        );
      },
    );
  }

  void _onChangeCellEvent(
    ChangeCellEvent event,
    Emitter<DiaryCellEditState> emit,
  ) {
    state.mapOrNull(
      textEditing: (value) {
        var newColor = value.color;
        if (event.color != null) {
          newColor = event.color!.toColor();
        }
        final newFontWeightEnum = event.fontWeight ??
            (value.isBold ? FontWeightEnum.bold : FontWeightEnum.normal);
        final newIsBold =
            newFontWeightEnum == FontWeightEnum.bold ? true : false;
        final newFontStyleEnum = event.fontStyle ??
            (value.isItalic ? FontStyleEnum.italic : FontStyleEnum.normal);
        final newIsItalic =
            newFontStyleEnum == FontStyleEnum.italic ? true : false;
        final newTextDecorationEnum = event.textDecoration ??
            (value.isUnderline
                ? TextDecorationEnum.underline
                : value.isLineThrough
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
        var newFontSize = event.fontSize ?? value.fontSize;
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
            newHorizontalLeft = value.isHorizontalLeft;
            newHorizontalCenter = value.isHorizontalCenter;
            newHorizontalRight = value.isHorizontalRight;
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
            newVerticalTop = value.isVerticalTop;
            newVerticalCenter = value.isVerticalCenter;
            newVerticalBottom = value.isVerticalBottom;
            break;
        }
        emit(
          value.copyWith(
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
          ),
        );
      },
      capitalCellTextEditing: (value) {
        var newColor = value.color;
        if (event.color != null) {
          newColor = event.color!.toColor();
        }
        final newFontWeightEnum = event.fontWeight ??
            (value.isBold ? FontWeightEnum.bold : FontWeightEnum.normal);
        final newIsBold =
            newFontWeightEnum == FontWeightEnum.bold ? true : false;
        final newFontStyleEnum = event.fontStyle ??
            (value.isItalic ? FontStyleEnum.italic : FontStyleEnum.normal);
        final newIsItalic =
            newFontStyleEnum == FontStyleEnum.italic ? true : false;
        final newTextDecorationEnum = event.textDecoration ??
            (value.isUnderline
                ? TextDecorationEnum.underline
                : value.isLineThrough
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
        var newFontSize = event.fontSize ?? value.fontSize;
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
            newHorizontalLeft = value.isHorizontalLeft;
            newHorizontalCenter = value.isHorizontalCenter;
            newHorizontalRight = value.isHorizontalRight;
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
            newVerticalTop = value.isVerticalTop;
            newVerticalCenter = value.isVerticalCenter;
            newVerticalBottom = value.isVerticalBottom;
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
            defaultSettings: value.defaultSettings,
          ),
        );
      },
    );
  }

  void _onChangeColorEvent(
    ChangeColorEvent event,
    Emitter<DiaryCellEditState> emit,
  ) {
    state.mapOrNull(
      colorEditing: (value) {
        if (event.color != null) {
          final string = event.color!;
          final newSelectedColor = string.toColor();
          emit(
            value.copyWith(
              mainColor: event.mainColor,
              selectedColor: newSelectedColor,
            ),
          );
        } else {
          final newSelectedColor = event.mainColor.toColor();
          emit(
            value.copyWith(
              mainColor: event.mainColor,
              selectedColor: newSelectedColor,
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
    state.mapOrNull(
      colorEditing: (value) {
        emit(
          value.copyWith(
            mainColor: event.mainColor,
            selectedColor: event.color,
          ),
        );
      },
    );
  }

  void _onStartBordersEditingEvent(
    StartBordersEditingEvent event,
    Emitter<DiaryCellEditState> emit,
  ) {
    state.mapOrNull(
      cellEditing: (value) {
        Color bordersColor = BlackColorConstants.black1.toColor();
        const bordersEditingEnum = BordersEditingEnum.none;
        const bordersStyleEnum = BordersStyleEnum.thin;
        emit(
          DiaryCellEditState.bordersEditing(
            bordersEditingEnum: bordersEditingEnum,
            bordersStyleEnum: bordersStyleEnum,
            bordersColor: bordersColor,
          ),
        );
      },
      colorEditing: (value) {
        Color bordersColor = value.selectedColor;
        emit(
          DiaryCellEditState.bordersEditing(
            bordersEditingEnum:
                value.bordersEditingEnum ?? BordersEditingEnum.none,
            bordersStyleEnum: value.bordersStyleEnum ?? BordersStyleEnum.thin,
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
    state.mapOrNull(
      capitalCellEditing: (value) {
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
      colorEditing: (value) {
        Color bordersColor = value.selectedColor;
        emit(
          DiaryCellEditState.capitalCellBordersEditing(
            bordersStyleEnum: value.bordersStyleEnum ?? BordersStyleEnum.thick,
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
    state.mapOrNull(
      bordersEditing: (value) {
        Color newBordersColor = event.color ?? value.bordersColor;
        final newBordersEditingEnum =
            event.bordersEditingEnum ?? value.bordersEditingEnum;
        final newBordersStyleEnum =
            event.bordersStyleEnum ?? value.bordersStyleEnum;
        emit(
          value.copyWith(
            bordersEditingEnum: newBordersEditingEnum,
            bordersStyleEnum: newBordersStyleEnum,
            bordersColor: newBordersColor,
          ),
        );
      },
      capitalCellBordersEditing: (value) {
        Color newBordersColor = event.color ?? value.bordersColor;
        final newBordersStyleEnum =
            event.bordersStyleEnum ?? value.bordersStyleEnum;
        emit(
          value.copyWith(
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
    state.mapOrNull(
      columnsCountEditing: (value) {
        var newColumnsCount = value.columnsCount;
        if (event.columnsCount < 1) {
          newColumnsCount = 1;
        } else if (event.columnsCount > 5) {
          newColumnsCount = 5;
        } else {
          newColumnsCount = event.columnsCount;
        }
        emit(
          value.copyWith(
            columnsCount: newColumnsCount,
          ),
        );
      },
    );
  }
}
