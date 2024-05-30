import 'dart:io' show Platform;

import 'package:paymentez_sdk/utils/platform/platform_interface.dart';

class PlatformWrapper implements PlatformInterface {
  const PlatformWrapper();

  @override
  bool get isAndroid => Platform.isAndroid;

  @override
  bool get isIOS => Platform.isIOS;

  @override
  bool get isMacOS => Platform.isMacOS;

  @override
  bool get isFuchsia => Platform.isFuchsia;

  @override
  bool get isLinux => Platform.isLinux;

  @override
  bool get isWeb {
    final isMobile = Platform.isAndroid || Platform.isIOS;
    final desktop = Platform.isWindows ||
        Platform.isMacOS ||
        Platform.isFuchsia ||
        Platform.isLinux;

    return !isMobile && !desktop;
  }

  @override
  bool get isWindows => Platform.isWindows;
}
