import 'package:cinema_flt/components/widgets/placeholder/populer_item_placeholder.dart';
import 'package:cinema_flt/models/movie/movie.dart';
import 'package:cinema_flt/utils/AppUtils.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:snaplist/snaplist_view.dart';

import 'populer_movie_item.dart';

class PopulerMovie extends StatefulWidget {
  final List<Movie> movies;

  PopulerMovie(this.movies);

  @override
  _PopulerMovieState createState() => _PopulerMovieState();
}

class _PopulerMovieState extends State<PopulerMovie> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (ctx, sizingInformation) {
        switch (sizingInformation.deviceScreenType) {
          case DeviceScreenType.desktop:
            return buildBody(DEKSTOP);
            break;
          case DeviceScreenType.tablet:
            return buildBody(TABLET);
            break;
          default:
            final screenWidth = MediaQuery.of(context).size.width;
            return buildBody(screenWidth);
            break;
        }
      },
    );
  }

  Widget buildBody(double screenWidth) {
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
          return widget.movies == null
              ? PopulerItemPlaceholder()
              : PopulerMovieItem(index, widget.movies[index], screenWidth);
        },
        count: widget.movies == null ? 5 : widget.movies.length,
      ),
    );
  }

}
