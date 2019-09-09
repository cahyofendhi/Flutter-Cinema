import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:flutter/material.dart';

class TextDotCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
      child: Text(
        '.',
        style: TextStyle(
          color: AppStyle.getColor(ThemeColor.greyText),
          fontSize: 12,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
