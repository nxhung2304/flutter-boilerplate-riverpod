import 'dart:io';
import 'package:boilerplate_riverpod/core/services/app_logger.dart';
import 'package:boilerplate_riverpod/core/services/env_configs/api_config.dart';
import 'package:boilerplate_riverpod/core/services/env_configs/app_config.dart';
import 'package:boilerplate_riverpod/core/services/env_configs/auth_config.dart';
import 'package:boilerplate_riverpod/core/services/env_configs/features_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Environment { development, staging, production, test }

class EnvConfig {
  static Environment _currentEnv = Environment.development;

  static final ApiConfig _apiConfig = ApiConfig();
  static final AppConfig _appConfig = AppConfig();
  static final AuthConfig _authConfig = AuthConfig();
  static final FeaturesConfig _featuresConfig = FeaturesConfig();

  static ApiConfig get api => _apiConfig;
  static AppConfig get app => _appConfig;
  static AuthConfig get auth => _authConfig;
  static FeaturesConfig get features => _featuresConfig;

  static Environment get currentEnv => _currentEnv;

  static bool get isDev => _currentEnv == Environment.development;
  static bool get isStaging => _currentEnv == Environment.staging;
  static bool get isProd => _currentEnv == Environment.production;
  static bool get isTest => _currentEnv == Environment.test;

  static Future<void> initialize(Environment env) async {
    _currentEnv = env;
    final String envFile = _getEnvFileName(env);

    try {
      await dotenv.load(fileName: envFile);

      _validateRequiredEnvVars();

      AppLogger.i('Environment loaded successfully: $envFile');
    } catch (e, stackTrace) {
      final errorMsg = 'Failed to initialize environment ($envFile): $e';
      AppLogger.e(errorMsg);
      AppLogger.e('Stack trace: $stackTrace');
      throw EnvironmentException(errorMsg, envFile, stackTrace);
    }
  }

  // MARK: - Private methods
  static void _validateRequiredEnvVars() {
    final required = ['API_BASE_URL'];

    final missing = <String>[];

    for (final key in required) {
      if (dotenv.env[key]?.isEmpty ?? true) {
        missing.add(key);
      }
    }

    if (missing.isNotEmpty) {
      throw EnvironmentValidationException(
        'Missing required environment variables: ${missing.join(', ')}',
        missing,
      );
    }
  }

  static String _getEnvFileName(Environment env) {
    switch (env) {
      case Environment.development:
        return '.env.development';
      case Environment.staging:
        return '.env.staging';
      case Environment.production:
        return '.env.production';
      case Environment.test:
        return '.env.test';
    }
  }
}

class EnvironmentException implements Exception {
  final String message;
  final String? envFile;
  final StackTrace? stackTrace;

  const EnvironmentException(this.message, [this.envFile, this.stackTrace]);

  @override
  String toString() => 'EnvironmentException: $message';
}

class EnvironmentValidationException extends EnvironmentException {
  final List<String> errors;

  const EnvironmentValidationException(super.message, this.errors);

  @override
  String toString() =>
      'EnvironmentValidationException: $message\nErrors: ${errors.join(', ')}';
}
