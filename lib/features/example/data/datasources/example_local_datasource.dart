import 'dart:convert';
import 'package:boilerplate_riverpod/core/constants/storage_keys.dart';
import 'package:boilerplate_riverpod/core/services/storage_service.dart';
import 'package:boilerplate_riverpod/features/example/data/models/example.dart';

class ExampleLocalDataSource {
  final StorageService storageService;

  ExampleLocalDataSource({required this.storageService});

  Future<bool> saveExamples(List<Example> examples) async {
    try {
      final List<String> jsonList = examples
          .map((example) => jsonEncode(example.toJson()))
          .toList();
      return await storageService.setStringList(StorageKeys.examples, jsonList);
    } catch (e) {
      print('Error saving Examples: $e');
      return false;
    }
  }

  Future<List<Example>> all() async{
    try {
      final jsonList = await storageService.getStringList(StorageKeys.examples);
      if (jsonList == null) return [];

      return jsonList
          .map((jsonString) => Example.fromJson(jsonDecode(jsonString) as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error getting Examples: $e');
      return [];
    }
  }

  Future<bool> add(Example example) async {
    final examples = await all();
    examples.add(example);
    return await saveExamples(examples);
  }

  Future<bool> update(Example updatedExample) async {
    final examples = await all();
    final index = examples.indexWhere((example) => example.id == updatedExample.id);

    if (index != -1) {
      examples[index] = updatedExample;
      return await saveExamples(examples);
    }

    return false;
  }

  Future<bool> delete(int id) async {
    final examples = await all();
    examples.removeWhere((example) => example.id == id);
    return await saveExamples(examples);
  }

  Future<bool> clear() async {
    return await storageService.remove(StorageKeys.examples);
  }
}
