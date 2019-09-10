import 'dart:async';
import 'package:flutter/foundation.dart';

import 'package:cinema_flt/models/movie/movies_result.dart';
import 'package:cinema_flt/repository/movie_repository.dart';

class HomeBloc {
  final MovieRepository _movieRepository;

  final _upcomingController = StreamController<MoviesResult>.broadcast();
  final _populerController = StreamController<MoviesResult>.broadcast();
  final _trendingController = StreamController<MoviesResult>.broadcast();

  // output
  Stream<MoviesResult> get upcomingMovies => _upcomingController.stream;
  Stream<MoviesResult> get populerMovies => _populerController.stream;
  Stream<MoviesResult> get trendingMovies => _trendingController.stream;

  HomeBloc({@required movieRepository}) : _movieRepository = movieRepository;

  void getAllCategoryMovie() {
    getUpcomingMovie(1);
    getPopulerMovie(1);
    getTrendingMovie(1);
  }

  void getUpcomingMovie([int page = 1]) async {
    try {
      MoviesResult result = await _movieRepository.getUpcomingMovie(page);
      _upcomingController.sink.add(result);
    } catch (err) {
      print('Error : ${err.toString()}');
    }
  }

  void getPopulerMovie([int page = 1]) async {
    try {
      MoviesResult result = await _movieRepository.getPopulerMovie(page);
      _populerController.sink.add(result);
    } catch (err) {
      print('Error : ${err.toString()}');
    }
  }

  void getTrendingMovie([int page = 1]) async {
    try {
      MoviesResult result = await _movieRepository.getTrendingMovie(page);
      _trendingController.sink.add(result);
    } catch (err) {
      print('Error : ${err.toString()}');
    }
  }

  void dispose() {
    _upcomingController.close();
  }
}
