import 'package:diary/core/constants/colors/black_color_constants.dart';
import 'package:diary/core/constants/colors/blue_color_constants.dart';
import 'package:diary/core/constants/colors/green_color_constants.dart';
import 'package:diary/core/constants/colors/orange_color_constants.dart';
import 'package:diary/core/constants/colors/purple_color_constants.dart';
import 'package:diary/core/constants/colors/red_color_constants.dart';
import 'package:diary/core/constants/colors/yellow_color_constants.dart';
import 'package:diary/core/constants/constants.dart';
import 'package:diary/core/constants/enums.dart';
import 'package:flutter/material.dart';

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "").toLowerCase();
    return Color(int.parse(hexColor));
  }

  toMainColorsEnum() {
    switch (this) {
      case BlackColorConstants.black1:
      case BlackColorConstants.black2:
      case BlackColorConstants.black3:
      case BlackColorConstants.black4:
      case BlackColorConstants.black5:
        return MainColorsEnum.black;
      case RedColorConstants.red1:
      case RedColorConstants.red2:
      case RedColorConstants.red3:
      case RedColorConstants.red4:
      case RedColorConstants.red5:
        return MainColorsEnum.red;
      case OrangeColorConstants.orange1:
      case OrangeColorConstants.orange2:
      case OrangeColorConstants.orange3:
      case OrangeColorConstants.orange4:
      case OrangeColorConstants.orange5:
        return MainColorsEnum.orange;
      case YellowColorConstants.yellow1:
      case YellowColorConstants.yellow2:
      case YellowColorConstants.yellow3:
      case YellowColorConstants.yellow4:
      case YellowColorConstants.yellow5:
        return MainColorsEnum.yellow;
      case GreenColorConstants.green1:
      case GreenColorConstants.green2:
      case GreenColorConstants.green3:
      case GreenColorConstants.green4:
      case GreenColorConstants.green5:
        return MainColorsEnum.green;
      case BlueColorConstants.blue1:
      case BlueColorConstants.blue2:
      case BlueColorConstants.blue3:
      case BlueColorConstants.blue4:
      case BlueColorConstants.blue5:
        return MainColorsEnum.blue;
      case PurpleColorConstants.purple1:
      case PurpleColorConstants.purple2:
      case PurpleColorConstants.purple3:
      case PurpleColorConstants.purple4:
      case PurpleColorConstants.purple5:
        return MainColorsEnum.purple;
      default:
        return MainColorsEnum.black;
    }
  }
}

extension MainColorExtension on MainColorsEnum {
  toColor() {
    switch (this) {
      case MainColorsEnum.black:
        return const Color(0xff000000);
      case MainColorsEnum.red:
        return const Color(0xffFF0000);
      case MainColorsEnum.orange:
        return const Color(0xffFF8000);
      case MainColorsEnum.yellow:
        return const Color(0xffFFFF00);
      case MainColorsEnum.green:
        return const Color(0xff00FF00);
      case MainColorsEnum.blue:
        return const Color(0xff0000FF);
      case MainColorsEnum.purple:
        return const Color(0xff7F00FF);
    }
  }

  getConstColors() {
    switch (this) {
      case MainColorsEnum.black:
        var colors = List<Color>.empty(growable: true);
        colors.addAll(
          [
            BlackColorConstants.black1.toColor(),
            BlackColorConstants.black2.toColor(),
            BlackColorConstants.black3.toColor(),
            BlackColorConstants.black4.toColor(),
            BlackColorConstants.black5.toColor(),
            BlackColorConstants.black6.toColor(),
          ],
        );
        return colors;
      case MainColorsEnum.red:
        var colors = List<Color>.empty(growable: true);
        colors.addAll(
          [
            RedColorConstants.red1.toColor(),
            RedColorConstants.red2.toColor(),
            RedColorConstants.red3.toColor(),
            RedColorConstants.red4.toColor(),
            RedColorConstants.red5.toColor(),
            RedColorConstants.red6.toColor(),
          ],
        );
        return colors;
      case MainColorsEnum.orange:
        var colors = List<Color>.empty(growable: true);
        colors.addAll(
          [
            OrangeColorConstants.orange1.toColor(),
            OrangeColorConstants.orange2.toColor(),
            OrangeColorConstants.orange3.toColor(),
            OrangeColorConstants.orange4.toColor(),
            OrangeColorConstants.orange5.toColor(),
            OrangeColorConstants.orange6.toColor(),
          ],
        );
        return colors;
      case MainColorsEnum.yellow:
        var colors = List<Color>.empty(growable: true);
        colors.addAll(
          [
            YellowColorConstants.yellow1.toColor(),
            YellowColorConstants.yellow2.toColor(),
            YellowColorConstants.yellow3.toColor(),
            YellowColorConstants.yellow4.toColor(),
            YellowColorConstants.yellow5.toColor(),
            YellowColorConstants.yellow6.toColor(),
          ],
        );
        return colors;
      case MainColorsEnum.green:
        var colors = List<Color>.empty(growable: true);
        colors.addAll(
          [
            GreenColorConstants.green1.toColor(),
            GreenColorConstants.green2.toColor(),
            GreenColorConstants.green3.toColor(),
            GreenColorConstants.green4.toColor(),
            GreenColorConstants.green5.toColor(),
            GreenColorConstants.green6.toColor(),
          ],
        );
        return colors;
      case MainColorsEnum.blue:
        var colors = List<Color>.empty(growable: true);
        colors.addAll(
          [
            BlueColorConstants.blue1.toColor(),
            BlueColorConstants.blue2.toColor(),
            BlueColorConstants.blue3.toColor(),
            BlueColorConstants.blue4.toColor(),
            BlueColorConstants.blue5.toColor(),
            BlueColorConstants.blue6.toColor(),
          ],
        );
        return colors;
      case MainColorsEnum.purple:
        var colors = List<Color>.empty(growable: true);
        colors.addAll(
          [
            PurpleColorConstants.purple1.toColor(),
            PurpleColorConstants.purple2.toColor(),
            PurpleColorConstants.purple3.toColor(),
            PurpleColorConstants.purple4.toColor(),
            PurpleColorConstants.purple5.toColor(),
            PurpleColorConstants.purple6.toColor(),
          ],
        );
        return colors;
    }
  }
}

extension ColorStringExtension on Color {
  toColorString() {
    var colorString = toString();
    return colorString.substring(6, colorString.length - 1);
  }

  toShadowColor() {
    return withOpacity(Constants.shadowColorOpacity);
  }
}

extension AlignmentExtension on AlignmentsEnum {
  toHorizontalAlignmentsEnum() {
    switch (this) {
      case AlignmentsEnum.bottomCenter:
        return HorizontalAlignmentsEnum.center;
      case AlignmentsEnum.bottomLeft:
        return HorizontalAlignmentsEnum.left;
      case AlignmentsEnum.bottomRight:
        return HorizontalAlignmentsEnum.right;
      case AlignmentsEnum.center:
        return HorizontalAlignmentsEnum.center;
      case AlignmentsEnum.centerLeft:
        return HorizontalAlignmentsEnum.left;
      case AlignmentsEnum.centerRight:
        return HorizontalAlignmentsEnum.right;
      case AlignmentsEnum.topCenter:
        return HorizontalAlignmentsEnum.center;
      case AlignmentsEnum.topLeft:
        return HorizontalAlignmentsEnum.left;
      case AlignmentsEnum.topRight:
        return HorizontalAlignmentsEnum.right;
    }
  }

  toVerticalAlignmentsEnum() {
    switch (this) {
      case AlignmentsEnum.bottomCenter:
        return VerticalAlignmentsEnum.bottom;
      case AlignmentsEnum.bottomLeft:
        return VerticalAlignmentsEnum.bottom;
      case AlignmentsEnum.bottomRight:
        return VerticalAlignmentsEnum.bottom;
      case AlignmentsEnum.center:
        return VerticalAlignmentsEnum.center;
      case AlignmentsEnum.centerLeft:
        return VerticalAlignmentsEnum.center;
      case AlignmentsEnum.centerRight:
        return VerticalAlignmentsEnum.center;
      case AlignmentsEnum.topCenter:
        return VerticalAlignmentsEnum.top;
      case AlignmentsEnum.topLeft:
        return VerticalAlignmentsEnum.top;
      case AlignmentsEnum.topRight:
        return VerticalAlignmentsEnum.top;
    }
  }
}

extension FontWeightEnumExtension on String {
  toFontWeightEnum() =>
      FontWeightEnum.values.firstWhere((element) => element.toString() == this);
}

extension FontWeightExtension on FontWeightEnum {
  toFontWeight() {
    switch (this) {
      case FontWeightEnum.bold:
        return FontWeight.bold;
      case FontWeightEnum.normal:
        return FontWeight.normal;
    }
  }
}

extension FontStyleEnumExtension on String {
  toFontStyleEnum() =>
      FontStyleEnum.values.firstWhere((element) => element.toString() == this);
}

extension FontStyleExtension on FontStyleEnum {
  toFontStyle() {
    switch (this) {
      case FontStyleEnum.italic:
        return FontStyle.italic;
      case FontStyleEnum.normal:
        return FontStyle.normal;
    }
  }
}

extension TextDecorationEnumExtension on String {
  toTextDecorationEnum() => TextDecorationEnum.values
      .firstWhere((element) => element.toString() == this);
}

extension TextDecorationExtension on TextDecorationEnum {
  toTextDecoration() {
    switch (this) {
      case TextDecorationEnum.lineThrough:
        return TextDecoration.lineThrough;
      case TextDecorationEnum.underline:
        return TextDecoration.underline;
      case TextDecorationEnum.none:
        return TextDecoration.none;
    }
  }
}

extension BordersStyleEnumExtension on BordersStyleEnum {
  toDoubleWidth() {
    switch (this) {
      case BordersStyleEnum.thin:
        return Constants.thinBordersStyleWidth;
      case BordersStyleEnum.medium:
        return Constants.mediumBordersStyleWidth;
      case BordersStyleEnum.thick:
        return Constants.thickBordersStyleWidth;
    }
  }
}
