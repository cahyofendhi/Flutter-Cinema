import 'package:cinema_flt/services/app_exception.dart';
import 'package:dio/dio.dart';

class ServiceModel<T> {
  T? data;
  String message = '';
  String errorMessage = '';
  bool isSuccess = false;

  ServiceModel({this.data, this.errorMessage = '', this.message = ''}) {
    this.isSuccess = errorMessage.isEmpty || data != null;
  }

  ServiceModel.fromResponse(Response response, T dataResponse) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      this.data = dataResponse;
    }
  }

  static Future<ServiceModel> fetch<T>(Future<T> Function() fetch) async {
    ServiceModel serviceModel = ServiceModel();
    try {
      serviceModel.data = await fetch();
    } catch (e) {
      serviceModel.errorMessage =
          e is AppException ? e.toString() : e.toString();
    }
    return serviceModel;
  }
}
