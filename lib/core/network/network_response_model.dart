import 'package:ecommerce_app/core/network/error_handling.dart';

sealed class Response<T> {}

class Success<T> extends Response<T> {
  final T data;

  Success({required this.data});
}

class FailureResponse<T> extends Response<T> {
  final Failure failure;

  FailureResponse({required this.failure});
}
