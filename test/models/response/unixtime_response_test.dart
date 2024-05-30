import 'package:paymentez_sdk/models/response/unixtime_response.dart';
import 'package:test/test.dart';

void main() {
  group(
    UnixtimeResponse,
    () {
      test(
        'Test UnixtimeResponse.fromJson',
        () {
          final json = {
            'unixtime': 1634567890,
            'timezone': 'America/New_York',
          };

          final response = UnixtimeResponse.fromJson(json);

          expect(response.unixtime, 1634567890);
          expect(response.timezone, 'America/New_York');
        },
      );

      test(
        'Test UnixtimeResponse.toJson',
        () {
          final response = UnixtimeResponse(
            unixtime: 1634567890,
            timezone: 'America/New_York',
          );

          final json = response.toJson();

          expect(json['unixtime'], 1634567890);
          expect(json['timezone'], 'America/New_York');
        },
      );
    },
  );
}
