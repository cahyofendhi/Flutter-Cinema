import 'package:cinema_flt/bloc/detail/detail_movie_bloc.dart';
import 'package:cinema_flt/bloc/detail_tv/detail_tv_bloc.dart';
import 'package:cinema_flt/bloc/search/search_bloc.dart';
import 'package:cinema_flt/components/unknown_page.dart';
import 'package:cinema_flt/screens/main_screens.dart';
import 'package:cinema_flt/screens/movie_detail/movie_detail.dart';
import 'package:cinema_flt/screens/search/movie_search.dart';
import 'package:cinema_flt/screens/splash/splash_screen.dart';
import 'package:cinema_flt/screens/tv/tv_detail_screen.dart';
import 'package:cinema_flt/utils/transition/fade_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return AppPageRoute(
          builder: (ctx) => SplashScreen(),
        );
      case MainScreens.routeName:
        return FadeRoute(page: MainScreens());
      case DetailMovie.routeName:
        final arguments = settings.arguments as Map;
        return FadeRoute(
          page: BlocProvider(
            create: (context) => DetailMovieBloc(),
            child: DetailMovie(arguments['movie'], arguments['tag']),
          ),
        );
      case MovieSearch.routeName:
        return AppPageRoute(
          builder: (ctx) => BlocProvider(
            create: (context) => SearchBloc(),
            child: MovieSearch(),
          ),
        );
      case TvDetailScreen.routeName:
        final arguments = settings.arguments as Map;

        return AppPageRoute(
          builder: (ctx) => BlocProvider(
            create: (context) => DetailTvBloc(),
            child: TvDetailScreen(arguments['tv']),
          ),
        );
      default:
        return AppPageRoute(
          builder: (_) => UnkownPage(settings.name ?? ''),
        );
    }
  }
}

class AppPageRoute extends MaterialPageRoute {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  AppPageRoute({builder}) : super(builder: builder);
}
