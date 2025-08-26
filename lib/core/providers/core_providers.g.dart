// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$apiClientHash() => r'fa355bb49d025df6e1468ac0c5667c127a9a0077';

/// See also [apiClient].
@ProviderFor(apiClient)
final apiClientProvider = Provider<ApiClient>.internal(
  apiClient,
  name: r'apiClientProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$apiClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ApiClientRef = ProviderRef<ApiClient>;
String _$storageServiceHash() => r'62cbe9319bc400f2f78b16bce45d667585b592a2';

/// See also [storageService].
@ProviderFor(storageService)
final storageServiceProvider = Provider<StorageService>.internal(
  storageService,
  name: r'storageServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$storageServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef StorageServiceRef = ProviderRef<StorageService>;
String _$apiClientConfigHash() => r'e904915991f7f5477df793cadc833e21494d6201';

/// See also [apiClientConfig].
@ProviderFor(apiClientConfig)
final apiClientConfigProvider = AutoDisposeProvider<ApiClientConfig>.internal(
  apiClientConfig,
  name: r'apiClientConfigProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$apiClientConfigHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ApiClientConfigRef = AutoDisposeProviderRef<ApiClientConfig>;
String _$appLifecycleManagerHash() =>
    r'9f0ee8618560e529521bae6b59866895d168a5b6';

/// See also [appLifecycleManager].
@ProviderFor(appLifecycleManager)
final appLifecycleManagerProvider =
    AutoDisposeProvider<AppLifecycleManager>.internal(
      appLifecycleManager,
      name: r'appLifecycleManagerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$appLifecycleManagerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppLifecycleManagerRef = AutoDisposeProviderRef<AppLifecycleManager>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
