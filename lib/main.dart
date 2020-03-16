import 'package:cinema_flt/components/router.dart';
import 'package:cinema_flt/providers/global_provider.dart';
import 'package:cinema_flt/screens/main_screens.dart';
import 'package:cinema_flt/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MultiProvider(
      providers: [
        ...globalProviders,
        ...uiConsumableProviders,
      ],
      child: MaterialApp(
        title: 'Cinema FlT',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: SplashScreen.routeName,
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
