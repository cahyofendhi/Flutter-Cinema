import 'package:cinema_flt/components/widgets/image_network.dart';
import 'package:cinema_flt/models/movie/movie.dart';
import 'package:cinema_flt/screens/movie_detail/movie_detail.dart';
import 'package:cinema_flt/utils/AppUtils.dart';
import 'package:flutter/material.dart';
import 'package:cinema_flt/utils/AppStyle.dart';

class PopulerMovieItem extends StatelessWidget {
  final index;
  final Movie movie;
  final double screenWidth;

  PopulerMovieItem(this.index, this.movie, this.screenWidth);

  @override
  Widget build(BuildContext context) {
    final _tag = 'popular-image-movie-${movie.id}';
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(DetailMovie.routeName,
          arguments: {'movie': movie, 'tag': _tag}),
      child: Padding(
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
              child: ImageNetwork(
                getImageTheMovie(movie.posterPath ?? ''),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            AppStyle.textTitleBoldItem(
              movie.originalTitle ?? '',
              textColor: AppStyle.getColor(ThemeColor.blackText),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 5,
            ),
            AppStyle.textSubtitle(
              movie.getReleaseDate(),
              textColor: AppStyle.getColor(ThemeColor.greyTextDesc),
            ),
          ],
        ),
      ),
    );
  }
}
