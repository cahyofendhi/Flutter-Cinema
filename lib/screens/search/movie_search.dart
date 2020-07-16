import 'package:cinema_flt/bloc/movie_search_bloc.dart';
import 'package:cinema_flt/models/movie/movie.dart';
import 'package:cinema_flt/models/movie/movies_result.dart';
import 'package:cinema_flt/screens/home/widgets/trending_movie.dart';
import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:cinema_flt/utils/AppUtils.dart';
import 'package:cinema_flt/utils/plugin/searchbar/flutter_search_bar_base.dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MovieSearch extends StatefulWidget {
  static const routeName = '/search-page';

  @override
  _MovieSearchState createState() => _MovieSearchState();
}

class _MovieSearchState extends State<MovieSearch> {
  SearchBar searchBar;
  static final defaultTitle = 'Movie Search';
  String titleSearch = defaultTitle;
  String querySearch = '';

  MovieSearchBloc _movieSearchBloc;
  List<Movie> movies = [];
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  int totalPage = 0;
  int page = 1;

  void onSubmitted(String value) {
    setState(() {
      titleSearch = value;
      querySearch = value;
    });
    _movieSearchBloc.getMovie(querySearch, 1);
  }

  _searchAppBar() {
    searchBar = new SearchBar(
      inBar: true,
      buildDefaultAppBar: (ctx) {
        return AppBar(
            title: new Text(titleSearch),
            actions: [searchBar.getSearchAction(context)]);
      },
      setState: setState,
      onSubmitted: onSubmitted,
      onClosed: () {
        setState(() {
          titleSearch = defaultTitle;
        });
      },
    );
  }

  @override
  void initState() {
    _searchAppBar();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _movieSearchBloc = Provider.of<MovieSearchBloc>(context, listen: false);
    super.didChangeDependencies();
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
            break;
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
            break;
          default:
            return buildBody();
        }
      },
    );
  }

  Widget buildBody() {
    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: searchBar.build(context),
        body: StreamBuilder<MoviesResult>(
          stream: _movieSearchBloc.movies.stream,
          builder: (context, AsyncSnapshot<MoviesResult> snapshot) {
            print('state = ${snapshot.connectionState}');
            if (snapshot.hasData) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.connectionState == ConnectionState.active &&
                  snapshot.data != null) {
                MoviesResult data = snapshot.data;
                totalPage = data.totalPages;
                page = data.page;
                final result = data.results;
                _refreshController.loadComplete();
                if (result.isNotEmpty) {
                  if (page == 1) {
                    movies = result;
                  } else {
                    movies.insertAll(movies.length, result);
                  }
                  return _contentList();
                } else {
                  return _emptyView();
                }
              } else {
                return _initializeView();
              }
            } else {
              return _initializeView();
            }
          },
        ));
  }

  Widget _contentList() {
    return SmartRefresher(
      enablePullDown: false,
      enablePullUp: true,
      header: WaterDropHeader(),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus mode) {
          Widget body;
          if (mode == LoadStatus.loading) {
            body = CupertinoActivityIndicator();
          }
          return Container(
            height: 50.0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(child: body),
            ),
          );
        },
      ),
      controller: _refreshController,
      onLoading: _onLoading,
      child: TrendingMovie(movies),
    );
  }

  void _onLoading() {
    _movieSearchBloc.getMovie(querySearch, page + 1);
  }

  Widget _emptyView() {
    return _blankPage(
        'assets/images/icon_not_found.png', 'No search results found');
  }

  Widget _initializeView() {
    return Padding(
      padding: const EdgeInsets.only(top: 300),
      child: _blankPage('assets/images/icon_movie.png', 'Movie Search Page'),
    );
  }

  Widget _blankPage(String icon, String name) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 50,
              width: 50,
              child: Image.asset(
                icon,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: AppStyle.getColor(ThemeColor.blackText),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
