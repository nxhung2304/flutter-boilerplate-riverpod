import 'package:boilerplate_riverpod/core/services/app_lifecycle/app_lifecycle_manager.dart';
import 'package:boilerplate_riverpod/core/services/app_logger.dart';

mixin AppLifecycleMixin {
  final List<LifecycleCallback> _registeredCallbacks = [];

  void registerOnForeground(LifecycleCallback callback) {
    AppLogger.i(callback.toString());
    AppLifecycleManager.onForeground(callback);
    _registeredCallbacks.add(callback);
  }

  void registerOnBackground(LifecycleCallback callback) {
    AppLogger.i(callback.toString());
    AppLifecycleManager.onBackground(callback);
    _registeredCallbacks.add(callback);
  }

  void registerOnBeforeKill(LifecycleCallback callback) {
    AppLogger.i(callback.toString());
    AppLifecycleManager.onBeforeKill(callback);
    _registeredCallbacks.add(callback);
  }

  void disposeLifecycleCallbacks() {
    for (final callback in _registeredCallbacks) {
      AppLifecycleManager.removeForegroundCallback(callback);
      AppLifecycleManager.removeBackgroundCallback(callback);
      AppLifecycleManager.removeBeforeKillCallback(callback);
    }
    _registeredCallbacks.clear();
  }
}
