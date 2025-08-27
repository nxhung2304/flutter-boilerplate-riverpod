import 'package:boilerplate_riverpod/core/services/app_lifecycle/app_lifecycle_manager.dart';
import 'package:boilerplate_riverpod/core/services/env_config.dart';
import 'package:boilerplate_riverpod/core/services/firebase/analytics_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:boilerplate_riverpod/core/services/api_client.dart';
import 'package:boilerplate_riverpod/core/services/storage_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'core_providers.g.dart';

@Riverpod(keepAlive: true)
ApiClient apiClient(Ref ref) {
  final baseUrl = EnvConfig.api.baseUrl;

  return ApiClient(baseUrl: baseUrl, ref: ref);
}

@Riverpod(keepAlive: true)
StorageService storageService(Ref ref) {
  return StorageService();
}

@riverpod
AppLifecycleManager appLifecycleManager(Ref ref) {
  return AppLifecycleManager();
}

@riverpod
AnalyticsService analyticsService(Ref ref) {
  return AnalyticsService();
}
