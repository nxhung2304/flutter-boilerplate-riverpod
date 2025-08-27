import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthConfig {
  static final AuthConfig _instance = AuthConfig._internal();
  factory AuthConfig() => _instance;
  AuthConfig._internal();

  String get clientId => dotenv.env['AUTH_CLIENT_ID'] ?? '';
  String get redirectUri => dotenv.env['AUTH_REDIRECT_URI'] ?? '';
  List<String> get scopes => dotenv.env['AUTH_SCOPES']?.split(',') ?? [];
}
