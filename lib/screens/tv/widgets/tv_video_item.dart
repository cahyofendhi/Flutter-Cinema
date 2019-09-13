import 'package:cinema_flt/components/widgets/image_network.dart';
import 'package:cinema_flt/models/tv/tv.dart';
import 'package:cinema_flt/utils/AppUtils.dart';
import 'package:flutter/material.dart';

class TvVideoItem extends StatelessWidget {
  final TvMovie movie;

  TvVideoItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: ImageNetwork(getImageTheMovie(movie.posterPath)),
          ),
        ),
        Center(
          child: Icon(
            Icons.play_circle_outline,
            color: Colors.white,
            size: 30,
          ),
        )
      ],
    );
  }
}
