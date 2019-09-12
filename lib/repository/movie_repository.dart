import 'package:chopper/chopper.dart';
import 'package:cinema_flt/data/env.dart';
import 'package:cinema_flt/db/movie_db.dart';
import 'package:cinema_flt/db/movie_moor.dart';
import 'package:cinema_flt/models/movie/movie.dart';
import 'package:cinema_flt/models/movie/movies_result.dart';
import 'package:cinema_flt/models/service_model.dart';
import 'package:cinema_flt/services/service.dart';
import 'package:flutter/material.dart';
import 'package:moor_flutter/moor_flutter.dart';

enum MovieCategory { Upcoming, TopRate, Populer }

class MovieRepository {
  final Service _service;
  final MovieMoor _movieMoor;

  MovieRepository(@required service, @required movieMoor)
      : _service = service,
        _movieMoor = movieMoor;

  Future<ServiceModel> getUpcomingMovie(int page) async {
    ServiceModel result = await getMovie(MovieCategory.Upcoming, page);
    MoviesResult movies = result.model;
    await insertMovie(datas: movies.results, isUpcoming: true);
    return result;
  }

  Future<ServiceModel> getPopulerMovie(int page) async {
    return await getMovie(MovieCategory.Populer, page);
  }

  Future<ServiceModel> getTrendingMovie(int page) async {
    return await getMovie(MovieCategory.TopRate, page);
  }

  Future<ServiceModel> getMovie(MovieCategory category, int page) async {
    try {
      Response response =
          await _service.getMovieList(_getCategoryMovie(category), API_KEY, 1);
      if (response.isSuccessful) {
        return ServiceModel(model: MoviesResult.fromJson(response.body));
      } else {
        return ServiceModel(errorMessage: response.error.toString());
      }
    } catch (e) {
      print('Caught ${e.toString()}');
      return ServiceModel(errorMessage: e.toString());
    }
  }

  Future<void> insertMovie(
      {List<Movie> datas,
      bool isPopuler = false,
      bool isUpcoming = false,
      bool isTopRate = false}) async {
    // await _movieMoor.insertMovie(
    //     datas: datas,
    //     isPopuler: isPopuler,
    //     isTopRate: isTopRate,
    //     isUpcoming: isUpcoming);
    // await _movieMoor.getMovieList(isUpcoming: true).then((list) {
    //   print('Jumlah ${list.length}');
    // });
    await _movieMoor.getMovie(isUpcoming: true).then((list) {
      print('Final Result : ${list.length}');
    });
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
}
