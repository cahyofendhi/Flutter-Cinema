import 'package:chopper/chopper.dart';
import 'package:cinema_flt/data/env.dart';
import 'package:cinema_flt/models/movie/movies_result.dart';
import 'package:cinema_flt/services/service.dart';
import 'package:flutter/material.dart';

enum MovieCategory { Upcoming, TopRate, Populer }

class MovieRepository {
  final Service _service;

  MovieRepository(@required service) : _service = service;

  Future<MoviesResult> getUpcomingMovie(int page) async {
    Response response = await getMovie(MovieCategory.Upcoming, 1);
    if (response == null) return null;
    if (response.isSuccessful) {
      return MoviesResult.fromJson(response.body);
    }
    return null;
  }

  Future<MoviesResult> getPopulerMovie(int page) async {
    Response response = await getMovie(MovieCategory.Populer, 1);
    if (response == null) return null;
    if (response.isSuccessful) {
      return MoviesResult.fromJson(response.body);
    }
    return null;
  }

  Future<MoviesResult> getTrendingMovie(int page) async {
    Response response = await getMovie(MovieCategory.TopRate, 1);
    if (response == null) return null;
    if (response.isSuccessful) {
      return MoviesResult.fromJson(response.body);
    }
    return null;
  }

  Future<Response> getMovie(MovieCategory category, int page) async {
    Response response;
    try {
      response =
          await _service.getMovieList(_getCategoryMovie(category), API_KEY, 1);
    } catch (e) {
      print('Caught ${e.toString()}');
    }
    return response;
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
