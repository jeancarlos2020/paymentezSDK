import 'package:paymentez_sdk/models/response/refund_response.dart';
import 'package:test/test.dart';

void main() {
  group(RefundResponse, () {
    test('fromJson should return a valid RefundResponse object', () {
      final json = {
        'status': 'success',
        'detail': 'Refund successful',
      };

      final refundResponse = RefundResponse.fromJson(json);

      expect(refundResponse.status, 'success');
      expect(refundResponse.detail, 'Refund successful');
    });

    test('toJson should return a valid JSON object', () {
      final refundResponse = RefundResponse(
        status: 'success',
        detail: 'Refund successful',
      );

      final json = refundResponse.toJson();

      expect(json['status'], 'success');
      expect(json['detail'], 'Refund successful');
    });
  });
}
