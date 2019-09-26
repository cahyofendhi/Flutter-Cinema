import 'package:cinema_flt/models/movie/movies_result.dart';
import 'package:cinema_flt/models/service_model.dart';
import 'package:cinema_flt/repository/movie_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class MovieSearchBloc {
  final MovieRepository _movieRepository;

  MovieSearchBloc({@required movieRepository})
      : _movieRepository = movieRepository;

  final BehaviorSubject<MoviesResult> _movieController =
      BehaviorSubject<MoviesResult>();

  //! output
  BehaviorSubject<MoviesResult> get movies => _movieController;

  // input
  Function(MoviesResult) get setDataMovie => _movieController.sink.add;

  getMovie(String query, int page) async {
    try {
      ServiceModel result = await _movieRepository.getSearchMovie(query, page);
      if (result.isSuccess) {
        setDataMovie(result.model);
      }
    } catch (err) {
      print('Error VM : ${err.toString()}');
    }
  }

  dispose() {
    _movieController.close();
  }

}
