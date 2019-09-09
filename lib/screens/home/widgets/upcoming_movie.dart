import 'package:flutter/material.dart';

import 'package:snaplist/snaplist_view.dart';

import 'upcoming_movie_item.dart';

class PopulerMovieSlider extends StatefulWidget {
  @override
  _PopulerMovieSliderState createState() => _PopulerMovieSliderState();
}

class _PopulerMovieSliderState extends State<PopulerMovieSlider> {
  final data = [1, 2, 3, 4, 5, 6, 7, 8];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final heightCard = screenWidth / 1.5;
    final Size cardSize = Size(screenWidth / 3, heightCard);
    return SizedBox(
      width: double.infinity,
      height: heightCard,
      child: SnapList(
        padding: EdgeInsets.symmetric(horizontal: 25),
        sizeProvider: (index, data) => cardSize,
        separatorProvider: (index, data) => Size(15.0, 15.0),
        builder: (context, index, data) {
          return UpcomingMovieItem(index);
        },
        count: 5,
      ),
    );
  }
}
