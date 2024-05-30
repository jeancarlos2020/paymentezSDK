import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:paymentez_sdk/models/models.dart';
import 'package:paymentez_sdk/src/paymentez.inteface.dart';
import 'package:paymentez_sdk/utils/utils.dart';

class PaymentezImpl implements IPaymentez {
  PaymentezImpl({
    required this.client,
    required String applicationCode,
    required String appKey,
    this.isProd = false,
  })  : _applicationCode = applicationCode,
        _appKey = appKey;

  final String _applicationCode;
  final String _appKey;

  final bool isProd;

  final http.Client client;

  String get _host =>
      isProd ? 'ccapi.paymentez.com' : 'ccapi-stg.paymentez.com';

  String get _hostMicro =>
      isProd ? 'pg-micros.paymentez.com' : 'pg-micros-stg.paymentez.com';

  Map<String, String> _headers({int? unixtime}) {
    final authToken = PaymentezSecurity.getAuthToken(
      appCode: _applicationCode,
      appKey: _appKey,
      unixtime: unixtime,
    );

    return {'Auth-Token': authToken, 'Content-Type': 'application/json'};
  }

  @override
  Future<(AddCardResponse?, PaymentezError?)> addCardCC(
    CardPCIRequest card,
  ) async {
    final url = Uri.https(_host, '/v2/card/add');
    final response = await client.post(
      url,
      headers: _headers(),
      body: json.encode(card.toJson()),
    );

    final body = json.decode(response.body) as Map<String, dynamic>;

    if (response.statusCode == HttpStatus.ok) {
      final result = AddCardResponse.fromJson(body);
      return (result, null);
    }

    return (null, PaymentezError.fromJson(body));
  }

  @override
  Future<(CardsResponse?, PaymentezError?)> getAllCards(
    String userID,
  ) async {
    final url = Uri.https(_host, '/v2/card/list', {'uid': userID});
    final response = await client.get(
      url,
      headers: _headers(),
    );

    final body = json.decode(response.body) as Map<String, dynamic>;

    if (response.statusCode == HttpStatus.ok) {
      final result = CardsResponse.fromJson(body);
      return (result, null);
    }

    return (null, PaymentezError.fromJson(body));
  }

  @override
  Future<(AddCardResponse?, PaymentezError?)> addCard(
    CardRequest card,
  ) async {
    final (unixtimeResp, unixtimeErr) = await _getUnixtime();
    if (unixtimeErr != null) {
      return (null, unixtimeErr);
    }

    final utilsBrowser = UtilsBrowser(isProd: isProd);

    final model = GenerateTokenizeReq(
      locale: card.locale,
      user: card.user,
      configuration: TokenizeConfiguration(
        defaultCountry: 'ECU',
        requireBillingAddress: card.requireBillingAddress,
      ),
      origin: 'SDK_JS',
      antifraud: Antifraud(
        sessionId: PaymentezSecurity.getSessionId(
          unixtime: unixtimeResp!.unixtime,
        ),
        location: Uri.https(_host).toString(),
        userAgent: utilsBrowser.getUserAgent(card.userAgent),
      ),
    );

    final url = Uri.https(_host, '/v3/card/generate_tokenize/');
    final headers = _headers(unixtime: unixtimeResp.unixtime);
    final jsonBody = json.encode(model.toJson());
    final response = await client.post(
      url,
      headers: headers,
      body: jsonBody,
    );

    final body = json.decode(response.body) as Map<String, dynamic>;
    if (response.statusCode == HttpStatus.ok) {
      final result = AddCardResponse.fromJson(body);
      return (result, null);
    }

    return (null, PaymentezError.fromJson(body));
  }

  Future<(UnixtimeResponse?, PaymentezError?)> _getUnixtime() async {
    final url = Uri.https(_hostMicro, '/v1/unixtime');

    final response = await client.get(
      url,
      headers: _headers(),
    );

    final body = json.decode(response.body) as Map<String, dynamic>;
    if (response.statusCode == HttpStatus.ok) {
      final result = UnixtimeResponse.fromJson(body);
      return (result, null);
    }

    return (null, PaymentezError.fromJson(body));
  }

  @override
  Future<(DeleteCardResponse?, PaymentezError?)> deleteCard(
    DeleteCardRequest deleteCardRequest,
  ) async {
    final url = Uri.https(_host, '/v2/card/delete');

    final response = await client.post(
      url,
      headers: _headers(),
      body: json.encode(deleteCardRequest.toJson()),
    );

    final body = json.decode(response.body) as Map<String, dynamic>;
    if (response.statusCode == HttpStatus.ok) {
      final result = DeleteCardResponse.fromJson(body);
      return (result, null);
    }

    return (null, PaymentezError.fromJson(body));
  }

  @override
  Future<(PayResponse?, PaymentezError?)> debit(PayRequest payRequest) async {
    final url = Uri.https(_host, '/v2/transaction/debit');

    final response = await client.post(
      url,
      headers: _headers(),
      body: json.encode(payRequest.toJson()),
    );

    final body = json.decode(response.body) as Map<String, dynamic>;
    if (response.statusCode == HttpStatus.ok) {
      final result = PayResponse.fromJson(body);
      return (result, null);
    }

    return (null, PaymentezError.fromJson(body));
  }

  @override
  Future<(PayResponse?, PaymentezError?)> debitCC(
    PayPCIRequest payPCIRequest,
  ) async {
    final url = Uri.https(_host, '/v2/transaction/debit_cc');

    final response = await client.post(
      url,
      headers: _headers(),
      body: json.encode(payPCIRequest.toJson()),
    );

    final body = json.decode(response.body) as Map<String, dynamic>;
    if (response.statusCode == HttpStatus.ok) {
      final result = PayResponse.fromJson(body);
      return (result, null);
    }

    return (null, PaymentezError.fromJson(body));
  }

  @override
  Future<(RefundResponse?, PaymentezError?)> refund(
    RefundRequest payPCIRequest,
  ) async {
    final url = Uri.https(_host, '/v2/transaction/refund');

    final response = await client.post(
      url,
      headers: _headers(),
      body: json.encode(payPCIRequest.toJson()),
    );

    final body = json.decode(response.body) as Map<String, dynamic>;
    if (response.statusCode == HttpStatus.ok) {
      final result = RefundResponse.fromJson(body);
      return (result, null);
    }

    return (null, PaymentezError.fromJson(body));
  }
}
