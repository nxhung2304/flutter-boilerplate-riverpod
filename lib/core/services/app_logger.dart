import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 0,
      lineLength: 80,
      colors: true,
      printEmojis: true,
      noBoxingByDefault: true,
    ),
  );

  static void d(String msg, {dynamic data}) {
    final className = _getCallerClassName();
    if (data != null) {
      _logger.d("[$className] $msg: $data");
    } else {
      _logger.d("[$className] $msg");
    }
  }

  static void e(
    String msg, {
    dynamic data,
    dynamic error,
    StackTrace? stackTrace,
  }) {
    final className = _getCallerClassName();
    final message = data != null ? "$msg: $data" : msg;
    _logger.e("[$className] $message", error: error, stackTrace: stackTrace);
  }

  static void i(String msg, {dynamic data}) {
    final className = _getCallerClassName();
    if (data != null) {
      _logger.i("[$className] $msg: $data");
    } else {
      _logger.i("[$className] $msg");
    }
  }

  static void w(String msg, {dynamic data}) {
    final className = _getCallerClassName();
    if (data != null) {
      _logger.w("[$className] $msg: $data");
    } else {
      _logger.w("[$className] $msg");
    }
  }

  static String _getCallerClassName() {
    final stackTrace = StackTrace.current;
    final frames = stackTrace.toString().split('\n');

    for (int i = 1; i < frames.length; i++) {
      final frame = frames[i];
      if (!frame.contains('AppLogger') && !frame.contains('Logger')) {
        final match = RegExp(r'(\w+)\.').firstMatch(frame);
        if (match != null) {
          return match.group(1) ?? 'Unknown';
        }
      }
    }
    return 'Unknown';
  }
}
