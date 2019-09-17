import 'package:cinema_flt/models/movie/movie.dart';
import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tags/tag.dart';

import 'widgets/content_detail.dart';

class DetailMovie extends StatefulWidget {
  static const routeName = '/movie-detail';

  @override
  _DetailMovieState createState() => _DetailMovieState();
}

class _DetailMovieState extends State<DetailMovie> {
  ScrollController scrollController;
  final double expandedHight = 300.0;
  final double heightHeader = 350.0;

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
    scrollController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  double get top {
    double res = expandedHight;
    if (scrollController.hasClients) {
      double offset = scrollController.offset;
      if (offset < (res - kToolbarHeight)) {
        res -= offset;
      } else {
        res = kToolbarHeight;
      }
    }
    return res;
  }

  Movie _movie;

  @override
  Widget build(BuildContext context) {
    final s = ModalRoute.of(context).settings.arguments as String;

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
      height: heightHeader + 50,
      width: double.infinity,
      child: Image.asset(
        'assets/images/sample_6.jpg',
        fit: BoxFit.cover,
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
      expandedHeight: heightHeader - 50,
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
        [ContentDetail()],
      ),
    );
  }
}
