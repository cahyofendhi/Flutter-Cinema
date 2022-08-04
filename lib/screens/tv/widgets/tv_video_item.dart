import 'package:cinema_flt/components/widgets/image_network.dart';
import 'package:cinema_flt/models/tv/tv.dart';
import 'package:cinema_flt/screens/tv/tv_detail_screen.dart';
import 'package:cinema_flt/utils/AppUtils.dart';
import 'package:flutter/material.dart';

class TvVideoItem extends StatelessWidget {
  final TV movie;

  TvVideoItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed(TvDetailScreen.routeName, arguments: {'tv': movie}),
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: ImageNetwork(getImageTheMovie(movie.posterPath ?? '')),
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
      ),
    );
  }
}
