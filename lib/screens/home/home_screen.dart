import 'package:cinema_flt/bloc/home_bloc.dart';
import 'package:cinema_flt/components/widgets/container_category.dart';
import 'package:cinema_flt/models/movie/movie.dart';
import 'package:cinema_flt/models/movie/movies_result.dart';
import 'package:cinema_flt/screens/home/widgets/trending_movie.dart';
import 'package:cinema_flt/screens/home/widgets/upcoming_movie_slider.dart';
import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:cinema_flt/utils/request_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/populer_movie.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc _homeBloc;

  @override
  void didChangeDependencies() {
    _homeBloc = Provider.of<HomeBloc>(context, listen: false);
    _homeBloc.getAllCategoryMovie();
    super.didChangeDependencies();
  }

  Future<void> onRefresh() async {
    _homeBloc.getAllCategoryMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: RefreshIndicator(
            onRefresh: () => onRefresh(),
            child: Column(
              children: <Widget>[_headerView(), _categoryMovie()],
            ),
          ),
        ),
      ),
    );
  }

  Widget _categoryMovie() {
    return Column(
      children: <Widget>[
        StreamBuilder(
          stream: _homeBloc.upcomingMovies,
          builder: (_, AsyncSnapshot<MoviesResult> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return _upcomingMovie(null);
            } else if (snapshot.data == null || snapshot.data.results.isEmpty) {
              return Container();
            } else {
              return _upcomingMovie(snapshot.data.results);
            }
          },
        ),
        StreamBuilder(
          stream: _homeBloc.populerMovies,
          builder: (_, AsyncSnapshot<MoviesResult> snapshot) {
             if (snapshot.connectionState == ConnectionState.waiting) {
              return _populerMovie(null);
            } else if (snapshot.data == null || snapshot.data.results.isEmpty) {
              return Container();
            } else {
              return _populerMovie(snapshot.data.results);
            }
          },
        ),
        StreamBuilder(
          stream: _homeBloc.trendingMovies,
          builder: (_, AsyncSnapshot<MoviesResult> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return _trendingMovie(null);
            } else if (snapshot.data == null || snapshot.data.results.isEmpty) {
              return Container();
            } else {
              return _trendingMovie(snapshot.data.results);
            }
          },
        ),
      ],
    );
  }

  Widget _headerView() {
    return Container(
      //! header content
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      height: 150,
      child: _formSearch(),
    );
  }

  Widget _formSearch() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: InkWell(
        onTap: () {
          print("click search");
        },
        child: Container(
          height: 50,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: AppStyle.getColor(ThemeColor.greyYoung),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            border: Border.all(
              width: 1,
              color: AppStyle.getColor(ThemeColor.grey),
            ),
          ),
          child: Row(
            //! SEARCH
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                //! parent search view
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    'Search your movie',
                    style: TextStyle(
                        color: AppStyle.getColor(ThemeColor.greyText)),
                  ),
                ),
              ),
              SizedBox(width: 10), //! space
              SizedBox(
                //! icon search
                width: 50,
                height: 50,
                child: Icon(
                  Icons.search,
                  color: AppStyle.getColor(ThemeColor.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _upcomingMovie(List<Movie> movies) {
    return ContainerCategory('Upcoming Movie', UpcomingMovieSlider(movies));
  }

  Widget _populerMovie(List<Movie> movies) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ContainerCategory('Populer Movie', PopulerMovie(movies)),
    );
  }

  Widget _trendingMovie(List<Movie> movies) {
    return ContainerCategory('Top Rate Movie', TrendingMovie(movies));
  }
}
