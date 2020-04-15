import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_flt/screens/widgets/genre_movie.dart';
import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:cinema_flt/utils/AppUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TvDetailScreen extends StatefulWidget {
  static const routeName = '/tv-detail';

  @override
  _TvDetailScreenState createState() => _TvDetailScreenState();
}

class _TvDetailScreenState extends State<TvDetailScreen> {
  final double expandedHeight = 250.0;

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
        imageUrl: getImageTheMovie('/gVVaukIifGJD78llZKgyT5FQbAe.jpg'));
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Column(
              children: <Widget>[
                Icon(
                  Icons.rate_review,
                  color: Colors.yellow,
                  size: 20.0,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Rate',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                    letterSpacing: 0.1,
                  ),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Icon(
                  Icons.rate_review,
                  color: Colors.yellow,
                  size: 20.0,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Rate',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                    letterSpacing: 0.1,
                  ),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Icon(
                  Icons.rate_review,
                  color: Colors.yellow,
                  size: 20.0,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Rate',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                    letterSpacing: 0.1,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTitle(),
          SizedBox(
            height: 10,
          ),
          GenreMovie(
            items: ['actions', 'horror', 'comedy'],
          ),
          SizedBox(
            height: 10,
          ),
          AppStyle.textTitleSection(
            'Overview',
            AppStyle.getColor(ThemeColor.blackText),
          ),
          SizedBox(height: 10),
          Text(
            'Charismatic highwayman Jan de Lichte leads the oppressed and downtrodden in a revolt against the corrupt aristocracy of 18th-century Belgium.', //? overview
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

  Widget _buildTitle() {
    return Text(
      'Ford v Ferrari', //? title
      style: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
