

import 'dart:async';

import 'package:cinema_flt/models/media_credit.dart';
import 'package:cinema_flt/models/movie/movie.dart';
import 'package:cinema_flt/models/service_model.dart';
import 'package:cinema_flt/models/similar_result.dart';
import 'package:cinema_flt/repository/movie_repository.dart';
import 'package:cinema_flt/utils/request_state.dart';
import 'package:moor_flutter/moor_flutter.dart';

class MovieDetailBloc {

  final MovieRepository _movieRepository;

  final _movieController = StreamController<Movie>.broadcast();
  final _movieCreditsController = StreamController<MediaCredit>.broadcast();
  final _movieSimilarController = StreamController<SimilarResult>.broadcast();
  final _uiStateMovieController = StreamController<UiState>.broadcast();

  Stream<Movie> get movie => _movieController.stream;
  Stream<UiState> get stateMovie => _uiStateMovieController.stream;
  Stream<MediaCredit> get movieCredit => _movieCreditsController.stream;
  Stream<SimilarResult> get movieSimilar => _movieSimilarController.stream;

  Function(Movie) get setDataMovie => _movieController.sink.add;
  Function(UiState) get setUiStateMovie => _uiStateMovieController.sink.add;

  Function(MediaCredit) get setMovieMedia => _movieCreditsController.sink.add;
  Function(SimilarResult) get setSimilarMovie => _movieSimilarController.sink.add;


  MovieDetailBloc({@required movieRepository}) : _movieRepository = movieRepository;

  void getMovieDetail(int movieId) async {
    try {
      ServiceModel result = await _movieRepository.getMovieDetail(movieId);
      if (result.isSuccess) {
        Movie mv = result.data;
        print('Movie : ${mv.originalTitle}');
        setDataMovie(mv);
      }
      setUiStateMovie(UiState(RequestState.DONE));
    } catch (err) {
      print('Error Movie Detail : ${err.toString()}');
      setUiStateMovie(UiState(RequestState.ERROR));
    }
  }

  void getMediaCredit(int movieId) async {
    try {
      ServiceModel result = await _movieRepository.getMovieMediaCredit(movieId);
      if (result.isSuccess) {
        MediaCredit data = result.data;
        setMovieMedia(data);
      }
    } catch (err) {
      print('Error Media : $err');
    }
  }

  void getSimilarMovie(int movieId) async {
    try {
      ServiceModel result = await _movieRepository.getMovieSimilar(movieId);
      if (result.isSuccess) {
        SimilarResult data = result.data;
        setSimilarMovie(data);
      }
    } catch (err) {
      print('Error Media : $err');
    }
  }

  void dispose() {
    _movieController.close();
    _movieCreditsController.close();
    _movieSimilarController.close();
    _uiStateMovieController.close();
  }

}