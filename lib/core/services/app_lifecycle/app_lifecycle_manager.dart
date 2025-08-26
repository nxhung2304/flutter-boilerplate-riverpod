import 'package:boilerplate_riverpod/core/services/app_logger.dart';
import 'package:flutter/services.dart';

enum AppLifecycleState { onForeground, onBackground, onBeforeKill }

typedef LifecycleCallback = void Function();

class AppLifecycleManager {
  static const MethodChannel _channel = MethodChannel('app_lifecycle_manager');
  static final List<Function> _foregroundCallbacks = [];
  static final List<Function> _backgroundCallbacks = [];
  static final List<Function> _beforeKillCallbacks = [];

  static bool _isInitialized = false;

  static Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      _channel.setMethodCallHandler(_handleNativeCall);
      _isInitialized = true;
      print('AppLifecycleManager initialized successfully');
    } catch (e) {
      print('Error initializing AppLifecycleManager: $e');
    }
  }

  static Future<void> _handleNativeCall(MethodCall call) async {
    switch (call.method) {
      case "onForeground":
        AppLogger.i("onForeground");
        for (final callback in _foregroundCallbacks) {
          callback();
        }
        break;
      case "onBackground":
        AppLogger.i("onBackground");
        for (final callback in _backgroundCallbacks) {
          callback();
        }
        break;
      case "onBeforeKill":
        AppLogger.i("onBeforeKill");
        for (final callback in _beforeKillCallbacks) {
          callback();
        }
        break;

      default:
        AppLogger.e("Unknown method: ${call.method}");
    }
  }

  static void onForeground(Function callback) {
    AppLogger.i(callback.toString());
    if (!_foregroundCallbacks.contains(callback)) {
      _foregroundCallbacks.add(callback);
    }
  }

  static void onBackground(Function callback) {
    AppLogger.i(callback.toString());
    if (!_backgroundCallbacks.contains(callback)) {
      _backgroundCallbacks.add(callback);
    }
  }

  static void onBeforeKill(Function callback) {
    AppLogger.i(callback.toString());
    if (!_beforeKillCallbacks.contains(callback)) {
      _beforeKillCallbacks.add(callback);
    }
  }

  static void removeForegroundCallback(LifecycleCallback callback) {
    _foregroundCallbacks.remove(callback);
  }

  static void removeBackgroundCallback(LifecycleCallback callback) {
    _backgroundCallbacks.remove(callback);
  }

  static void removeBeforeKillCallback(LifecycleCallback callback) {
    _beforeKillCallbacks.remove(callback);
  }

  static void clearAllCallbacks() {
    _foregroundCallbacks.clear();
    _backgroundCallbacks.clear();
    _beforeKillCallbacks.clear();
  }

  static void dispose() {
    clearAllCallbacks();
    _isInitialized = false;
  }
}
