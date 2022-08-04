import 'package:cinema_flt/models/similar_movie_model.dart';
import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:cinema_flt/utils/AppUtils.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SimiliarMovieItem extends StatefulWidget {
  SimilarMovieModel movie;

  SimiliarMovieItem(this.movie);

  @override
  _SimiliarMovieItemState createState() => _SimiliarMovieItemState();
}

class _SimiliarMovieItemState extends State<SimiliarMovieItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: FadeInImage.assetNetwork(
                image: getTheMovieImage(widget.movie.posterPath ?? ''),
                placeholder: 'assets/images/placeholder.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            widget.movie.title ?? '',
            style: TextStyle(
              fontSize: 12,
              letterSpacing: -0.04,
              fontWeight: FontWeight.w600,
              color: AppStyle.getColor(ThemeColor.blackText),
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
