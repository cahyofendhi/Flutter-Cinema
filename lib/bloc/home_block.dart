import 'dart:async';
import 'package:cinema_flt/models/service_model.dart';
import 'package:cinema_flt/utils/request_state.dart';
import 'package:flutter/foundation.dart';

import 'package:cinema_flt/models/movie/movies_result.dart';
import 'package:cinema_flt/repository/movie_repository.dart';

class HomeBloc {
  final MovieRepository _movieRepository;

  // movie controller
  final _upcomingController = StreamController<MoviesResult>.broadcast();
  final _populerController = StreamController<MoviesResult>.broadcast();
  final _trendingController = StreamController<MoviesResult>.broadcast();

  // state controller
  final _statePopuler = StreamController<UiState>.broadcast();

  // state output
  Stream<UiState> get statePopuler => _statePopuler.stream;

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
      _setStatePopuler(UiState(RequestState.LOADING));
      ServiceModel result = await _movieRepository.getUpcomingMovie(page);
      if (result.isSuccess) {
        _upcomingController.sink.add(result.model);
      }
      _setStatePopuler(UiState(RequestState.DONE));
    } catch (err) {
      print('Error Upcoming : ${err.toString()}');
      _setStatePopuler(UiState(RequestState.ERROR));
    }
  }

  void _setStatePopuler(UiState state) {
    _statePopuler.sink.add(state);
  }

  void getPopulerMovie([int page = 1]) async {
    try {
      ServiceModel result = await _movieRepository.getPopulerMovie(page);
      _populerController.sink.add(result.model);
    } catch (err) {
      print('Error Populer : ${err.toString()}');
    }
  }

  void getTrendingMovie([int page = 1]) async {
    try {
      ServiceModel result = await _movieRepository.getTrendingMovie(page);
      _trendingController.sink.add(result.model);
    } catch (err) {
      print('Error : ${err.toString()}');
    }
  }

  void dispose() {
    _upcomingController.close();
  }
}
