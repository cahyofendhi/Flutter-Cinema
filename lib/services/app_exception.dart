import 'dart:convert';

import 'package:dio/dio.dart';

class AppException {
  AppException({required this.dioError});
  final DioError dioError;

  String toString() {
    return "AppException :\n" +
        jsonEncode({
          'message': dioError.message,
          'request': dioError.requestOptions.toString(),
          'response': dioError.response.toString(),
        });
  }
}

class UnknownException {
  UnknownException({required this.message});
  final String message;
}
