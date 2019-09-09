import 'package:flutter/material.dart';

import 'package:snaplist/snaplist_view.dart';

class UpcomingMovieSlider extends StatefulWidget {
  @override
  _UpcomingMovieSliderState createState() => _UpcomingMovieSliderState();
}

class _UpcomingMovieSliderState extends State<UpcomingMovieSlider> {
  final data = [1, 2, 3, 4, 5, 6, 7, 8];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final Size cardSize = Size(screenWidth / 3, screenWidth / 2);
    return SizedBox(
      width: double.infinity,
      height: screenWidth / 2,
      child: SnapList(
        padding: EdgeInsets.symmetric(horizontal: 25),
        sizeProvider: (index, data) => cardSize,
        separatorProvider: (index, data) => Size(15.0, 15.0),
        builder: (context, index, data) {
          return Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 10),
            child: Container(
              width: screenWidth / 3,
              height: screenWidth / 2,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: Offset(1.0, 2.0),
                      blurRadius: 1.0),
                ],
              ),
            ),
          );
        },
        count: 5,
      ),
    );
  }
}
