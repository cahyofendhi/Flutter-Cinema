import 'package:cinema_flt/components/unknown_page.dart';
import 'package:cinema_flt/screens/main_screens.dart';
import 'package:flutter/material.dart';



class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainScreens.routeName:
        return MaterialPageRoute(
          builder: (ctx) => MainScreens(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => UnkownPage(settings.name),
        );
    }
  }
}
