import 'package:cinema_flt/bloc/movie_search_bloc.dart';
import 'package:cinema_flt/models/movie/movies_result.dart';
import 'package:cinema_flt/screens/home/widgets/trending_movie.dart';
import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:cinema_flt/utils/plugin/searchbar/flutter_search_bar_base.dart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieSearch extends StatefulWidget {
  static const routeName = '/search-page';

  @override
  _MovieSearchState createState() => _MovieSearchState();
}

class _MovieSearchState extends State<MovieSearch> {
  SearchBar searchBar;
  String titleSearch = 'Movie Search';
  String querySearch = '';

  MovieSearchBloc _movieSearchBloc;

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
        print("closed");
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
                final data = snapshot.data.results;
                if (data.isNotEmpty) {
                  return TrendingMovie(snapshot.data.results);
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

  Widget _emptyView() {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 50,
              width: 50,
              child: Image.asset(
                'assets/images/icon_not_found.png',
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: Text(
                'No search results found',
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

  Widget _initializeView() {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 300),
          child: Column(
            children: <Widget>[
              Container(
                height: 50,
                width: 50,
                child: Image.asset(
                  'assets/images/icon_movie.png',
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Text(
                  'Movie Search Page',
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
      ),
    );
  }
}
