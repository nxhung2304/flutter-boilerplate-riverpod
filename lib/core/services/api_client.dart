import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:boilerplate_riverpod/core/exceptions/network_exception.dart';
import 'package:boilerplate_riverpod/core/services/interceptors/auth_intercepter.dart';
import 'package:boilerplate_riverpod/core/services/interceptors/logging_intercepter.dart';
import 'package:boilerplate_riverpod/core/services/network_connectivity.dart';
import 'package:boilerplate_riverpod/core/services/token_storage_service.dart';

class ApiClient {
  late final Dio _dio;
  late final NetworkConnectivity networkConnectivity;
  late final TokenStorageService tokenStorageService;

  final String baseUrl;
  final Ref ref;
  final Duration connectTimeout;
  final Duration receiveTimeout;

  ApiClient({
    required this.baseUrl,
    required this.ref,
    this.connectTimeout = const Duration(seconds: 30),
    this.receiveTimeout = const Duration(seconds: 30),
  }) {
    tokenStorageService = TokenStorageService();
    networkConnectivity = NetworkConnectivity();
    _initializedDio();
    _setupInterceptors();
  }

  _initializedDio() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
  }

  void _setupInterceptors() {
    final loggingInterceptor = LoggingInterceptor(enableLogging: true);

    final authInterceptor = AuthInterceptor(
      ref: ref,
      tokenStorageService: tokenStorageService,
      dio: _dio,
    );

    _dio.interceptors.addAll([authInterceptor, loggingInterceptor]);
  }

  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      await _checkNetwork();
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      await _checkNetwork();

      final response = await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );

      return response;
    } on NetworkException {
      rethrow;
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _checkNetwork() async {
    final bool isConnectedNetwork = await networkConnectivity.isConnected();
    if (isConnectedNetwork) {
      return;
    }

    throw NetworkException.notConnected();
  }

  Future<Response> put(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      await _checkNetwork();

      final response = await _dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> patch(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      await _checkNetwork();
      
      final response = await _dio.patch(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on NetworkException {
      rethrow;
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      await _checkNetwork();
      
      final response = await _dio.delete(
        endpoint,
        queryParameters: queryParameters,
      );
      return response;
    } on NetworkException {
      rethrow;
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  void clearAuthHeaders() {
    _dio.options.headers.remove('access-token');
    _dio.options.headers.remove('client');
    _dio.options.headers.remove('uid');
    _dio.options.headers.remove('token-type');
  }
}
