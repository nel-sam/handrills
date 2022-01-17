import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/lang_data/numbers.dart';

class HD {
  static bool isDarkTheme(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark;
  }

  static Color getAppBarColor(BuildContext context) {
    return isDarkTheme(context) ? const Color(0xFF212121) : Colors.white;
  }

  static TextTheme getAppBarTextTheme(BuildContext context) {
    return isDarkTheme(context)
        ? APP_BAR_TEXTTHEME_DARK
        : APP_BAR_TEXTTHEME_LIGHT;
  }

  static IconThemeData getAppBarIconTheme(BuildContext context) {
    return isDarkTheme(context)
        ? APP_BAR_ICONTHEME_DARK
        : APP_BAR_ICONTHEME_LIGHT;
  }

  static OutlineInputBorder getTextFieldBorder(bool isCorrect) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: isCorrect ? CORRECT_COLOR : WRONG_COLOR,
      ),
    );
  }

  static HanNumber getSinoNumber(int digit) {
    if (digit <= 9) {
      return sinoNumberBank[digit];
    }

    var written = '';
    var hundredsPlace = (digit / 100).floor();
    var hundredsValue = hundredsPlace * 100;
    var tensPlace = ((digit - hundredsValue) / 10).floor();
    var tensValue = tensPlace * 10;
    var onesPlace = digit - hundredsValue - tensValue;

    if (hundredsPlace > 0) {
      if (hundredsPlace > 1)
        written += '${sinoNumberBank[hundredsPlace].written}백';
      else
        written += '백';
    }

    if (tensPlace > 0) {
      if (tensPlace > 1)
        written += '${sinoNumberBank[tensPlace].written}십';
      else
        written += '십';
    }

    if (onesPlace > 0) {
      written += sinoNumberBank[onesPlace].written;
    }

    return HanNumber(digit: digit, written: written);
  }

  static fontStyleNormal({double fontSize = FONT_SIZE}) {
    return TextStyle(
      fontSize: fontSize,
      fontStyle: FontStyle.normal,
    );
  }

  static TextStyle fontStyleBold({double fontSize = FONT_SIZE}) {
    return TextStyle(
      color: ACCENT_COLOR,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle fontStyleItalic({double fontSize = FONT_SIZE}) {
    return TextStyle(
      fontSize: fontSize,
      fontStyle: FontStyle.italic,
    );
  }

  static double getScreenWidth(
    BuildContext context, {
    bool halfWidth = false,
  }) {
    return halfWidth
        ? (MediaQuery.of(context).size.width / 2).floorToDouble()
        : MediaQuery.of(context).size.width;
  }
}
