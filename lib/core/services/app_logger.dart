import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 0,
      lineLength: 80,
      noBoxingByDefault: true,
    ),
  );

  static void d(String msg, {dynamic data}) {
    final prefix = _getCallerInfo();

    if (data != null) {
      _logger.d("[$prefix] $msg: $data");
    } else {
      _logger.d("[$prefix] $msg");
    }
  }

  static void e(
    String msg, {
    dynamic data,
    dynamic error,
    StackTrace? stackTrace,
  }) {
    final prefix = _getCallerInfo();

    final message = data != null ? "$msg: $data" : msg;

    _logger.e("[$prefix] $message", error: error, stackTrace: stackTrace);
  }

  static void i(String msg, {dynamic data}) {
    final prefix = _getCallerInfo();

    if (data != null) {
      _logger.i("[$prefix] $msg: $data");
    } else {
      _logger.i("[$prefix] $msg");
    }
  }

  static void w(String msg, {dynamic data}) {
    final prefix = _getCallerInfo();

    if (data != null) {
      _logger.w("[$prefix] $msg: $data");
    } else {
      _logger.w("[$prefix] $msg");
    }
  }

  static String _getCallerInfo() {
    try {
      final stackTrace = StackTrace.current.toString();
      final lines = stackTrace.split('\n');

      for (final line in lines) {
        if (!line.contains('AppLogger')) {
          final match = RegExp(r'(\w+)\.(\w+)\s+\(').firstMatch(line);
          if (match != null) {
            final prefix = match.group(1);
            final methodName = match.group(2);
            return '$prefix#$methodName';
          }
        }
      }
    } catch (e) {
      return 'AppLogger';
    }
    return 'AppLogger';
  }
}
