import 'package:cinema_flt/components/widgets/placeholder/populer_item_placeholder.dart';
import 'package:cinema_flt/models/movie/movie.dart';
import 'package:cinema_flt/utils/AppUtils.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'populer_movie_item.dart';

class PopulerMovie extends StatefulWidget {
  final List<Movie>? movies;

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
          case DeviceScreenType.tablet:
            return buildBody(TABLET);
          default:
            final screenWidth = MediaQuery.of(context).size.width;
            return buildBody(screenWidth);
        }
      },
    );
  }

  Widget buildBody(double screenWidth) {
    final heightCard = screenWidth / 1.6;
    return Container(
      width: double.infinity,
      height: heightCard,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) => SizedBox(
              width: screenWidth / 3,
              child: widget.movies == null
                  ? PopulerItemPlaceholder()
                  : PopulerMovieItem(index, widget.movies![index], screenWidth),
            )),
        separatorBuilder: (context, index) =>
            SizedBox(height: 15.0, width: 15.0),
        itemCount: widget.movies?.length ?? 0,
      ),
    );
  }
}
