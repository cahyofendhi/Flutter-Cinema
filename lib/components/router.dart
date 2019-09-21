import 'package:cinema_flt/components/unknown_page.dart';
import 'package:cinema_flt/screens/main_screens.dart';
import 'package:cinema_flt/screens/movie_detail/movie_detail.dart';
import 'package:cinema_flt/utils/transition/fade_route.dart';
import 'package:cinema_flt/utils/transition/slide_right_route.dart';
import 'package:flutter/cupertino.dart';
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
        return FadeRoute(
          page: DetailMovie(arguments),
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
