import 'package:mocktail/mocktail.dart';
import 'package:paymentez_sdk/utils/utils.dart';
import 'package:test/test.dart';

class MockPlatformWrapper extends Mock implements PlatformWrapper {}

void main() {
  group(UtilsBrowser, () {
    late MockPlatformWrapper mockPlatform;
    late UtilsBrowser utilsBrowser;
    setUp(() {
      mockPlatform = MockPlatformWrapper();
      utilsBrowser = UtilsBrowser(platform: mockPlatform);
    });

    test('onCallbackSaveCard should return the expected JavaScript code', () {
      const javascript = '''
        window.postMessage({type: "tokenize", data: null}, "https://ccapi-stg.paymentez.com");
      ''';
      expect(utilsBrowser.onCallbackSaveCard, equals(javascript));
    });

    test('onListenerResultSaveCard should return the expected JavaScript code',
        () {
      const javascript = '''
      window.addEventListener("message", (event) => {
        if (event.origin !== "https://ccapi-stg.paymentez.com") {
          return;
        }

        const msg = event.data;
        switch (msg.type) {
          case "incomplete_form":
            console.log("SDK_PAYMENTEZ_JS: incomplete_form " + msg.data);

            const dataErr = {
              type: "incomplete_form",
              data: null,
              message: msg.data,
            };

            if (window.flutter_inappwebview !== undefined) {
              window.flutter_inappwebview.callHandler(
                "SendDataSDK", 
                JSON.stringify(dataErr)
              );
            }

            if (SendDataSDK !== undefined) {
              SendDataSDK.postMessage(JSON.stringify(dataErr));
            }
            break;
          case "tokenize_response":
            console.log(
              "SDK_PAYMENTEZ_JS: tokenize_response " + JSON.stringify(msg.data)
            );

            const data = {
              type: "tokenize_response",
              data: msg.data,
              message: msg.data.message,
            };

            if (window.flutter_inappwebview !== undefined) {
              window.flutter_inappwebview.callHandler(
                "SendDataSDK", 
                JSON.stringify(data)
              );
            }

            if (SendDataSDK !== undefined) {
              SendDataSDK.postMessage(JSON.stringify(data));
            }
            break;
        }
      });
        ''';

      expect(utilsBrowser.onListenerResultSaveCard, equals(javascript));
    });

    test('getUserAgent should return the expected user agent Android', () {
      when(() => mockPlatform.isAndroid).thenReturn(true);

      final userAgent = utilsBrowser.getUserAgent();
      expect(
        userAgent,
        equals(
          'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.6312.40 Mobile Safari/537.36',
        ),
      );
    });

    test('getUserAgent should return the expected user agent IOS', () {
      when(() => mockPlatform.isAndroid).thenReturn(false);
      when(() => mockPlatform.isIOS).thenReturn(true);

      final userAgent = utilsBrowser.getUserAgent();
      expect(
        userAgent,
        equals(
          'Mozilla/5.0 (iPhone; CPU iPhone OS 17_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/123.0.6312.52 Mobile/15E148 Safari/604.1',
        ),
      );
    });

    test('getUserAgent should return the expected user agent MacOS', () {
      when(() => mockPlatform.isAndroid).thenReturn(false);
      when(() => mockPlatform.isIOS).thenReturn(false);
      when(() => mockPlatform.isMacOS).thenReturn(true);

      final userAgent = utilsBrowser.getUserAgent();
      expect(
        userAgent,
        equals(
          'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36',
        ),
      );
    });

    test('getUserAgent should return the expected user agent Linux', () {
      when(() => mockPlatform.isAndroid).thenReturn(false);
      when(() => mockPlatform.isIOS).thenReturn(false);
      when(() => mockPlatform.isMacOS).thenReturn(false);
      when(() => mockPlatform.isLinux).thenReturn(true);

      final userAgent = utilsBrowser.getUserAgent();
      expect(
        userAgent,
        equals(
          'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.5993.111 Safari/537.36 OPR/103.0.4928.26',
        ),
      );
    });

    test('getUserAgent should return the expected user agent Fuchsia', () {
      when(() => mockPlatform.isAndroid).thenReturn(false);
      when(() => mockPlatform.isIOS).thenReturn(false);
      when(() => mockPlatform.isMacOS).thenReturn(false);
      when(() => mockPlatform.isLinux).thenReturn(false);
      when(() => mockPlatform.isFuchsia).thenReturn(true);

      final userAgent = utilsBrowser.getUserAgent();
      expect(
        userAgent,
        equals(
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.0.0 Safari/537.36',
        ),
      );
    });

    test('getUserAgent should return the expected user agent Fuchsia', () {
      when(() => mockPlatform.isAndroid).thenReturn(false);
      when(() => mockPlatform.isIOS).thenReturn(false);
      when(() => mockPlatform.isMacOS).thenReturn(false);
      when(() => mockPlatform.isLinux).thenReturn(false);
      when(() => mockPlatform.isFuchsia).thenReturn(false);
      when(() => mockPlatform.isWeb).thenReturn(true);

      final userAgent = utilsBrowser.getUserAgent();
      expect(
        userAgent,
        equals(
          'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36',
        ),
      );
    });
  });
}
