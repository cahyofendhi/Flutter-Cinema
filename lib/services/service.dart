import "dart:async";
import 'package:cinema_flt/data/env.dart';
import 'package:cinema_flt/services/network_client.dart';
import 'package:dio/dio.dart';

class Service {
  static const SUCCESS = 200;
  static const SUCCESS_CREATE = 201;
  static const ERROR_NOT_FOUND = 404;

  NetworkClient client;

  Service(this.client);

  Future<Response> getSearchMovieList(
      [String query, int page, String group, String apiKey = API_KEY]) async {
    return await client.get(url: '/search/$group/', parameters: {
      'api_key': apiKey,
      'query': query,
      'page': page,
    });
  }

  Future<Response> getMovieList(
      [String group, int page, String apiKey = API_KEY]) async {
    return await client.get(url: 'movie/$group', parameters: {
      'api_key': apiKey,
      'page': page,
    });
  }

  Future<Response> getMovieDetail(
      [int movieId, String apiKey = API_KEY]) async {
    return await client.get(url: 'movie/$movieId', parameters: {
      'api_key': apiKey,
    });
  }

  Future<Response> getMovieMediaCredit(
      [int movieId, String apiKey = API_KEY]) async {
    return await client.get(url: 'movie/$movieId/credits', parameters: {
      'api_key': apiKey,
    });
  }

  Future<Response> getMovieSimilar(
      [int movieId, String apiKey = API_KEY]) async {
    return await client.get(url: 'movie/$movieId/similar', parameters: {
      'api_key': apiKey,
    });
  }

  Future<Response> getTvList(
      [String group, int page, String apiKey = API_KEY]) async {
    return await client.get(url: 'tv/$group', parameters: {
      'api_key': apiKey,
      'page': page,
    });
  }

  Future<Response> getTvDetail([int tvId, String apiKey = API_KEY]) async {
    return await client.get(url: '/tv/$tvId', parameters: {
      'api_key': apiKey,
    });
  }
}
