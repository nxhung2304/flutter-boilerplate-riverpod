import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthConfig {
  static final AuthConfig _instance = AuthConfig._internal();
  factory AuthConfig() => _instance;
  AuthConfig._internal();

  String get clientId => dotenv.env['AUTH_CLIENT_ID'] ?? '';
  List<String> get clientSecret =>
      dotenv.env['AUTH_CLIENT_SECRET']?.split(',') ?? [];
  String get redirectUri => dotenv.env['AUTH_REDIRECT_URI'] ?? '';
}
