import 'dart:async';
import 'package:cinema_flt/models/service_model.dart';
import 'package:cinema_flt/utils/request_state.dart';
import 'package:flutter/foundation.dart';

import 'package:cinema_flt/models/movie/movies_result.dart';
import 'package:cinema_flt/repository/movie_repository.dart';
import 'package:rxdart/subjects.dart';

class HomeBloc {
  final MovieRepository _movieRepository;

  // movie controller
  final _upcomingController = BehaviorSubject<MoviesResult>();
  final _populerController = BehaviorSubject<MoviesResult>();
  final _trendingController = BehaviorSubject<MoviesResult>();

  // state controller
  final _statePopuler = BehaviorSubject<UiState>();

  // state output
  Stream<UiState> get statePopuler => _statePopuler.stream;

  // output
  Stream<MoviesResult> get upcomingMovies => _upcomingController.stream;
  Stream<MoviesResult> get populerMovies => _populerController.stream;
  Stream<MoviesResult> get trendingMovies => _trendingController.stream;
  
  dynamic get changeUpcoming => _upcomingController.sink.add;
  dynamic get changePopular => _populerController.sink.add;
  dynamic get changeTrending => _trendingController.sink.add;
  Function(UiState) get setStatePopuler => _statePopuler.sink.add;

  HomeBloc({@required movieRepository}) : _movieRepository = movieRepository;

  /// get all movie
  void getAllCategoryMovie() {
    getUpcomingMovie(1);
    getPopulerMovie(1);
    getTrendingMovie(1);
  }

  /// get upcoming movie
  void getUpcomingMovie([int page = 1]) {
    setStatePopuler(UiState(RequestState.LOADING));
    _movieRepository.getUpcomingMovie(page)
    .then((value) =>  changeUpcoming(value.data))
    .catchError((er) {
      print('error = ${er.toString()}');
      setStatePopuler(UiState(RequestState.ERROR));
    })
    .whenComplete(() => setStatePopuler(UiState(RequestState.DONE)));
  }

  /// get popular movie
  void getPopulerMovie([int page = 1]) async {
    _movieRepository.getPopulerMovie(page)
    .then((value) => changePopular(value.data))
    .catchError((err) => print('Error Populer : ${err.toString()}'));
  }

  /// get trending movie
  void getTrendingMovie([int page = 1]) async {
    _movieRepository.getTrendingMovie(page)
    .then((value) => changeTrending(value.data))
    .catchError((err) => print('Error : ${err.toString()}'));
  }

  /// dispose controller
  void dispose() {
    _upcomingController.close();
    _populerController.close();
    _trendingController.close();
    _statePopuler.close();
  }
}
