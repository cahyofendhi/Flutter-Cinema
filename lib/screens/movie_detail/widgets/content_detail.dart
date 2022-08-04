import 'package:cinema_flt/bloc/detail/detail_movie_bloc.dart';
import 'package:cinema_flt/bloc/detail/detail_movie_state.dart';
import 'package:cinema_flt/components/widgets/image_network.dart';
import 'package:cinema_flt/components/widgets/rating_result.dart';
import 'package:cinema_flt/models/movie/movie.dart';
import 'package:cinema_flt/screens/widgets/genre_movie.dart';
import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:cinema_flt/utils/AppUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'cast_detail_item.dart';
import 'similiar_movie.dart';

class ContentDetail extends StatefulWidget {
  final Movie movie;

  ContentDetail(this.movie);

  @override
  _ContentDetailState createState() => _ContentDetailState();
}

class _ContentDetailState extends State<ContentDetail> {
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _contentTitle(),
        _contentCast(),
        _contentSimiliarMovie()
      ],
    );
  }

  Widget _contentTitle() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: 15,
      ),
      child: BlocBuilder<DetailMovieBloc, DetailMovieState>(
        buildWhen: (previous, current) => previous.movie != current.movie,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      state.movie?.originalTitle ?? '', //? title
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
              GenreMovie(items: getGenresForIds(state.movie?.genreIds ?? [])),
              SizedBox(height: 10),
              _contentAbout(),
              SizedBox(height: 10),
              AppStyle.textTitleSection(
                'Overview',
                textColor: AppStyle.getColor(ThemeColor.blackText),
              ),
              SizedBox(height: 7),
              Text(
                state.movie?.overview ?? '', //? overview
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _contentCast() {
    return BlocBuilder<DetailMovieBloc, DetailMovieState>(
      buildWhen: (previous, current) =>
          previous.creditStatus != current.creditStatus,
      builder: (context, state) {
        Widget cardItem = Container();
        if (state.creditStatus == FormzStatus.submissionInProgress) {
          cardItem = CastDetailItem(null);
        } else if (state.creditStatus == FormzStatus.submissionSuccess) {
          cardItem = CastDetailItem(state.credit);
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppStyle.textTitleSection(
                'Full Cast',
                textColor: AppStyle.getColor(ThemeColor.blackText),
              ),
            ),
            SizedBox(height: 10),
            cardItem,
          ],
        );
      },
    );
  }

  Widget _contentAbout() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: BlocBuilder<DetailMovieBloc, DetailMovieState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (state.movie?.status != null)
                    _contentDescriptionAbout(
                        'Status', state.movie?.status ?? ''),
                  if (state.movie?.runtime != null)
                    _contentDescriptionAbout(
                        'Runtime', '${state.movie?.runtime}'),
                  _contentDescriptionAbout(
                      'Premiere', state.movie?.getReleaseDate() ?? ''),
                  if (state.movie?.budget != null)
                    _contentDescriptionAbout(
                        'Budget', '${state.movie?.budget}'),
                  if (state.movie?.revenue != null)
                    _contentDescriptionAbout(
                        'Revenue', '${state.movie?.revenue}'),
                ],
              ),
              if (state.movie?.backdropPath != null)
                Container(
                  width: 80,
                  height: 125,
                  child: ImageNetwork(
                      getTheMovieImage(state.movie?.backdropPath ?? '')),
                ),
            ],
          );
        },
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
    return BlocBuilder<DetailMovieBloc, DetailMovieState>(
      buildWhen: (previous, current) =>
          previous.similiarStatus != current.similiarStatus,
      builder: (context, state) {
        Widget cardItem = Container();
        if (state.similiarStatus == FormzStatus.submissionInProgress) {
          cardItem = SimiliarMovie(null);
        } else if (state.similiarStatus != FormzStatus.submissionSuccess) {
          cardItem = SimiliarMovie(state.similiar);
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: AppStyle.textTitleSection(
                'Similiar',
                textColor: AppStyle.getColor(ThemeColor.blackText),
              ),
            ),
            cardItem,
          ],
        );
      },
    );
  }
}
