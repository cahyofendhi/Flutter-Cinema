import 'dart:math' as math;
import 'package:cinema_flt/components/widgets/rating_result.dart';
import 'package:cinema_flt/models/movie/movie.dart';
import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:flutter/material.dart';

class TredingItem extends StatelessWidget {
  final Movie movie;

  TredingItem(this.movie);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = screenWidth / 4;
    final imageHeight = imageWidth + (imageWidth / 3);

    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: imageWidth,
              height: imageHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      offset: Offset(1.09, 5.0),
                      blurRadius: 4.0),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  movie.getPosterImage(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Flexible(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AppStyle.textTitleBoldItem(
                      movie.originalTitle,
                      AppStyle.getColor(ThemeColor.blackText),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child: RatingResult(format(movie.voteAverage)),
                    ),
                    // RatingBarRestultItem(4.5),
                    // AppStyle.textSubtitle(
                    //   'Adventure, Action',
                    //   AppStyle.getColor(ThemeColor.greyTextDesc),
                    // ),
                    // SizedBox(
                    //   height: 3,
                    // ),
                    AppStyle.textSubtitle(
                      movie.getReleaseDate(),
                      AppStyle.getColor(ThemeColor.greyTextDesc),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double format(double n) {
    return n.ceilToDouble();
  }
}
