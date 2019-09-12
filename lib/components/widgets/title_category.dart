import 'package:flutter/material.dart';

class TitleCategory extends StatelessWidget {
  final String title;
  final Color color;

  TitleCategory([this.title = "", this.color = Colors.black]);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color,
        fontSize: 16,
      ),
    );
  }
}
