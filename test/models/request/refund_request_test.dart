import 'package:paymentez_sdk/models/request/refund_request.dart';
import 'package:test/test.dart';

void main() {
  group(RefundRequest, () {
    test('toJson should return the correct JSON representation', () {
      // Arrange
      const refundRequest = RefundRequest(transactionID: '0');

      // Act
      final json = refundRequest.toJson();

      // Assert
      expect(json, {
        'transaction': {
          'id': '0',
        },
      });
    });

    test('props should not be empty', () {
      // Arrange
      const refundRequest = RefundRequest(transactionID: '0');

      // Act
      final props = refundRequest.props;

      // Assert
      expect(props, isNotEmpty);
    });
  });
}
