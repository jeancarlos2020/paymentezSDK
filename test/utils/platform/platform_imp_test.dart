import 'package:mocktail/mocktail.dart';
import 'package:paymentez_sdk/utils/platform/platform_imp.dart';
import 'package:test/test.dart';

class MockPlatformWrapper extends Mock implements PlatformWrapper {}

void main() {
  group(
    PlatformWrapper,
    () {
      late MockPlatformWrapper mockPlatform;
      setUp(() {
        mockPlatform = MockPlatformWrapper();
      });

      test(
        'isAndroid should return true on Android platform',
        () {
          when(() => mockPlatform.isAndroid).thenReturn(true);
          expect(mockPlatform.isAndroid, true);
        },
      );

      test(
        'isIOS should return true on iOS platform',
        () {
          when(() => mockPlatform.isAndroid).thenReturn(false);
          when(() => mockPlatform.isIOS).thenReturn(true);
          expect(mockPlatform.isIOS, true);
        },
      );

      test(
        'isMacOS should return true on macOS platform',
        () {
          when(() => mockPlatform.isAndroid).thenReturn(false);
          when(() => mockPlatform.isIOS).thenReturn(false);
          when(() => mockPlatform.isMacOS).thenReturn(true);

          expect(mockPlatform.isMacOS, true);
        },
      );

      test(
        'isFuchsia should return true on Fuchsia platform',
        () {
          when(() => mockPlatform.isAndroid).thenReturn(false);
          when(() => mockPlatform.isIOS).thenReturn(false);
          when(() => mockPlatform.isMacOS).thenReturn(false);
          when(() => mockPlatform.isFuchsia).thenReturn(true);

          expect(mockPlatform.isFuchsia, true);
        },
      );

      test(
        'isLinux should return true on Linux platform',
        () {
          when(() => mockPlatform.isAndroid).thenReturn(false);
          when(() => mockPlatform.isIOS).thenReturn(false);
          when(() => mockPlatform.isMacOS).thenReturn(false);
          when(() => mockPlatform.isFuchsia).thenReturn(false);
          when(() => mockPlatform.isLinux).thenReturn(true);

          expect(mockPlatform.isLinux, true);
        },
      );

      test(
        'isWeb should return true on Web platform',
        () {
          when(() => mockPlatform.isAndroid).thenReturn(false);
          when(() => mockPlatform.isIOS).thenReturn(false);
          when(() => mockPlatform.isMacOS).thenReturn(false);
          when(() => mockPlatform.isFuchsia).thenReturn(false);
          when(() => mockPlatform.isLinux).thenReturn(false);
          when(() => mockPlatform.isWeb).thenReturn(true);

          expect(mockPlatform.isWeb, true);
        },
      );
    },
  );
}
