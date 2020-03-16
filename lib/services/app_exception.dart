import 'dart:convert';

import 'package:dio/dio.dart';

class AppException {
  AppException({this.dioError});
  final DioError dioError;

  String toString() {
    return "AppException :\n" +
        jsonEncode({
          'message': dioError.message,
          'request': dioError.request.toString(),
          'response': dioError.response.toString(),
        });
  }
}

class UnknownException {
  UnknownException({this.message});
  final String message;
}