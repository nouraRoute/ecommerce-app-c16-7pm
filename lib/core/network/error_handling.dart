import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  final int? errorCode;

  Failure({required this.errorMessage, this.errorCode});
  @override
  String toString() {
    return errorMessage;
  }

  static Failure handelError(e) {
    if (e is Failure) {
      return e;
    } else if (e is DioException) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.cancel:
          return NetworkError(
              errorMessage: 'week network connection',
              errorCode: e.response?.statusCode);
        case DioExceptionType.badCertificate:
        case DioExceptionType.unknown:
          return NetworkError(
              errorMessage: 'server error', errorCode: e.response?.statusCode);
        case DioExceptionType.badResponse:
          return NetworkError(
              errorMessage: e.response?.data != null
                  ? e.response?.data['message'] ?? 'some thing went wrong'
                  : 'some thing went wrong',
              errorCode: e.response?.statusCode);

        case DioExceptionType.connectionError:
          return NetworkError(
              errorMessage: 'no network connection',
              errorCode: e.response?.statusCode);
      }
    } else {
      return FailureModel(errorMessage: 'errorMessage', errorCode: 0);
    }
  }
}

class AuthError extends Failure {
  AuthError({required super.errorMessage, super.errorCode});
}

class NetworkError extends Failure {
  NetworkError({required super.errorMessage, super.errorCode});
}

class FailureModel extends Failure {
  FailureModel({required super.errorMessage, super.errorCode});
}
