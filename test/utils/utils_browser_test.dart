import 'package:mocktail/mocktail.dart';
import 'package:paymentez_sdk/utils/platform/platform_interface.dart';
import 'package:paymentez_sdk/utils/utils_browser.dart';
import 'package:test/test.dart';

class MockPlatform extends Mock implements PlatformInterface {}

void main() {
  group(UtilsBrowser, () {
    late UtilsBrowser utilsBrowser;
    final mockPlatform = MockPlatform();

    setUp(() {
      utilsBrowser = UtilsBrowser();
      when(() => mockPlatform.isAndroid).thenReturn(false);
      when(() => mockPlatform.isIOS).thenReturn(false);
      when(() => mockPlatform.isMacOS).thenReturn(false);
      when(() => mockPlatform.isFuchsia).thenReturn(false);
      when(() => mockPlatform.isLinux).thenReturn(false);
      when(() => mockPlatform.isWindows).thenReturn(false);
    });

    test('onCallbackSaveCard should return the expected JavaScript code', () {
      expect(utilsBrowser.onCallbackSaveCard, contains('tokenize'));
    });

    test('onListenerResultSaveCard should return the expected JavaScript code',
        () {
      expect(
        utilsBrowser.onListenerResultSaveCard,
        contains('incomplete_form'),
      );
      expect(
        utilsBrowser.onListenerResultSaveCard,
        contains('tokenize_response'),
      );
      expect(
        utilsBrowser.onListenerResultSaveCard,
        contains('SendDataSDK.postMessage'),
      );
    });

    test('getUserAgent should return the expected user agent when provided',
        () {
      const expectedUserAgent =
          'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.6312.40 Mobile Safari/537.36';
      expect(
        UtilsBrowser.getUserAgent(expectedUserAgent),
        equals(expectedUserAgent),
      );
    });

    test('getUserAgent should return the expected user agent Android', () {
      when(() => mockPlatform.isAndroid).thenReturn(true);

      const expectedUserAgent =
          'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.6312.40 Mobile Safari/537.36';
      expect(
        UtilsBrowser.getUserAgent(null, platform: mockPlatform),
        equals(expectedUserAgent),
      );
    });

    test('getUserAgent should return the expected user agent iOS', () {
      when(() => mockPlatform.isIOS).thenReturn(true);

      const expectedUserAgent =
          'Mozilla/5.0 (iPhone; CPU iPhone OS 17_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/123.0.6312.52 Mobile/15E148 Safari/604.1';
      expect(
        UtilsBrowser.getUserAgent(null, platform: mockPlatform),
        equals(expectedUserAgent),
      );
    });

    test('getUserAgent should return the expected user agent macOS', () {
      when(() => mockPlatform.isMacOS).thenReturn(true);

      const expectedUserAgent =
          'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36';
      expect(
        UtilsBrowser.getUserAgent(null, platform: mockPlatform),
        equals(expectedUserAgent),
      );
    });
  });
}
