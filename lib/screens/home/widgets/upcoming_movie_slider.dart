import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinema_flt/components/widgets/text_dot_center.dart';
import 'package:cinema_flt/utils/AppStyle.dart';
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
                _imageView(screenWidth),
                _contentView(contentHeight),
              ],
            );
          },
        );
      }).toList(),
    );
  }

  Widget _imageView(double screenWidth) {
    return Container(
      width: screenWidth,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.asset(
          'assets/images/sample_6.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _contentView(double contentHeight) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          height: contentHeight / 3,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.1),
                Colors.black.withOpacity(0.3),
                Colors.black.withOpacity(0.5),
                Colors.black.withOpacity(0.7),
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.9),
                Colors.black,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: _titleContent(),
        ),
      ],
    );
  }

  Widget _titleContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppStyle.textTitleItem('Avanger End Game'),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AppStyle.textSubtitle('2h 3m'),
              TextDotCenter(),
              AppStyle.textSubtitle('Rate 5'),
              TextDotCenter(),
              AppStyle.textSubtitle('8.5'),
            ],
          ),
        ],
      ),
    );
  }
}
