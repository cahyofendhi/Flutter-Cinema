import 'package:cinema_flt/models/movie/movie.dart';
import 'package:flutter/material.dart';

import 'package:snaplist/snaplist_view.dart';

import 'populer_movie_item.dart';

class PopulerMovie extends StatefulWidget {

  final List<Movie> movies;

  PopulerMovie(this.movies);

  @override
  _PopulerMovieState createState() => _PopulerMovieState();
}

class _PopulerMovieState extends State<PopulerMovie> {
  
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final heightCard = screenWidth / 1.6;
    final Size cardSize = Size(screenWidth / 3, heightCard);
    return Container(
      width: double.infinity,
      height: heightCard,
      child: SnapList(
        padding: EdgeInsets.symmetric(horizontal: 25),
        sizeProvider: (index, data) => cardSize,
        separatorProvider: (index, data) => Size(15.0, 15.0),
        builder: (context, index, data) {
          return PopulerMovieItem(index, widget.movies[index]);
        },
        count: widget.movies.length,
      ),
    );
  }
}
