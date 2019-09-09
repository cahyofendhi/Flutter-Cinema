import 'package:flutter/material.dart';

class TvVideoItem extends StatelessWidget {

  final index;

  TvVideoItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              index % 2 == 0
                  ? 'assets/images/sample_4.jpeg'
                  : 'assets/images/sample_7.jpeg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: Icon(
            Icons.play_circle_outline,
            color: Colors.white,
            size: 30,
          ),
        )
      ],
    );
  }
}
