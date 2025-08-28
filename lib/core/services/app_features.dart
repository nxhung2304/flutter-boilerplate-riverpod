import 'package:boilerplate_riverpod/core/services/env_config.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:boilerplate_riverpod/core/services/app_logger.dart';
import 'package:flutter/foundation.dart';

class AppFeatures {
  static bool _isInitialized = false;

  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      AppLogger.i('Starting initialization');

      await _initializeCrashlytics();

      _isInitialized = true;
      AppLogger.i('initialized successfully');
    } catch (e, stackTrace) {
      AppLogger.e('Failed to initialize', error: e, stackTrace: stackTrace);
    }
  }

  Future<void> _initializeCrashlytics() async {
    if (kIsWeb) {
      AppLogger.i('Crashlytics not supported on Web');
      return;
    }

    final enabledCrashlytics = EnvConfig.features.enabledCrashlytics;

    AppLogger.i(
      'Initializing Crashlytics',
      data: {'enabled': enabledCrashlytics},
    );

    try {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(
        enabledCrashlytics,
      );

      if (!enabledCrashlytics) {
        AppLogger.i('Crashlytics disabled by configuration');
        return;
      }

      AppLogger.i('Crashlytics enabled and configured');
    } catch (e, stackTrace) {
      AppLogger.e(
        'Failed to initialize Crashlytics',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }
}
