import 'package:boilerplate_riverpod/features/example/data/models/example.dart';

class ExampleFormData {
  final Example? example;

  const ExampleFormData({this.example});

  bool get isEdit => example != null;
}
