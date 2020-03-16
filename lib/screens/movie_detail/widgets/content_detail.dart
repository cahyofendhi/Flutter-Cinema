import 'package:cinema_flt/bloc/movie_detail_bloc.dart';
import 'package:cinema_flt/components/widgets/image_network.dart';
import 'package:cinema_flt/components/widgets/rating_result.dart';
import 'package:cinema_flt/models/media_credit.dart';
import 'package:cinema_flt/models/movie/movie.dart';
import 'package:cinema_flt/models/similar_result.dart';
import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:cinema_flt/utils/AppUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:provider/provider.dart';

import 'cast_detail_item.dart';
import 'similiar_movie.dart';

class ContentDetail extends StatefulWidget {
  Movie movie;

  ContentDetail(this.movie);

  @override
  _ContentDetailState createState() => _ContentDetailState();
}

class _ContentDetailState extends State<ContentDetail> {
  MovieDetailBloc _movieBloc;
  Movie _dataMovie;

  @override
  void didChangeDependencies() {
    _movieBloc = Provider.of<MovieDetailBloc>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(25),
        ),
      ),
      child: _contentBody(),
    );
  }

  Widget _contentBody() {
    return StreamBuilder(
        stream: _movieBloc.movie,
        builder: (context, AsyncSnapshot<Movie> snapshot) {
          snapshot.data != null
              ? _dataMovie = snapshot.data
              : _dataMovie = widget.movie;
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _contentTitle(_dataMovie),
              _contentCast(),
              _contentSimiliarMovie()
            ],
          );
        });
  }

  Widget _contentTitle(Movie movie) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Text(
                  movie.originalTitle, //? title
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              RatingResult(8.9, 12.0)
            ],
          ),
          SizedBox(height: 7),
          _genreMovies(getGenresForIds(movie.genreIds)),
          SizedBox(height: 10),
          _contentAbout(),
          SizedBox(height: 10),
          AppStyle.textTitleSection(
            'Overview',
            AppStyle.getColor(ThemeColor.blackText),
          ),
          SizedBox(height: 7),
          Text(
            movie.overview, //? overview
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.w300,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _contentCast() {
    return StreamBuilder(
        stream: _movieBloc.movieCredit,
        builder: (context, AsyncSnapshot<MediaCredit> snapshot) {
          Widget cardItem = Container();
          if (snapshot.connectionState == ConnectionState.waiting) {
            print('waiting');
            cardItem = CastDetailItem(null);
          } else if ((snapshot.connectionState == ConnectionState.active ||
                  snapshot.connectionState == ConnectionState.done) &&
              snapshot.data != null) {
            print('done');
            cardItem = CastDetailItem(snapshot.data);
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppStyle.textTitleSection(
                  'Full Cast',
                  AppStyle.getColor(ThemeColor.blackText),
                ),
              ),
              SizedBox(height: 10),
              cardItem,
            ],
          );
        });
  }

  Widget _genreMovies(List<String> _items) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Tags(
        itemCount: _items.length, // required
        itemBuilder: (int index) {
          final item = _items[index];
          return ItemTags(
            key: Key(index.toString()),
            index: index, // required
            title: item,
            active: false,
            textStyle: TextStyle(fontSize: 12),
            elevation: 0,
            textColor: AppStyle.getColor(ThemeColor.primary),
            border: Border.all(
              color: AppStyle.getColor(ThemeColor.primary),
            ),
            pressEnabled: false,
            onLongPressed: null,
          );
        },
      ),
    );
  }

  Widget _contentAbout() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (_dataMovie.status != null)
                _contentDescriptionAbout('Status', _dataMovie.status),
              if (_dataMovie.runtime != null)
                _contentDescriptionAbout('Runtime', '${_dataMovie.runtime}'),
              _contentDescriptionAbout('Premiere', _dataMovie.getReleaseDate()),
              if (_dataMovie.budget != null)
                _contentDescriptionAbout('Budget', '\$${_dataMovie.budget}'),
              if (_dataMovie.revenue != null)
                _contentDescriptionAbout('Revenue', '\$${_dataMovie.revenue}'),
            ],
          ),
          if (_dataMovie.backdropPath != null)
            Container(
              width: 80,
              height: 125,
              child: ImageNetwork(getTheMovieImage(_dataMovie.backdropPath)),
            ),
        ],
      ),
    );
  }

  Widget _contentDescriptionAbout(String title, String value) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppStyle.getColor(ThemeColor.blackText),
                  letterSpacing: 0.5),
              textAlign: TextAlign.start,
            ),
            Text(' : '),
            Text(
              value,
              style: TextStyle(
                  fontSize: 14,
                  color: AppStyle.getColor(ThemeColor.primary),
                  letterSpacing: 0.5),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }

  Widget _contentSimiliarMovie() {
    return StreamBuilder(
        stream: _movieBloc.movieSimilar,
        builder: (context, AsyncSnapshot<SimilarResult> snapshot) {
          Widget cardItem = Container();
          if (snapshot.connectionState == ConnectionState.waiting) {
            print('waiting');
            cardItem = SimiliarMovie(null);
          } else if ((snapshot.connectionState == ConnectionState.active ||
                  snapshot.connectionState == ConnectionState.done) &&
              snapshot.data != null) {
            print('done');
            cardItem = SimiliarMovie(snapshot.data);
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: AppStyle.textTitleSection(
                  'Similiar',
                  AppStyle.getColor(ThemeColor.blackText),
                ),
              ),
              cardItem,
            ],
          );
        });
  }
}
