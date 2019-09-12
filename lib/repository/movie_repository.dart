import 'package:chopper/chopper.dart';
import 'package:cinema_flt/data/env.dart';
import 'package:cinema_flt/db/movie_moor.dart';
import 'package:cinema_flt/models/movie/movie.dart';
import 'package:cinema_flt/models/movie/movies_result.dart';
import 'package:cinema_flt/models/service_model.dart';
import 'package:cinema_flt/services/service.dart';

enum MovieCategory { Upcoming, TopRate, Populer }

class MovieRepository {
  final Service _service;
  final MovieMoor _movieMoor;

  MovieRepository(service, movieMoor)
      : _service = service,
        _movieMoor = movieMoor;

  Future<ServiceModel> getUpcomingMovie(int page) async {
    return await getMovie(MovieCategory.Upcoming, page);
  }

  Future<ServiceModel> getPopulerMovie(int page) async {
    return await getMovie(MovieCategory.Populer, page);
  }

  Future<ServiceModel> getTrendingMovie(int page) async {
    return await getMovie(MovieCategory.TopRate, page);
  }

  Future<ServiceModel> getMovie(MovieCategory category, int page) async {
    final ServiceModel result = ServiceModel();
    try {
      Response response =
          await _service.getMovieList(_getCategoryMovie(category), API_KEY, 1);
      if (response.isSuccessful) {
        MoviesResult mResult = MoviesResult.fromJson(response.body);
        result.model = mResult;
        await insertMovie(
            datas: mResult.results,
            isUpcoming: category == MovieCategory.Upcoming,
            isPopuler: category == MovieCategory.Populer,
            isTopRate: category == MovieCategory.TopRate);
      } else {
        result.errorMessage = response.error.toString();
        await getMovieFromDb(category).then((dt) => result.model = dt);
      }
    } catch (e) {
      result.errorMessage = e.toString();
      print('Caught ${e.toString()}');
      await getMovieFromDb(category).then((dt) => result.model = dt);
    }
    return result;
  }

  Future<void> insertMovie(
      {List<Movie> datas,
      bool isPopuler = false,
      bool isUpcoming = false,
      bool isTopRate = false}) async {
    _movieMoor.insertMovie(
        datas: datas,
        isPopuler: isPopuler,
        isTopRate: isTopRate,
        isUpcoming: isUpcoming);
  }

  String _getCategoryMovie(MovieCategory category) {
    switch (category) {
      case MovieCategory.Upcoming:
        return 'upcoming';
      case MovieCategory.Populer:
        return 'popular';
      case MovieCategory.TopRate:
        return 'top_rated';
      default:
        return 'upcoming';
    }
  }

  Future<MoviesResult> getMovieFromDb(MovieCategory category) async {
    List<Movie> data = [];
    await _movieMoor
        .getMovieList(
            isUpcoming: category == MovieCategory.Upcoming,
            isPopuler: category == MovieCategory.Populer,
            isToprate: category == MovieCategory.TopRate)
        .then((list) {
      data = MoviesResult.fromDb(list);
    });
    return MoviesResult(results: data);
  }
}
