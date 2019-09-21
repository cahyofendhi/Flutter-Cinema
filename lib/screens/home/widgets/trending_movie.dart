import 'package:cinema_flt/components/widgets/placeholder/trending_item_placeholder.dart';
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
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: widget.movies == null ? 7 : widget.movies.length,
      itemBuilder: (context, index) {
        return widget.movies == null
            ? TredingItemPlaceHolder()
            : TredingItem(widget.movies[index]);
      },
    );
  }
}
