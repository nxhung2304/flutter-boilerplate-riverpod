import 'dart:ui';

import 'package:boilerplate_riverpod/app.dart';
import 'package:boilerplate_riverpod/core/config/localization/app_locale.dart';
import 'package:boilerplate_riverpod/core/services/app_features.dart';
import 'package:boilerplate_riverpod/core/services/app_lifecycle/app_lifecycle_manager.dart';
import 'package:boilerplate_riverpod/core/services/app_logger.dart';
import 'package:boilerplate_riverpod/core/services/env_config.dart';
import 'package:boilerplate_riverpod/core/services/storage_service.dart';
import 'package:boilerplate_riverpod/firebase_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await EasyLocalization.ensureInitialized();

  final env = _detectEnvironment();

  try {
    await EnvConfig.initialize(env);
    await AppLifecycleManager.initialize();
    await StorageService().initialize();

    await AppFeatures().initialize();
  } catch (e) {
    AppLogger.e('App initialization failed', data: e);
  }

  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: AppLocale.supportedLocales,
        path: AppLocale.translationsPath,
        fallbackLocale: AppLocale.fallbackLocale,
        child: App(),
      ),
    ),
  );
}

Environment _detectEnvironment() {
  const envName = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: 'development',
  );
  return Environment.values.firstWhere(
    (env) => env.name == envName,
    orElse: () => Environment.development,
  );
}
