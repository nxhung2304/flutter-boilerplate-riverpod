import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:boilerplate_riverpod/app.dart';
import 'package:boilerplate_riverpod/core/config/enviroment.dart';
import 'package:boilerplate_riverpod/core/config/localization/app_locale.dart';
import 'package:boilerplate_riverpod/core/services/app_logger.dart';
import 'package:boilerplate_riverpod/core/services/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AppEnvironment environment = _determineEnvironment();

  try {
    await Environment.initialize(environment);

    await EasyLocalization.ensureInitialized();
    await StorageService().init();
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

AppEnvironment _determineEnvironment() {
  const String flavor = String.fromEnvironment(
    'FLAVOR',
    defaultValue: 'development',
  );

  switch (flavor.toLowerCase()) {
    case 'staging':
      return AppEnvironment.staging;
    case 'production':
      return AppEnvironment.production;
    default:
      return AppEnvironment.development;
  }
}
