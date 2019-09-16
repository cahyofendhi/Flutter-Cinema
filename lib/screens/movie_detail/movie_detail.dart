import 'package:cinema_flt/models/movie/movie.dart';
import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:flutter/material.dart';

class DetailMovie extends StatefulWidget {
  static const routeName = '/movie-detail';

  @override
  _DetailMovieState createState() => _DetailMovieState();
}

class _DetailMovieState extends State<DetailMovie> {
  Movie _movie;

  @override
  Widget build(BuildContext context) {
    // final productId = ModalRoute.of(context).settings.arguments
    //     as String;
    _movie = ModalRoute.of(context).settings.arguments as Movie;

    if (_movie != null) {
      print("Movie Detail : ${_movie.originalTitle}");
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          _appBarView(),
          _contentView(),
        ],
      ),
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
      expandedHeight: 300,
      actions: <Widget>[],
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          'assets/images/sample_2.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _contentView() {
    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _contentTitle(),
                SizedBox(height: 7),
                _contentProduction(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _contentTitle() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppStyle.textTitleDetailBold(
            'Alita: Battle Angle',
            AppStyle.getColor(ThemeColor.blackText),
          ),
          SizedBox(
            height: 7,
          ),
          AppStyle.textDescription('Action, Comedy, Family, FAntasy',
              AppStyle.getColor(ThemeColor.greyTextDesc)),
          SizedBox(
            height: 7,
          ),
          AppStyle.textTitleSection(
            'Overview',
            AppStyle.getColor(ThemeColor.blackText),
          ),
          SizedBox(
            height: 5,
          ),
          AppStyle.textDescription(
            "27 years after overcoming the malevolent supernatural entity Pennywise, the former members of the Losers' Club, who have grown up and moved away from Derry, are brought back together by a devastating phone call.",
            AppStyle.getColor(ThemeColor.greyTextDesc),
          ),
        ],
      ),
    );
  }

  Widget _contentProduction() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: AppStyle.textTitleSection(
            'Production Companies',
            AppStyle.getColor(ThemeColor.blackText),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) {
              final leftMargin = index == 0 ? 15.0 : 5.0;
              return Padding(
                padding: EdgeInsets.only(
                  left: leftMargin,
                  top: 5,
                  bottom: 5,
                  right: 5,
                ),
                child: CircleAvatar(
                  radius: 33,
                  backgroundColor: Colors.transparent,
                  child: ClipOval(
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/placeholder.png',
                      fit: BoxFit.cover,
                      image:
                          'http://image.tmdb.org/t/p/w185//ky0xOc5OrhzkZ1N6KyUxacfQsCk.png',
                    ),
                  ),
                ),
              );
            },
            itemCount: 10,
          ),
        )
      ],
    );
  }
}
