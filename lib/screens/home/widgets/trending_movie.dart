import 'package:cinema_flt/models/movie/movie.dart';
import 'package:flutter/material.dart';

import 'trending_item.dart';

class TrendingMovie extends StatefulWidget {

  final List<Movie> movies;

  TrendingMovie(this.movies);

  @override
  _TrendingMovieState createState() => _TrendingMovieState();
}

class _TrendingMovieState extends State<TrendingMovie>
    with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: widget.movies.length,
      itemBuilder: (context, index) {
        return TredingItem(widget.movies[index]);
      },
    );
  }
}