import 'package:boilerplate_riverpod/core/constants/app_endpoints.dart';
import 'package:boilerplate_riverpod/core/models/api_response.dart';
import 'package:boilerplate_riverpod/core/services/api_client.dart';
import 'package:boilerplate_riverpod/features/example/data/models/params/example_params.dart';
import 'package:boilerplate_riverpod/features/example/data/models/example.dart';

class ExampleRemoteDataSource {
  final ApiClient apiClient;

  final mockExamples = [
    Example(id: 1, title: 'Example Item 1'),
    Example(id: 2, title: 'Example Item 2'),
    Example(id: 3, title: 'Example Item 3'),
  ];

  ExampleRemoteDataSource({required this.apiClient});

  Future<ApiResponse<List<Example>>> all() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      // final response = await apiClient.get(AppEndpoints.examples);
      // final List<dynamic> examplesJson = response.data['data'] as List<dynamic>;
      // final examples =
      //     examplesJson.map((example) => Example.fromJson(example)).toList();

      return ApiResponse.success(mockExamples);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse<Example>> createExample(
    ExampleParams exampleParams,
  ) async {
    try {
      // final response = await apiClient.post(
      //   AppEndpoints.examples,
      //   data: exampleParams.toJson(),
      // );
      // final Map<String, dynamic> exampleJson =
      //     response.data['data'] as Map<String, dynamic>;
      //
      // final example = Example.fromJson(exampleJson);

      return ApiResponse.success(mockExamples.first);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse<Example>> getById(int exampleId) async {
    try {
      // final response = await apiClient.get(
      //   AppEndpoints.getExampleById(exampleId),
      // );
      // final Map<String, dynamic> exampleJson =
      //     response.data['data'] as Map<String, dynamic>;
      // final example = Example.fromJson(exampleJson);

      return ApiResponse.success(mockExamples.first);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse<Example>> updateExample(
    int exampleId,
    ExampleParams exampleParams,
  ) async {
    try {
      // final response = await apiClient.patch(
      //   AppEndpoints.updateExample(exampleId),
      //   data: exampleParams.toJson(),
      // );
      // final Map<String, dynamic> exampleJson =
      //     response.data['data'] as Map<String, dynamic>;
      //
      // final example = Example.fromJson(exampleJson);

      return ApiResponse.success(mockExamples.first);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse<Example>> toggleExample(int exampleId) async {
    try {
      final response = await apiClient.post(
        AppEndpoints.toggleExample(exampleId),
      );

      final Map<String, dynamic> exampleJson =
          response.data['data'] as Map<String, dynamic>;
      final toggledExample = Example.fromJson(exampleJson);

      return ApiResponse.success(toggledExample);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse<Example>> deleteExample(int exampleId) async {
    try {
      // final response = await apiClient.delete(
      //   AppEndpoints.deleteExample(exampleId),
      // );
      //
      // final data = response.data?['data'];
      // if (data == null) {
      //   return const ApiResponse.error('No data returned from server');
      // }
      //
      // final Map<String, dynamic> exampleJson = data as Map<String, dynamic>;
      // final deletedExample = Example.fromJson(exampleJson);

      return ApiResponse.success(mockExamples.first);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}
