import 'package:cinema_flt/bloc/movie_detail_bloc.dart';
import 'package:cinema_flt/models/movie/movie.dart';
import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:cinema_flt/utils/AppUtils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/content_detail.dart';

class DetailMovie extends StatefulWidget {
  static const routeName = '/movie-detail';

  Movie movie;

  DetailMovie(this.movie);

  @override
  _DetailMovieState createState() => _DetailMovieState();
}

class _DetailMovieState extends State<DetailMovie> {
  MovieDetailBloc _movieBloc;

  ScrollController scrollController;

  final double expandedHeight = 350.0;

  @override
  void didChangeDependencies() {
    _movieBloc = Provider.of<MovieDetailBloc>(context);
    _movieBloc.getMovieDetail(widget.movie.id);
    _movieBloc.getMediaCredit(widget.movie.id);
    _movieBloc.getSimilarMovie(widget.movie.id);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _helperImage(),
          ),
          CustomScrollView(
            slivers: <Widget>[
              _appBarView(),
              _contentSection(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _helperImage() {
    return Container(
      height: expandedHeight + 50,
      width: double.infinity,
      child: StreamBuilder(
          stream: _movieBloc.movie,
          builder: (ctx, AsyncSnapshot<Movie> snapshot) {
            String path = snapshot.data != null ? snapshot.data.posterPath : widget.movie.posterPath;
            return FadeInImage.assetNetwork(
              image: getTheMovieImage(path),
              placeholder: 'assets/images/placeholder.png',
              fit: BoxFit.cover,
            );
          }),
    );
  }

  Widget _appBarView() {
    return SliverAppBar(
      leading: Container(
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppStyle.getColor(ThemeColor.secondary),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      expandedHeight: expandedHeight - 50,
      snap: false,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(color: Colors.transparent),
        ),
      ),
    );
  }

  Widget _contentSection() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [ContentDetail(widget.movie)],
      ),
    );
  }

}
