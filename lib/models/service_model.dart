

class ServiceModel<T> {
  T model;
  String message = '';
  String errorMessage = '';
  bool isSuccess;

  ServiceModel(
      {this.model, this.errorMessage = '', this.message = ''}) {
        this.isSuccess = errorMessage.isEmpty || model != null;
      }
}
