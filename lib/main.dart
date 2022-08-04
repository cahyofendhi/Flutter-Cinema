import 'dart:io';

import 'package:cinema_flt/components/app_route.dart';
import 'package:cinema_flt/data/constant.dart';
import 'package:cinema_flt/models/movie/movie.dart';
import 'package:cinema_flt/models/tv/tv.dart';
import 'package:cinema_flt/screens/splash/splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _initHive();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const App());
}

void _initHive() async {
  if (!kIsWeb) {
    final Directory appDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDirectory.path);
  }
  Hive.registerAdapter(MovieAdapter());
  Hive.registerAdapter(TVAdapter());

  Hive.openBox<Movie>(MOVIE_POPULAR);
  Hive.openBox<Movie>(MOVIE_TOP_RATE);
  Hive.openBox<Movie>(MOVIE_UPCOMING);

  Hive.openBox<TV>(TV_ON_AIR);
  Hive.openBox<TV>(TV_POPULAR);
  Hive.openBox<TV>(TV_TOP_RATE);
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinema FLT',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: SplashScreen.routeName,
      onGenerateRoute: AppRoute.generateRoute,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
    );
  }
}
