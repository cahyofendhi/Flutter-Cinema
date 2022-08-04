import 'package:cinema_flt/components/widgets/placeholder/similiar_item_placeholder.dart';
import 'package:cinema_flt/models/similar_result.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'similiar_movie_item.dart';

class SimiliarMovie extends StatelessWidget {
  final SimilarResult? similiarMovie;

  SimiliarMovie(this.similiarMovie);

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait || kIsWeb;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isPortrait ? 20 : 10),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        primary: false,
        padding: const EdgeInsets.all(0.0),
        crossAxisSpacing: 5.0,
        scrollDirection: Axis.vertical,
        crossAxisCount: isPortrait ? 3 : 7,
        childAspectRatio: 0.6,
        shrinkWrap: true,
        children: similiarMovie != null
            ? similiarMovie!.results!.map((e) => SimiliarMovieItem(e)).toList()
            : [0, 1, 2, 3, 4, 5, 6, 7, 8]
                .map((e) => SimiliarItemPlaceholder())
                .toList(),
      ),
    );
  }
}
