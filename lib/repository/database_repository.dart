import 'package:cinema_flt/data/constant.dart';
import 'package:cinema_flt/models/movie/movie.dart';
import 'package:cinema_flt/models/tv/tv.dart';
import 'package:hive/hive.dart';

class DatabaseRepository {
  Box<Movie> moviePopular;
  Box<Movie> movieTopRate;
  Box<Movie> movieUpcoming;

  Box<TV> tvOnAir;
  Box<TV> tvPopular;
  Box<TV> tvTopRate;

  DatabaseRepository() {
    Hive.openBox<Movie>(MOVIE_POPULAR).then((value) => moviePopular = value);
    Hive.openBox<Movie>(MOVIE_TOP_RATE).then((value) => movieTopRate = value);
    Hive.openBox<Movie>(MOVIE_UPCOMING).then((value) => movieUpcoming = value);

    Hive.openBox<TV>(TV_ON_AIR).then((value) => tvOnAir = value);
    Hive.openBox<TV>(TV_POPULAR).then((value) => tvPopular = value);
    Hive.openBox<TV>(TV_TOP_RATE).then((value) => tvTopRate = value);
  }

  Future<void> insertMovie(
      {List<Movie> movies,
      bool isPopuler,
      bool isTopRate,
      bool isUpcoming}) async {
    if (isPopuler) {
      moviePopular.clear().then((value) => moviePopular.addAll(movies));
    } else if (isTopRate) {
      movieTopRate.clear().then((value) => movieTopRate.addAll(movies));
    } else if (isUpcoming) {
      movieUpcoming.clear().then((value) => movieUpcoming.addAll(movies));
    }
  }

  Future<List<Movie>> getMovies(
      {bool isPopuler, bool isTopRate, bool isUpcoming}) async {
    List<Movie> data = [];
    if (isPopuler) {
      data = moviePopular.values.toList();
    } else if (isTopRate) {
      data = movieTopRate.values.toList();
    } else if (isUpcoming) {
      data = movieUpcoming.values.toList();
    }
    return data;
  }

  Future<void> insertTvMovie(
      {List<TV> movies,
      bool isPopuler = false,
      bool isOnAir = false,
      bool isTopRate = false}) async {
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
