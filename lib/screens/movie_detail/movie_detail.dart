import 'package:cinema_flt/bloc/detail/detail_movie_bloc.dart';
import 'package:cinema_flt/bloc/detail/detail_movie_event.dart';
import 'package:cinema_flt/bloc/detail/detail_movie_state.dart';
import 'package:cinema_flt/models/movie/movie.dart';
import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:cinema_flt/utils/AppUtils.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/content_detail.dart';

class DetailMovie extends StatefulWidget {
  static const routeName = '/movie-detail';

  final Movie movie;
  final String tag;

  DetailMovie(this.movie, this.tag);

  @override
  _DetailMovieState createState() => _DetailMovieState();
}

class _DetailMovieState extends State<DetailMovie> {
  DetailMovieBloc? _movieBloc;

  ScrollController? scrollController;

  final double expandedHeight = 350.0;

  @override
  void initState() {
    super.initState();
    _movieBloc = context.read<DetailMovieBloc>()
      ..add(DetailMovieInitEvent(widget.movie));
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (ctx, sizingInformation) {
        switch (sizingInformation.deviceScreenType) {
          case DeviceScreenType.desktop:
            return Scaffold(
              backgroundColor: AppStyle.greyApp,
              body: Align(
                alignment: Alignment.center,
                child: Container(
                  width: DEKSTOP,
                  child: buildBody(),
                ),
              ),
            );
          case DeviceScreenType.tablet:
            return Scaffold(
              backgroundColor: AppStyle.greyApp,
              body: Align(
                alignment: Alignment.center,
                child: Container(
                  width: TABLET,
                  child: buildBody(),
                ),
              ),
            );
          default:
            return buildBody();
        }
      },
    );
  }

  Widget buildBody() {
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
      child: BlocBuilder<DetailMovieBloc, DetailMovieState>(
        buildWhen: (previous, current) => previous.movie != current.movie,
        builder: (context, state) {
          String? path = state.movie?.posterPath ?? widget.movie.posterPath;
          return FadeInImage.assetNetwork(
            image: getTheMovieImage(path ?? ''),
            placeholder: 'assets/images/placeholder.png',
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }

  Widget _appBarView() {
    return SliverAppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppStyle.getColor(ThemeColor.secondary),
        ),
        onPressed: () => Navigator.pop(context),
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
