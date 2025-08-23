import 'package:boilerplate_riverpod/core/models/api_response.dart';
import 'package:boilerplate_riverpod/features/example/data/models/example.dart';
import 'package:boilerplate_riverpod/features/example/data/models/params/example_params.dart';
import 'package:boilerplate_riverpod/features/example/data/providers/example_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'example_controller.g.dart';

@riverpod
class ExampleController extends _$ExampleController {
  @override
  Future<List<Example>> build() async {
    final repository = ref.read(exampleRepositoryProvider);
    final response = await repository.all();

    if (response.isSuccess && response.data != null) {
      return response.data!;
    } else {
      throw Exception(response.error ?? 'Failed to load Examples');
    }
  }

  Future<ApiResponse<bool>> createExample(ExampleParams exampleParams) async {
    state = const AsyncLoading();
    try {
      final repository = ref.read(exampleRepositoryProvider);

      final response = await repository.create(exampleParams);

      if (response.isSuccess) {
        ref.invalidateSelf();

        return ApiSuccess(true);
      } else {
        return ApiError(response.error.toString());
      }
    } catch (e) {
      return ApiError(e.toString());
    }
  }

  Future<ApiResponse<bool>> updateExample(
    int exampleId,
    ExampleParams ExampleParams,
  ) async {
    state = const AsyncLoading();

    try {
      final repository = ref.read(exampleRepositoryProvider);
      final response = await repository.update(exampleId, ExampleParams);

      if (response.isSuccess && response.data != null) {
        final currentExamples = state.valueOrNull ?? [];

        final updatedExample = response.data!;

        final updatedExamples = currentExamples
            .map((example) =>
                example.id == updatedExample.id ? updatedExample : example)
            .toList();

        state = AsyncValue.data(updatedExamples);

        return ApiSuccess(true);
      } else {
        final errorMessage = response.error ?? 'Update failed';
        state = AsyncError(Exception(errorMessage), StackTrace.current);

        return ApiError(errorMessage);
      }
    } catch (e) {
      state = AsyncError(e, StackTrace.current);

      return ApiError(e.toString());
    }
  }

  Future<ApiResponse<bool>> toggleExample(int id) async {
    try {
      final repository = ref.read(exampleRepositoryProvider);
      final response = await repository.toggleExample(id);

      if (response.isSuccess) {
        ref.invalidateSelf();

        return ApiSuccess(true);
      } else {
        state = AsyncError(Exception(response.error), StackTrace.current);

        return ApiError(response.error.toString());
      }
    } catch (e) {
      state = AsyncError(e, StackTrace.current);

      return ApiError(e.toString());
    }
  }

  Future<ApiResponse<bool>> deleteExample(int id) async {
    try {
      final repository = ref.read(exampleRepositoryProvider);
      final response = await repository.delete(id);

      if (response.isSuccess) {
        ref.invalidateSelf();

        return ApiSuccess(true);
      } else {
        state = AsyncError(Exception(response.error), StackTrace.current);

        return ApiError(response.error.toString());
      }
    } catch (e) {
      state = AsyncError(e, StackTrace.current);

      return ApiError(e.toString());
    }
  }
}
