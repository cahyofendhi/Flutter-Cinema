import 'package:cinema_flt/components/widgets/image_network.dart';
import 'package:cinema_flt/models/movie/movie.dart';
import 'package:cinema_flt/utils/AppUtils.dart';
import 'package:flutter/material.dart';
import 'package:cinema_flt/utils/AppStyle.dart';

class PopulerMovieItem extends StatelessWidget {
  final index;
  final Movie movie;

  PopulerMovieItem(this.index, this.movie);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: screenWidth / 2.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    offset: Offset(1.09, 5.0),
                    blurRadius: 4.0),
              ],
            ),
            child: ImageNetwork(getImageTheMovie(movie.posterPath)),
          ),
          SizedBox(
            height: 15,
          ),
          AppStyle.textTitleBoldItem(
            movie.originalTitle,
            AppStyle.getColor(ThemeColor.blackText),
          ),
          // RatingResult(4.0),
          // RatingBarRestultItem(4.5),
          SizedBox(
            height: 5,
          ),
          // AppStyle.textSubtitle(
          //   getGenreString(movie.genreIds),
          //   AppStyle.getColor(ThemeColor.greyTextDesc)
          // ),
          SizedBox(
            height: 5,
          ),
          AppStyle.textSubtitle(
            movie.getReleaseDate(),
            AppStyle.getColor(ThemeColor.greyTextDesc),
          ),
        ],
      ),
    );
  }
}


