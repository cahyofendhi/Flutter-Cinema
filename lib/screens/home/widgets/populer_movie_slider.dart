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
    final contentHeight = screenWidth / 2;
    return CarouselSlider(
      height: contentHeight,
      aspectRatio: 16 / 9,
      viewportFraction: 0.8,
      enlargeCenterPage: true,
      initialPage: 0,
      items: data.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      'assets/images/sample_6.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      gradient: LinearGradient(
                        begin: FractionalOffset.center,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.5),
                          Colors.black,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ],
            );
          },
        );
      }).toList(),
    );
  }
}
