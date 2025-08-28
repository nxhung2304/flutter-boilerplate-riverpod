import 'package:boilerplate_riverpod/core/models/api_response.dart';
import 'package:boilerplate_riverpod/features/example/data/datasources/example_local_datasource.dart';
import 'package:boilerplate_riverpod/features/example/data/datasources/example_remote_datasource.dart';
import 'package:boilerplate_riverpod/features/example/data/models/example.dart';
import 'package:boilerplate_riverpod/features/example/data/models/params/example_params.dart';

class ExampleRepository {
  final ExampleLocalDataSource localDataSource;
  final ExampleRemoteDataSource remoteDataSource;

  ExampleRepository({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  Future<ApiResponse<List<Example>>> all() async {
    try {
      final response = await remoteDataSource.all();
      if (response.isSuccess && response.data != null) {
        await localDataSource.saveExamples(response.data!);
        return response;
      }
      final examples = await localDataSource.all();

      return ApiResponse.success(examples);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse<Example>> getById(int exampleId) async {
    try {
      final response = await remoteDataSource.getById(exampleId);
      if (response.isSuccess && response.data != null) {
        await localDataSource.add(response.data!);
      }
      return response;
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse<Example>> create(ExampleParams params) async {
    try {
      final response = await remoteDataSource.createExample(params);
      if (response.isSuccess && response.data != null) {
        await localDataSource.add(response.data!);
      }
      return response;
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse<Example>> update(int id, ExampleParams params) async {
    try {
      final response = await remoteDataSource.updateExample(id, params);
      if (response.isSuccess && response.data != null) {
        await localDataSource.add(response.data!);
      }
      return response;
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse<Example>> delete(int id) async {
    try {
      final response = await remoteDataSource.deleteExample(id);
      if (response.isSuccess) {
        await localDataSource.delete(id);
      }
      return response;
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse<Example>> toggleExample(int id) async {
    try {
      final response = await remoteDataSource.toggleExample(id);
      if (response.isSuccess && response.data != null) {
        await localDataSource.update(response.data!);
      }
      return response;
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}
