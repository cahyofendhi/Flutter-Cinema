import 'package:chopper/chopper.dart';
import 'package:cinema_flt/data/env.dart';
import 'package:cinema_flt/models/movie/movies_result.dart';
import 'package:cinema_flt/models/service_model.dart';
import 'package:cinema_flt/services/service.dart';
import 'package:flutter/material.dart';

enum MovieCategory { Upcoming, TopRate, Populer }

class MovieRepository {
  final Service _service;

  MovieRepository(@required service) : _service = service;

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
    try {
      Response response = await _service.getMovieList(_getCategoryMovie(category), API_KEY, 1);
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
