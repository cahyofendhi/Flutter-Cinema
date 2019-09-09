import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:snaplist/snaplist_view.dart';

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
    return CarouselSlider(
      height: screenWidth / 2,
      aspectRatio: 16 / 9,
      viewportFraction: 0.8,
      enlargeCenterPage: true,
      items: data.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(color: Colors.amber),
                child: Text(
                  'text $i',
                  style: TextStyle(fontSize: 16.0),
                ));
          },
        );
      }).toList(),
    );
  }
}
