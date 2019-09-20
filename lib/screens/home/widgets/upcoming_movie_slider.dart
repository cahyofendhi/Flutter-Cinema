import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinema_flt/components/widgets/placeholder/slider_item_placeholder.dart';
import 'package:cinema_flt/models/movie/movie.dart';
import 'package:cinema_flt/screens/home/widgets/slider_item.dart';
import 'package:flutter/material.dart';

class UpcomingMovieSlider extends StatefulWidget {
  final List<Movie> movies;

  UpcomingMovieSlider(this.movies);

  @override
  _UpcomingMovieSliderState createState() => _UpcomingMovieSliderState();
}

class _UpcomingMovieSliderState extends State<UpcomingMovieSlider> {
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
      items: sliderItemView(contentHeight),
    );
  }

  List<Widget> sliderItemView(double height) {
    if (widget.movies == null) {
      return [0, 1, 2, 3]
          .map((t) => SliderItemPlaceholder(contentHeight: height))
          .toList();
    } else {
      return widget.movies.map((item) {
        return SliderItem(movie: item, contentHeight: height);
      }).toList();
    }
  }
}
