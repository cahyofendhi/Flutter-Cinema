import 'package:cinema_flt/components/router.dart';
import 'package:cinema_flt/screens/main_screens.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinema FlT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: MainScreens.routeName,
      onGenerateRoute: Router.generateRoute,
    );
  }
}
