import 'package:chopper/chopper.dart';
import 'package:cinema_flt/data/constant.dart';
import 'package:cinema_flt/models/movie/movies_result.dart';
import 'package:cinema_flt/services/service.dart';
import 'package:flutter/material.dart';

enum MovieCategory { Upcoming, TopRate, Populer }

class MovieRepository {
  // final Service _service;

  MovieRepository();

  Future<MoviesResult> getUpcomingMovie(int page) async {
    Response response;
    try {
      final _service = Service.create();
      response = await _service.getUpcomingMovie(
          _getCategoryMovie(MovieCategory.Upcoming), API_KEY, 1);
    } catch (e) {
      print('Caught ${e.toString()}');
    }
    if (response == null) {
      return null;
    }
    if (response.isSuccessful) {
      return MoviesResult.fromJson(response.body);
    }
    return null;
  }

  String _getCategoryMovie(MovieCategory category) {
    switch (category) {
      case MovieCategory.Upcoming:
        return 'upcoming';
      case MovieCategory.Populer:
        return 'populer';
      case MovieCategory.TopRate:
        return 'top_rated';
      default:
        return 'upcoming';
    }
  }
}
