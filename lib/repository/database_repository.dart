import 'package:cinema_flt/data/constant.dart';
import 'package:cinema_flt/models/movie/movie.dart';
import 'package:cinema_flt/models/tv/tv.dart';
import 'package:hive/hive.dart';

class DatabaseRepository {
  Future<void> insertMovie({
    required List<Movie> movies,
    bool isPopuler = false,
    bool isTopRate = false,
    bool isUpcoming = false,
  }) async {
    Box<Movie> moviePopular = await Hive.openBox<Movie>(MOVIE_POPULAR);
    Box<Movie> movieTopRate = await Hive.openBox<Movie>(MOVIE_TOP_RATE);
    Box<Movie> movieUpcoming = await Hive.openBox<Movie>(MOVIE_UPCOMING);
    if (isPopuler) {
      moviePopular.clear().then((value) => moviePopular.addAll(movies));
    } else if (isTopRate) {
      movieTopRate.clear().then((value) => movieTopRate.addAll(movies));
    } else if (isUpcoming) {
      movieUpcoming.clear().then((value) => movieUpcoming.addAll(movies));
    }
  }

  Future<List<Movie>> getMovies({
    bool isPopuler = false,
    bool isTopRate = false,
    bool isUpcoming = false,
  }) async {
    List<Movie> data = [];

    Box<Movie> moviePopular = await Hive.openBox<Movie>(MOVIE_POPULAR);
    Box<Movie> movieTopRate = await Hive.openBox<Movie>(MOVIE_TOP_RATE);
    Box<Movie> movieUpcoming = await Hive.openBox<Movie>(MOVIE_UPCOMING);

    if (isPopuler) {
      data = moviePopular.values.toList();
    } else if (isTopRate) {
      data = movieTopRate.values.toList();
    } else if (isUpcoming) {
      data = movieUpcoming.values.toList();
    }
    return data;
  }

  Future<void> insertTvMovie({
    required List<TV> movies,
    bool isPopuler = false,
    bool isOnAir = false,
    bool isTopRate = false,
  }) async {
    Box<TV> tvOnAir = await Hive.openBox<TV>(TV_ON_AIR);
    Box<TV> tvPopular = await Hive.openBox<TV>(TV_POPULAR);
    Box<TV> tvTopRate = await Hive.openBox<TV>(TV_TOP_RATE);
    if (isPopuler) {
      tvPopular.clear().then((value) => tvPopular.addAll(movies));
    } else if (isTopRate) {
      tvTopRate.clear().then((value) => tvTopRate.addAll(movies));
    } else if (isOnAir) {
      tvOnAir.clear().then((value) => tvOnAir.addAll(movies));
    }
  }

  Future<List<TV>> getTvMovies(
      {bool isPopuler = false,
      bool isOnAir = false,
      bool isTopRate = false}) async {
    List<TV> data = [];

    Box<TV> tvOnAir = await Hive.openBox<TV>(TV_ON_AIR);
    Box<TV> tvPopular = await Hive.openBox<TV>(TV_POPULAR);
    Box<TV> tvTopRate = await Hive.openBox<TV>(TV_TOP_RATE);

    if (isPopuler) {
      data = tvPopular.values.toList();
    } else if (isTopRate) {
      data = tvTopRate.values.toList();
    } else if (isOnAir) {
      data = tvOnAir.values.toList();
    }
    return data;
  }
}
