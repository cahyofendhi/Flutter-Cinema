import 'package:cinema_flt/bloc/movie_detail_bloc.dart';
import 'package:cinema_flt/bloc/movie_search_bloc.dart';
import 'package:cinema_flt/components/unknown_page.dart';
import 'package:cinema_flt/repository/movie_repository.dart';
import 'package:cinema_flt/screens/main_screens.dart';
import 'package:cinema_flt/screens/movie_detail/movie_detail.dart';
import 'package:cinema_flt/screens/search/movie_search.dart';
import 'package:cinema_flt/utils/transition/fade_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case MainScreens.routeName:
        return MaterialPageRoute(
          builder: (ctx) => MainScreens(),
        );
      case DetailMovie.routeName:
        final _page = (BuildContext context, _, __) {
          return ProxyProvider<MovieRepository, MovieDetailBloc>(
            builder: (context, movieRepository, movieDetailBloc) =>
                MovieDetailBloc(movieRepository: movieRepository),
            dispose: (context, movieDetailBloc) => movieDetailBloc.dispose(),
            child: DetailMovie(arguments),
          );
        };
        return FadeRoute(page: null, pageBuilder: _page);
      case MovieSearch.routeName:
        return MaterialPageRoute(
          builder: (ctx) => ProxyProvider<MovieRepository, MovieSearchBloc>(
            builder: (context, movieRepository, movieSearchBloc) =>
                MovieSearchBloc(movieRepository: movieRepository),
            dispose: (context, movieSearchBloc) => movieSearchBloc.dispose(),
            child: MovieSearch(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => UnkownPage(settings.name),
        );
    }
  }
}

class CustomMaterialRouter<T> extends MaterialPageRoute<T> {
  CustomMaterialRouter({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);
  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) {
      return child;
    }
    return FadeTransition(opacity: animation, child: child);
  }
}
