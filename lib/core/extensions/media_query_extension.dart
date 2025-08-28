import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

extension MediaQueryExtension on MediaQueryData {
  bool get isTablet => size.width >= 600;
}

extension BuildContextExtension on BuildContext {
  bool get isMobile {
    if (kIsWeb) {
      return false;
    }

    return Platform.isAndroid || Platform.isIOS;
  }

  bool get isTablet {
    if (kIsWeb) {
      return MediaQuery.of(this).isTablet;
    }

    return (Platform.isAndroid || Platform.isIOS) &&
        MediaQuery.of(this).isTablet;
  }

  bool get isDesktop {
    if (kIsWeb) {
      return MediaQuery.of(this).isTablet == false;
    }

    return Platform.isWindows || Platform.isMacOS || Platform.isLinux;
  }
}
