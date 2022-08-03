// import 'package:cinema_flt/db/movie_moor.dart';
import 'package:cinema_flt/models/media_credit.dart';
import 'package:cinema_flt/models/movie/movie.dart';
import 'package:cinema_flt/models/movie/movies_result.dart';
import 'package:cinema_flt/models/service_model.dart';
import 'package:cinema_flt/models/similar_result.dart';
import 'package:cinema_flt/repository/database_repository.dart';
import 'package:cinema_flt/services/service.dart';

import 'group.dart';

enum MovieCategory { Upcoming, TopRate, Populer }

class MovieRepository {
  final Service _service;
  final DatabaseRepository _databaseRepository;

  MovieRepository(service, databaseRepository)
      : _service = service,
        _databaseRepository = databaseRepository;

  Stream<ServiceModel> getUpcomingMovie(int page) async* {
    await for (ServiceModel result in getMovie(MovieCategory.Upcoming, page)) {
      yield result;
    }
  }

  Stream<ServiceModel> getPopulerMovie(int page) async* {
    await for (ServiceModel result in getMovie(MovieCategory.Populer, page)) {
      yield result;
    }
  }

  Stream<ServiceModel> getTrendingMovie(int page) async* {
    await for (ServiceModel result in getMovie(MovieCategory.TopRate, page)) {
      yield result;
    }
  }

  Stream<ServiceModel> getMovie(MovieCategory category, int page) async* {
    final _serviceResult = ServiceModel<MoviesResult>();
    if (page == 1) {
      final _resultDb = await getMovieFromDb(category);
      _serviceResult.data = _resultDb;
      yield _serviceResult;
    }
    try {
      final response =
          await _service.getMovieList(_getCategoryMovie(category), page: 1);
      final _result = MoviesResult.fromJson(response!.data!);

      await insertMovie(
          datas: _result.results,
          isUpcoming: category == MovieCategory.Upcoming,
          isPopuler: category == MovieCategory.Populer,
          isTopRate: category == MovieCategory.TopRate);
      _serviceResult.data = _result;
      yield _serviceResult;
    } catch (e) {
      _serviceResult.errorMessage = e.toString();
      yield _serviceResult;
    }
  }

  Future<void> insertMovie({
    required List<Movie> datas,
    bool isPopuler = false,
    bool isUpcoming = false,
    bool isTopRate = false,
  }) async {
    _databaseRepository.insertMovie(
        movies: datas,
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
    try {
      final dataDb = await _databaseRepository.getMovies(
          isUpcoming: category == MovieCategory.Upcoming,
          isPopuler: category == MovieCategory.Populer,
          isTopRate: category == MovieCategory.TopRate);
      data.addAll(dataDb);
    } catch (er) {
      print('Error Movie DB : ${er.toString()}');
      throw er;
    }
    return MoviesResult(results: data);
  }

  // search movie
  Future<ServiceModel> getSearchMovie(String query, int page) async {
    final data = await ServiceModel.fetch<MoviesResult>(() async {
      final response = await _service.getSearchMovieList(
        query: query,
        page: page,
        group: getRequestType(RequestType.Movie),
      );
      return MoviesResult.fromJson(response?.data);
    });
    return data;
  }

  //! ================ movie detail =================
  Future<ServiceModel> getMovieDetail(int movieId) async {
    final data = await ServiceModel.fetch<Movie>(() async {
      final response = await _service.getMovieDetail(movieId: movieId);
      return Movie.fromDetailJson(response?.data);
    });
    return data;
  }

  Future<ServiceModel> getMovieMediaCredit(int movieId) async {
    final data = await ServiceModel.fetch<MediaCredit>(() async {
      final response = await _service.getMovieMediaCredit(movieId: movieId);
      return MediaCredit.fromJson(response?.data);
    });
    return data;
  }

  Future<ServiceModel> getMovieSimilar(int movieId) async {
    final data = await ServiceModel.fetch<SimilarResult>(() async {
      final response = await _service.getMovieSimilar(movieId: movieId);
      return SimilarResult.fromJson(response?.data);
    });
    return data;
  }
}
