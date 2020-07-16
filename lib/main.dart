import 'dart:io';

import 'package:cinema_flt/components/router.dart';
import 'package:cinema_flt/data/constant.dart';
import 'package:cinema_flt/models/movie/movie.dart';
import 'package:cinema_flt/models/tv/tv.dart';
import 'package:cinema_flt/providers/global_provider.dart';
import 'package:cinema_flt/screens/splash/splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _initHive();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
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

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
