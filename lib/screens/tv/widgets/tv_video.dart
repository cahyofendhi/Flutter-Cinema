import 'package:cinema_flt/components/widgets/placeholder/tv_video_item_placeholder.dart';
import 'package:cinema_flt/models/tv/tv.dart';
import 'package:cinema_flt/screens/tv/widgets/tv_video_item.dart';
import 'package:flutter/material.dart';
import 'package:snaplist/snaplist.dart';

class TvVideo extends StatelessWidget {
  final List<TvMovie> movies;

  TvVideo(this.movies);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final widthCard = screenWidth / 3;
    final heightCard = widthCard / 2;
    final Size cardSize = Size(widthCard, heightCard);
    return SizedBox(
      width: double.infinity,
      height: heightCard,
      child: SnapList(
        padding: EdgeInsets.symmetric(horizontal: 20),
        sizeProvider: (index, data) => cardSize,
        separatorProvider: (index, data) => Size(15.0, 15.0),
        builder: (context, index, data) {
          return movies == null
              ? TvVideoItemPlaceholder()
              : TvVideoItem(movies[index]);
        },
        count: movies == null ? 5 : movies.length,
      ),
    );
  }
}
