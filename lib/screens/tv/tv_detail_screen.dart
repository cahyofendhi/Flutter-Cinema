import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_flt/bloc/tv_detail_bloc.dart';
import 'package:cinema_flt/components/widgets/rating_result.dart';
import 'package:cinema_flt/models/media_credit.dart';
import 'package:cinema_flt/models/tv/tv_detail.dart';
import 'package:cinema_flt/screens/movie_detail/widgets/cast_item.dart';
import 'package:cinema_flt/screens/widgets/genre_movie.dart';
import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:cinema_flt/utils/AppUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class TvDetailScreen extends StatefulWidget {
  static const routeName = '/tv-detail';

  final int tvId;

  TvDetailScreen(this.tvId);

  @override
  _TvDetailScreenState createState() => _TvDetailScreenState();
}

class _TvDetailScreenState extends State<TvDetailScreen> {
  TvDetailBloc _tvDetailBloc;

  final double expandedHeight = 250.0;

  @override
  void didChangeDependencies() {
    _tvDetailBloc = Provider.of<TvDetailBloc>(context);
    _tvDetailBloc.getTvDetail(widget.tvId);
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
            child: _buildHeaderImage(),
          ),
          CustomScrollView(
            slivers: <Widget>[_buildAppBar(), _buildContent()],
          )
        ],
      ),
    );
  }

  Widget _buildHeaderImage() {
    return StreamBuilder<TV>(
        stream: _tvDetailBloc.movie,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? CachedNetworkImage(
                  imageBuilder: (context, imageProvider) => Container(
                        height: expandedHeight + 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30.0),
                          ),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                      ),
                  fit: BoxFit.cover,
                  imageUrl: getImageTheMovie(snapshot.data.backdropPath))
              : Container(
                  height: expandedHeight + 50,
                  width: double.infinity,
                  color: Colors.blue,
                );
        });
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      leading: Container(
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppStyle.getColor(ThemeColor.secondary),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      expandedHeight: expandedHeight - 20,
      snap: false,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(color: Colors.transparent),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return SliverList(delegate: SliverChildListDelegate([_buildTvContent()]));
  }

  Widget _buildTvContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildRateMovie(),
        SizedBox(height: 45),
        _buildDescription(),
      ],
    );
  }

  Widget _buildRateMovie() {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          bottomLeft: Radius.circular(40),
        ),
      ),
      color: Colors.white,
      elevation: 3,
      margin: EdgeInsets.only(left: 30.0),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: StreamBuilder<TV>(
            stream: _tvDetailBloc.movie,
            builder: (context, snapshot) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  _buildItemRate(
                      title: 'Episode',
                      value: snapshot.hasData
                          ? snapshot.data.numberOfEpisodes.toDouble()
                          : 0),
                  _buildItemRate(
                      title: 'Popularity',
                      value: snapshot.hasData ? snapshot.data.popularity.toDouble() : 0),
                  _buildItemRate(
                      title: 'Rate',
                      widget: RatingResult(snapshot.hasData ? snapshot.data.voteAverage: 0.0, 12.0))
                ],
              );
            }),
      ),
    );
  }

  Widget _buildItemRate({@required title, double value, Widget widget}) {
    return Column(
      children: <Widget>[
        widget == null
            ? Text(
                value.toString() ?? '0',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                  letterSpacing: 0.1,
                ),
              )
            : widget,
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.black38,
            fontSize: 14,
            letterSpacing: 0.1,
          ),
        )
      ],
    );
  }

  Widget _buildDescription() {
    return StreamBuilder<TV>(
        stream: _tvDetailBloc.movie,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _buildTitle(snapshot.data.name ?? ''),
                          SizedBox(
                            height: 10,
                          ),
                          _buildGenre(snapshot.data.genres),
                          SizedBox(
                            height: 10,
                          ),
                          AppStyle.textTitleSection(
                            'Overview',
                            AppStyle.getColor(ThemeColor.blackText),
                          ),
                          SizedBox(height: 10),
                          Text(
                            snapshot.data.overview ?? '', //? overview
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    _buildCreateBy(snapshot.data.createdBy),
                  ],
                )
              : Container();
        });
  }

  Widget _buildTitle(String title) {
    return Text(
      title, //? title
      style: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildGenre(List<Genres> genres) {
    List<String> _genre = genres.map((e) => e.name).toList();
    return genres.isNotEmpty ? GenreMovie(items: _genre) : Container();
  }

  Widget _buildCreateBy(List<Cast> casts) {
    return casts.isNotEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppStyle.textTitleSection(
                    'Created By', AppStyle.getColor(ThemeColor.blackText)),
              ),
              Container(
                height: 120,
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    final leftMargin = index == 0 ? 15.0 : 5.0;
                    return CastItem(leftMargin: leftMargin, item: casts[index]);
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: casts.length,
                ),
              )
            ],
          )
        : Container();
  }
}
