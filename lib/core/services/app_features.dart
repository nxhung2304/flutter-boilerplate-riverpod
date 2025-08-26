import 'package:boilerplate_riverpod/core/config/enviroment.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:boilerplate_riverpod/core/services/app_logger.dart';

class AppFeatures {
  static bool _isInitialized = false;

  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      AppLogger.i('Starting AppFeatures initialization');

      await _initializeCrashlytics();

      _isInitialized = true;
      AppLogger.i('AppFeatures initialized successfully');
    } catch (e, stackTrace) {
      AppLogger.e(
        'Failed to initialize AppFeatures',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> _initializeCrashlytics() async {
    final enabledCrashlytics = Environment.enabledCrashtics;

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
