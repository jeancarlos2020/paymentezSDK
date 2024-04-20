import 'package:paymentez_sdk/utils/platform/platform_imp.dart';
import 'package:test/test.dart';

void main() {
  group(
    PlatformWrapper,
    () {
      test(
        'isAndroid should return true on Android platform',
        () {
          const platform = PlatformWrapper();
          expect(platform.isAndroid, true);
        },
      );

      test(
        'isIOS should return true on iOS platform',
        () {
          const platform = PlatformWrapper();
          expect(platform.isIOS, true);
        },
      );

      test(
        'isMacOS should return true on macOS platform',
        () {
          const platform = PlatformWrapper();
          expect(platform.isMacOS, true);
        },
      );

      test(
        'isFuchsia should return true on Fuchsia platform',
        () {
          const platform = PlatformWrapper();
          expect(platform.isFuchsia, true);
        },
      );

      test(
        'isLinux should return true on Linux platform',
        () {
          const platform = PlatformWrapper();
          expect(platform.isLinux, true);
        },
      );

      test(
        'isWindows should return true on Windows platform',
        () {
          const platform = PlatformWrapper();
          expect(platform.isWindows, true);
        },
      );
    },
  );
}
