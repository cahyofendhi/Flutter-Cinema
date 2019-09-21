import 'package:cinema_flt/data/env.dart';
import 'package:dio/dio.dart';

class NetworkClient {
  static final CONNECTION_TIME_OUT = 5 * 1000;
  static final RECEIVE_TIME_OUT = 3 * 1000;

  Dio dio;

  NetworkClient() {
    dio = Dio(optionRequest());
    dio.interceptors.add(LogInterceptor());
  }

  static BaseOptions optionRequest() {
    return new BaseOptions(
      baseUrl: BASE_URL,
      connectTimeout: CONNECTION_TIME_OUT,
      receiveTimeout: RECEIVE_TIME_OUT,
    );
  }
}
