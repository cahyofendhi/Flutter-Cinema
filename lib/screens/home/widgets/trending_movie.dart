import 'package:flutter/material.dart';

import 'trending_item.dart';

class TrendingMovie extends StatefulWidget {
  @override
  _TrendingMovieState createState() => _TrendingMovieState();
}

class _TrendingMovieState extends State<TrendingMovie>
    with TickerProviderStateMixin {
  final movies = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return TredingItem(index);
      },
    );
  }
}