import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_flt/bloc/detail_tv/detail_movie_state.dart';
import 'package:cinema_flt/bloc/detail_tv/detail_tv_bloc.dart';
import 'package:cinema_flt/bloc/detail_tv/detail_tv_event.dart';
import 'package:cinema_flt/components/widgets/rating_result.dart';
import 'package:cinema_flt/models/media_credit.dart';
import 'package:cinema_flt/models/tv/tv.dart';
import 'package:cinema_flt/screens/movie_detail/widgets/cast_item.dart';
import 'package:cinema_flt/screens/widgets/genre_movie.dart';
import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:cinema_flt/utils/AppUtils.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TvDetailScreen extends StatefulWidget {
  static const routeName = '/tv-detail';

  final TV tv;

  TvDetailScreen(this.tv);

  @override
  _TvDetailScreenState createState() => _TvDetailScreenState();
}

class _TvDetailScreenState extends State<TvDetailScreen> {
  final double expandedHeight = 250.0;

  @override
  void initState() {
    super.initState();
    context.read<DetailTvBloc>()..add(DetailTvInitEvent(widget.tv));
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
            child: BlocBuilder<DetailTvBloc, DetailTvState>(
              buildWhen: (previous, current) =>
                  previous.status != current.status,
              builder: (context, state) {
                return _buildHeaderImage(state.movie?.backdropPath ?? '');
              },
            ),
          ),
          CustomScrollView(
            slivers: <Widget>[_buildAppBar(), _buildContent()],
          )
        ],
      ),
    );
  }

  Widget _buildHeaderImage(String imagePath) {
    return CachedNetworkImage(
        imageBuilder: (context, imageProvider) => Container(
              height: expandedHeight + 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                ),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
        fit: BoxFit.cover,
        imageUrl: getImageTheMovie(imagePath));
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
    return BlocBuilder<DetailTvBloc, DetailTvState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildRateMovie(state.movie),
            SizedBox(height: 45),
            _buildDescription(state.movie),
          ],
        );
      },
    );
  }

  Widget _buildRateMovie(TV? movie) {
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              _buildItemRate(
                  title: 'Episode',
                  value: movie?.numberOfEpisodes?.toDouble() ?? 0),
              _buildItemRate(
                  title: 'Popularity',
                  value: movie?.popularity?.toDouble() ?? 0),
              _buildItemRate(
                  title: 'Rate',
                  widget: RatingResult(movie?.voteAverage ?? 0.0, 12.0))
            ],
          )),
    );
  }

  Widget _buildItemRate({required title, double value = 0, Widget? widget}) {
    return Column(
      children: <Widget>[
        widget == null
            ? Text(
                value.toString(),
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

  Widget _buildDescription(TV? movie) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildTitle(movie?.name ?? ''),
              SizedBox(
                height: 10,
              ),
              movie?.genres != null
                  ? _buildGenre(movie?.genres ?? [])
                  : Container(),
              SizedBox(
                height: 10,
              ),
              AppStyle.textTitleSection(
                'Overview',
                textColor: AppStyle.getColor(ThemeColor.blackText),
              ),
              SizedBox(height: 10),
              Text(
                movie?.overview ?? '', //? overview
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
        movie?.createdBy != null
            ? _buildCreateBy(movie?.createdBy ?? [])
            : Container(),
      ],
    );
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
    List<String> _genre = genres.map((e) => e.name ?? '').toList();
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
                child: AppStyle.textTitleSection('Created By',
                    textColor: AppStyle.getColor(ThemeColor.blackText)),
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
