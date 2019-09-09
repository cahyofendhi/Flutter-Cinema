import 'package:flutter/material.dart';

import 'trending_item.dart';

class TrendingMovie extends StatefulWidget {
  @override
  _TrendingMovieState createState() => _TrendingMovieState();
}

class _TrendingMovieState extends State<TrendingMovie>
    with TickerProviderStateMixin {
  final movies = [1, 2, 3, 4, 5, 6, 7];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 0, bottom: 0, right: 16, left: 16),
        itemCount: movies.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return TredingItem();
        },
      ),
    );
  }
}


