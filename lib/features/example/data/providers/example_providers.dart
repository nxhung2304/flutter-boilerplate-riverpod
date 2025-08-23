import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:boilerplate_riverpod/core/models/api_response.dart';
import 'package:boilerplate_riverpod/core/providers/core_providers.dart';
import 'package:boilerplate_riverpod/features/example/data/datasources/example_local_datasource.dart';
import 'package:boilerplate_riverpod/features/example/data/datasources/example_remote_datasource.dart';
import 'package:boilerplate_riverpod/features/example/data/models/example.dart';
import 'package:boilerplate_riverpod/features/example/data/repositories/example_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'example_providers.g.dart';

@riverpod
ExampleLocalDataSource exampleLocalDataSource(Ref ref) {
  return ExampleLocalDataSource(
      storageService: ref.read(storageServiceProvider));
}

@riverpod
ExampleRemoteDataSource exampleRemoteDataSource(Ref ref) {
  return ExampleRemoteDataSource(apiClient: ref.read(apiClientProvider));
}

@riverpod
ExampleRepository exampleRepository(Ref ref) {
  final local = ref.watch(exampleLocalDataSourceProvider);
  final remote = ref.watch(exampleRemoteDataSourceProvider);

  return ExampleRepository(localDataSource: local, remoteDataSource: remote);
}

final exampleByIdProvider = FutureProvider.family<ApiResponse<Example>, int>((
  ref,
  id,
) {
  return ref.read(exampleRepositoryProvider).getById(id);
});
