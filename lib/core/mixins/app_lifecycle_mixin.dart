import 'package:boilerplate_riverpod/core/services/app_lifecycle/app_lifecycle_manager.dart';

mixin AppLifecycleMixin {
  final List<LifecycleCallback> _registeredCallbacks = [];

  void registerOnForeground(LifecycleCallback callback) {
    AppLifecycleManager.onForeground(callback);
    _registeredCallbacks.add(callback);
  }

  void registerOnBackground(LifecycleCallback callback) {
    AppLifecycleManager.onBackground(callback);
    _registeredCallbacks.add(callback);
  }

  void registerOnBeforeKill(LifecycleCallback callback) {
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
