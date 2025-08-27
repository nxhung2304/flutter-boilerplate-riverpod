import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static final AppConfig _instance = AppConfig._internal();
  factory AppConfig() => _instance;
  AppConfig._internal();

  String get name => dotenv.env['APP_NAME'] ?? 'Boilerplate Riverpod';
}
