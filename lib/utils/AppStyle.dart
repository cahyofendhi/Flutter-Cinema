import 'package:flutter/material.dart';

import 'HexColor.dart';

enum ThemeColor {
  primary,
  secondary,
  blackText,
  greyText,
  grey,
  greyYoung,
}

class AppStyle {
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
      default:
        return HexColor("FFFFFF");
    }
  }

  static Text textSubtitle([String title, Color textColor]) {
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
    );
  }
}
