import 'package:cinema_flt/components/widgets/image_network.dart';
import 'package:cinema_flt/models/movie/movie.dart';
import 'package:cinema_flt/screens/movie_detail/movie_detail.dart';
import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:cinema_flt/utils/AppUtils.dart';
import 'package:flutter/material.dart';

class SliderItem extends StatelessWidget {
  const SliderItem({
    Key? key,
    required this.movie,
    required this.contentHeight,
  }) : super(key: key);

  final double contentHeight;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final _tag = 'slider-image-movie-${movie.id}';
    return Builder(
      builder: (BuildContext context) {
        return InkWell(
          onTap: () => Navigator.of(context).pushNamed(DetailMovie.routeName,
              arguments: {'movie': movie, 'tag': _tag}),
          child: Stack(
            children: <Widget>[
              _imageView(getTheMovieImage(movie.posterPath ?? ''), _tag),
              _contentView(contentHeight, movie),
            ],
          ),
        );
      },
    );
  }

  Widget _imageView(String poster, String _tag) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              offset: Offset(1.0, 5.0),
              blurRadius: 4.0),
        ],
      ),
      child: ImageNetwork(poster),
    );
  }

  Widget _contentView(double contentHeight, Movie movie) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          height: contentHeight / 3,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.0),
                Colors.black.withOpacity(0.2),
                Colors.black.withOpacity(0.3),
                Colors.black.withOpacity(0.5),
              ],
              end: FractionalOffset(0.0, 1.0),
              begin: FractionalOffset(0.0, 0.0),
              // begin: Alignment.topCenter,
              // end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child:
              _titleContent(movie.originalTitle ?? '', movie.getReleaseDate()),
        ),
      ],
    );
  }

  Widget _titleContent(String title, String releaseDate) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppStyle.textTitleItem(title),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AppStyle.textSubtitle('$releaseDate'),
            ],
          ),
        ],
      ),
    );
  }
}
