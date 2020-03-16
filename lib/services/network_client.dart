import 'package:cinema_flt/data/env.dart';
import 'package:cinema_flt/services/app_exception.dart';
import 'package:dio/dio.dart';

class NetworkClient {
  static const CONNECTION_TIME_OUT = 5 * 1000;
  static const RECEIVE_TIME_OUT = 3 * 1000;

  Dio _dio;

  NetworkClient() {
    _dio = Dio(_optionRequest());
    _dio.interceptors.add(LogInterceptor());
  }

  BaseOptions _optionRequest() {
    return new BaseOptions(
      baseUrl: BASE_URL,
      connectTimeout: CONNECTION_TIME_OUT,
      receiveTimeout: RECEIVE_TIME_OUT,
    );
  }

  /// get
  /// String url, Map<String, dynamic> parameters
  Future<Response> get({String url, Map<String, dynamic> parameters}) async {
    return await _safeFetch(() => _dio.get(url, queryParameters: parameters));
  }

  /// post
  /// String url, dynamic formData
  Future<Response> post({String url, dynamic formData}) async {
    return await _safeFetch(() => _dio.post(url, data: formData));
  }

  /// delete
  /// String url, dynamic formData
  Future<Response> delete({String url, dynamic formData}) async {
    return await _safeFetch(() => _dio.delete(url, data: formData));
  }

  /// Wrap fetch (get/post) request with try-catch
  /// error handling
  Future<Response> _safeFetch(Future<Response> Function() tryFetch) async {
    Response response;
    try {
      response = await tryFetch();
    } catch (e) {
      _processError(e);
    }
    return response;
  }

  /// handling error
  void _processError(e) {
    if (e is DioError) {
      // Process DioError
      throw AppException(dioError: e);
    }
    throw UnknownException(message: e.toString());
  }
}
