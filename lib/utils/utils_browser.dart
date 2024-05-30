import 'package:paymentez_sdk/utils/utils.dart';

class UtilsBrowser {
  const UtilsBrowser({
    this.isProd = false,
    PlatformInterface platform = const PlatformWrapper(),
  }) : _platform = platform;

  final bool isProd;
  final PlatformInterface _platform;

  String get _host =>
      isProd ? 'ccapi.paymentez.com' : 'ccapi-stg.paymentez.com';

  String get onCallbackSaveCard {
    final javascript = '''
        window.postMessage({type: "tokenize", data: null}, "https://$_host");
      ''';
    return javascript;
  }

  String get onListenerResultSaveCard {
    return '''
      window.addEventListener("message", (event) => {
        if (event.origin !== "https://$_host") {
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
  }

  String getUserAgent([String? value]) {
    if (value != null) {
      return value;
    }

    if (_platform.isAndroid) {
      return 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.6312.40 Mobile Safari/537.36';
    }

    if (_platform.isIOS) {
      return 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/123.0.6312.52 Mobile/15E148 Safari/604.1';
    }

    if (_platform.isMacOS) {
      return 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36';
    }

    if (_platform.isLinux) {
      return 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.5993.111 Safari/537.36 OPR/103.0.4928.26';
    }

    if (_platform.isFuchsia) {
      return 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.0.0 Safari/537.36';
    }

    // Use for Platform.isWeb
    return 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36';
  }
}
