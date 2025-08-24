import 'package:dio/dio.dart';
import 'package:boilerplate_riverpod/core/services/app_logger.dart';

class LoggingInterceptor extends Interceptor {
  final bool enableLogging;

  LoggingInterceptor({this.enableLogging = true});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (enableLogging) {
      _logRequest(options);
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (enableLogging) {
      _logResponse(response);
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (enableLogging) {
      _logError(err);
    }

    super.onError(err, handler);
  }

  void _logRequest(RequestOptions options) {
    AppLogger.d("[${options.method}] ${options.uri}");
  }

  void _logResponse(Response response) {
    AppLogger.d(
      "[${response.statusCode}] ${response.requestOptions.path}",
    );
  }

  void _logError(DioException error) {
    AppLogger.e(
      "[${error.requestOptions.method}] ${error.requestOptions.path}",
    );
  }
}
