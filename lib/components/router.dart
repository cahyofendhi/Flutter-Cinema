import 'package:cinema_flt/components/unknown_page.dart';
import 'package:cinema_flt/screens/main_screens.dart';
import 'package:cinema_flt/screens/movie_detail/movie_detail.dart';
import 'package:flutter/material.dart';



class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case MainScreens.routeName:
        return MaterialPageRoute(
          builder: (ctx) => MainScreens(),
        );
      case DetailMovie.routeName:
        return MaterialPageRoute(
          builder: (ctx) => DetailMovie(arguments)
        );

      default:
        return MaterialPageRoute(
          builder: (_) => UnkownPage(settings.name),
        );
    }
  }
}
