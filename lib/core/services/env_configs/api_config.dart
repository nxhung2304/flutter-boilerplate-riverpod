import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConfig {
  static final ApiConfig _instance = ApiConfig._internal();
  factory ApiConfig() => _instance;
  ApiConfig._internal();

  String get baseUrl => dotenv.env['API_BASE_URL'] ?? '';
  String get timeoutConnect => dotenv.env['API_TIMEOUT_CONNECT'] ?? '';
  String get timeoutReceive => dotenv.env['API_TIMEOUT_CONNECT'] ?? '';
  String get enableLogging => dotenv.env['API_TIMEOUT_CONNECT'] ?? '';
}
