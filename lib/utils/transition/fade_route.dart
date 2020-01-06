import 'package:flutter/material.dart';

class FadeRoute extends PageRouteBuilder {
  final Widget _page;
  final RoutePageBuilder _builder;
  FadeRoute([this._page, this._builder])
      : super(
          pageBuilder: _builder != null ? _builder : (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) => _page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
