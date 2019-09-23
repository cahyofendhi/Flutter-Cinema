import "dart:async";
import 'package:cinema_flt/data/env.dart';
import 'package:dio/dio.dart';

class Service {
  static final SUCCESS = 200;
  static final SUCCESS_CREATE = 201;
  static final ERROR_NOT_FOUND = 404;

  Dio dio;

  Service(this.dio);

  Future<Response> getSearchMovieList(
      [String query, int page, String group, String apiKey = API_KEY]) async {
    return await dio.get('/search/$group/', queryParameters: {
      'api_key': apiKey,
      'query': query,
      'page': page,
    });
  }

  Future<Response> getMovieList(
      [String group, int page, String apiKey = API_KEY]) async {
    return await dio.get('movie/$group', queryParameters: {
      'api_key': apiKey,
      'page': page,
    });
  }

  Future<Response> getMovieDetail(
      [int movieId, String apiKey = API_KEY]) async {
    return await dio.get('movie/$movieId', queryParameters: {
      'api_key': apiKey,
    });
  }

  Future<Response> getMovieMediaCredit(
      [int movieId, String apiKey = API_KEY]) async {
    return await dio.get('movie/$movieId/credits', queryParameters: {
      'api_key': apiKey,
    });
  }

  Future<Response> getMovieSimilar(
      [int movieId, String apiKey = API_KEY]) async {
    return await dio.get('movie/$movieId/similar', queryParameters: {
      'api_key': apiKey,
    });
  }

  Future<Response> getTvList(
      [String group, int page, String apiKey = API_KEY]) async {
    return await dio.get('tv/$group', queryParameters: {
      'api_key': apiKey,
      'page': page,
    });
  }
}
