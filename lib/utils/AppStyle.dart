import 'package:flutter/material.dart';

import 'HexColor.dart';

enum ThemeColor {
  primary,
  secondary,
  blackText,
  greyText,
  grey,
  greyTextDesc,
  greyYoung,
}

class AppStyle {
  static Color greyApp = Color(0xFFCCCCCC);

  static Color getColor([ThemeColor color = ThemeColor.primary]) {
    switch (color) {
      case ThemeColor.blackText:
        return HexColor("#101011");
      case ThemeColor.primary:
        return HexColor("#1EB7ED");
      case ThemeColor.secondary:
        return HexColor("#FFFFFF");
      case ThemeColor.greyText:
        return HexColor("#CACCCD");
      case ThemeColor.grey:
        return HexColor("BFC0C2");
      case ThemeColor.greyYoung:
        return HexColor("F8FAFB");
      case ThemeColor.greyTextDesc:
        return HexColor("#A5A7A9");
      default:
        return HexColor("FFFFFF");
    }
  }

  static Text textSubtitle(
    String title, {
    Color? textColor,
    int line = 2,
  }) {
    Color _textColor = getColor(ThemeColor.greyText);
    if (textColor != null) {
      _textColor = textColor;
    }
    return Text(
      title,
      style: TextStyle(
        fontSize: 12,
        letterSpacing: -0.04,
        color: _textColor,
      ),
      maxLines: line,
    );
  }

  static Text textTitleItem(String title, {Color? textColor}) {
    Color _textColor = getColor(ThemeColor.secondary);
    if (textColor != null) {
      _textColor = textColor;
    }
    return Text(
      title,
      style: TextStyle(
        fontSize: 14,
        letterSpacing: -0.04,
        color: _textColor,
      ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }

  static Text textTitleDetailBold(
      {required String title, Color? textColor, int line = 2}) {
    Color _textColor = getColor(ThemeColor.secondary);
    if (textColor != null) {
      _textColor = textColor;
    }
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.04,
        height: 1.5,
        color: _textColor,
      ),
      maxLines: line,
      overflow: TextOverflow.ellipsis,
    );
  }

  static Text textTitleBoldItem(String title,
      {Color? textColor, int line = 2}) {
    Color _textColor = getColor(ThemeColor.secondary);
    if (textColor != null) {
      _textColor = textColor;
    }
    return Text(
      title,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.04,
        height: 1.5,
        color: _textColor,
      ),
      textAlign: TextAlign.center,
      maxLines: line,
      overflow: TextOverflow.ellipsis,
    );
  }

  static Text textTitleSection(String title, {Color? textColor, int line = 2}) {
    Color _textColor = getColor(ThemeColor.secondary);
    if (textColor != null) {
      _textColor = textColor;
    }
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.04,
        height: 1.5,
        color: _textColor,
      ),
      maxLines: line,
      overflow: TextOverflow.ellipsis,
    );
  }

  static Text textDescription(String title, {Color? textColor, int line = 2}) {
    Color _textColor = getColor(ThemeColor.greyText);
    if (textColor != null) {
      _textColor = textColor;
    }
    return Text(
      title,
      style: TextStyle(
        fontSize: 12,
        letterSpacing: -0.04,
        color: _textColor,
      ),
      maxLines: line,
    );
  }
}
