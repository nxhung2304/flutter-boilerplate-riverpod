import 'package:firebase_analytics/firebase_analytics.dart';

/// A service class for logging analytics events to Firebase Analytics.
class AnalyticsService {
  static FirebaseAnalytics get _analytics => FirebaseAnalytics.instance;

  /// Logs a custom event
  ///
  /// [name] is the name of the event to log.
  /// [parameters] is an optional map of parameters to include with the event.
  static Future<void> logEvent({
    required String name,
    Map<String, Object>? parameters,
  }) async {
    await _analytics.logEvent(name: name, parameters: parameters);
  }

  /// Logs a screen view event.
  ///
  /// [screenName] is the name of the screen.
  /// [screenClassOverride] optionally overrides the screen class name.
  /// [parameters] allows passing additional event parameters.
  static void logScreenView({
    required String screenName,
    String? screenClassOverride,
    Map<String, Object>? parameters,
  }) async {
    await _analytics.logScreenView(
      screenName: screenName,
      screenClass: screenClassOverride,
      parameters: parameters,
    );
  }

  /// Logs a button tap event.
  ///
  /// [buttonName] is the name of the button tapped.
  /// [screenName] optionally specifies the screen where the tap occurred.
  /// [additionalParams] allows passing extra parameters.
  static Future<void> logButtonTap({
    required String buttonName,
    String? screenName,
    Map<String, Object>? additionalParams,
  }) async {
    await logEvent(
      name: 'button_tap',
      parameters: {
        'button_name': buttonName,
        if (screenName != null) 'screen_name': screenName,
        ...?additionalParams,
      },
    );
  }

  /// Logs an app open event.
  ///
  /// [source] optionally specifies how the app was opened (e.g., push_notification, deep_link, normal).
  static Future<void> logAppOpen({String? source}) async {
    await _analytics.logAppOpen(
      parameters: {
        if (source != null) 'source': source,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      },
    );
  }

  /// Logs a navigation event between screens.
  ///
  /// [from] is the originating screen.
  /// [to] is the destination screen.
  /// [method] optionally specifies the navigation method (e.g., tap, swipe, back_button).
  static Future<void> logNavigation({
    required String from,
    required String to,
    String? method,
  }) async {
    await logEvent(
      name: 'navigation',
      parameters: {
        'from_screen': from,
        'to_screen': to,
        if (method != null) 'navigation_method': method,
      },
    );
  }
}
