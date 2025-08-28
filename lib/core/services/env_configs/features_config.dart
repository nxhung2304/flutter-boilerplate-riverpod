import 'package:boilerplate_riverpod/core/extensions/string_extension.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FeaturesConfig {
  static final FeaturesConfig _instance = FeaturesConfig._internal();
  factory FeaturesConfig() => _instance;
  FeaturesConfig._internal();

  bool get enabledCrashlytics =>
      dotenv.env['FEATURE_ENABLED_CRASHLYTICS']?.parseBool();

  bool get enabledAnalytics =>
      dotenv.env['FEATURE_ENABLED_ANALYTICS']?.parseBool();
}
