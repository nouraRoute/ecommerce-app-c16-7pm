import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/web.dart';

@module
abstract class NetworkModule {
  @singleton
  Dio getDio() {
    Logger logger = Logger();
    Dio dio = Dio();
    BaseOptions options = BaseOptions(
        baseUrl: AppConstants.baseUrl,
        sendTimeout: Duration(seconds: 5),
        receiveTimeout: Duration(seconds: 5));
    dio.options = options;
    dio.interceptors.add(InterceptorsWrapper(
      // onRequest: (options, handler) {
      //   logger.t(
      //       "Url:[${options.method}] ${options.uri}\nbody:${options.data}\nHeaders:${options.headers}");
      // },
      // onResponse: (response, handler) {
      //   logger.i(
      //       "Url:[${options.method}] ${response.realUri}\nbody:${response.data}\nHeaders:${response.headers}");
      // },
      onError: (error, handler) => logger.e(
          "Url:[${options.method}] ${error.requestOptions.uri}\nbody:${error.requestOptions.data}\nHeaders:${error.requestOptions.headers}"),
    ));
    return dio;
  }
}
