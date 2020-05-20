import 'package:cinema_flt/data/constant.dart';
import 'package:cinema_flt/models/movie/movie.dart';
import 'package:hive/hive.dart';

class DatabaseRepository {
  Box<Movie> moviePopular;
  Box<Movie> movieTopRate;
  Box<Movie> movieUpcoming;

  DatabaseRepository() {
    Hive.openBox<Movie>(MOVIE_POPULAR).then((value) => moviePopular = value);
    Hive.openBox<Movie>(MOVIE_TOP_RATE).then((value) => movieTopRate = value);
    Hive.openBox<Movie>(MOVIE_UPCOMING).then((value) => movieUpcoming = value);
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
}
