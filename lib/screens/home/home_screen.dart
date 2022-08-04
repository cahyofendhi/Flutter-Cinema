import 'package:cinema_flt/bloc/home/home_event.dart';
import 'package:cinema_flt/bloc/home/home_state.dart';
import 'package:cinema_flt/components/widgets/container_category.dart';
import 'package:cinema_flt/models/movie/movie.dart';
import 'package:cinema_flt/screens/home/widgets/trending_movie.dart';
import 'package:cinema_flt/screens/home/widgets/upcoming_movie_slider.dart';
import 'package:cinema_flt/screens/search/movie_search.dart';
import 'package:cinema_flt/utils/AppStyle.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/home/home_bloc.dart';
import 'widgets/populer_movie.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc? _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = HomeBloc();
  }

  Future<void> onRefresh() async {
    _homeBloc?.add(HomeInitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _homeBloc!..add(HomeInitEvent()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: RefreshIndicator(
              onRefresh: () => onRefresh(),
              child: Column(
                children: <Widget>[
                  _headerView(),
                  _categoryMovie(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _categoryMovie() {
    return Column(
      children: <Widget>[
        // upcoming
        BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (previous, current) =>
              previous.upcoming != current.upcoming,
          builder: (context, state) {
            return state.upcomingStatus == FormzStatus.submissionInProgress
                ? _upcomingMovie([])
                : state.upcomingStatus == FormzStatus.submissionSuccess
                    ? _upcomingMovie(state.upcoming?.results ?? [])
                    : Container();
          },
        ),

        // popular
        BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (previous, current) => previous.popular != current.popular,
          builder: (context, state) {
            return state.popularStatus == FormzStatus.submissionInProgress
                ? _populerMovie(null)
                : state.popularStatus == FormzStatus.submissionSuccess
                    ? _populerMovie(state.popular?.results ?? [])
                    : Container();
          },
        ),

        // trending
        BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (previous, current) =>
              previous.trending != current.trending,
          builder: (context, state) {
            return state.trendingStatus == FormzStatus.submissionInProgress
                ? _trendingMovie([])
                : state.trendingStatus == FormzStatus.submissionSuccess
                    ? _trendingMovie(state.trending?.results ?? [])
                    : Container();
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
        key: Key('home_search_view'),
        onTap: () => Navigator.of(context).pushNamed(MovieSearch.routeName),
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

  Widget _populerMovie(List<Movie>? movies) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ContainerCategory('Populer Movie', PopulerMovie(movies)),
    );
  }

  Widget _trendingMovie(List<Movie> movies) {
    return ContainerCategory('Top Rate Movie', TrendingMovie(movies));
  }
}
