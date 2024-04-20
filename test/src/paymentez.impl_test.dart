import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:paymentez_sdk/models/models.dart';
import 'package:paymentez_sdk/src/paymentez.impl.dart';
import 'package:paymentez_sdk/utils/utils.dart';
import 'package:test/test.dart';

import '../factories/card_pci_request_factory.dart';
import '../factories/card_request_factory.dart';
import '../factories/generate_tokenize_req_factory.dart';
import '../helpers/helpers.dart';
import '../mocks/mock_paymentez_security.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late MockHttpClient mockHttpClient;
  late PaymentezImpl paymentez;
  late MockPaymentezSecurity mockPaymentezSecurity;

  setUp(() {
    mockHttpClient = MockHttpClient();

    mockPaymentezSecurity = MockPaymentezSecurity();

    paymentez = PaymentezImpl(
      client: mockHttpClient,
      serverApplicationCode: 'serverAppCode',
      serverAppKey: 'serverAppKey',
      clientApplicationCode: 'clientAppCode',
      clientAppKey: 'clientAppKey',
      paymentezSecurity: mockPaymentezSecurity,
    );
  });

  group('Card', () {
    group('GetAllCards Method', () {
      test('Response Success', () async {
        final jsonResp = await Helpers.getJsonLocal(
          'test/response_mocks',
          'get_cards_success.json',
        );

        final mockURI =
            Uri.parse('https://ccapi-stg.paymentez.com/v2/card/list?uid=4');

        final headerMock = {
          'Auth-Token': mockPaymentezSecurity.getAuthToken(
            appCode: paymentez.serverApplicationCode,
            appKey: paymentez.serverAppKey,
          ),
          'Content-Type': 'application/json',
        };

        when(() => mockHttpClient.get(mockURI, headers: headerMock)).thenAnswer(
          (_) async => http.Response(
            jsonResp,
            HttpStatus.ok,
          ),
        );

        final (result, err) = await paymentez.getAllCards('4');

        expect(err, isNull);
        expect(result, isA<CardsResponse>());
        expect(result!.cards.length, 5);
      });

      test('Response Error', () async {
        final jsonResp = await Helpers.getJsonLocal(
          'test/response_mocks',
          'get_cards_error.json',
        );

        final mockURI =
            Uri.parse('https://ccapi-stg.paymentez.com/v2/card/list?uid=4');

        final headerMock = {
          'Auth-Token': mockPaymentezSecurity.getAuthToken(
            appCode: paymentez.serverApplicationCode,
            appKey: paymentez.serverAppKey,
          ),
          'Content-Type': 'application/json',
        };

        when(() => mockHttpClient.get(mockURI, headers: headerMock)).thenAnswer(
          (_) async => http.Response(
            jsonResp,
            HttpStatus.unauthorized,
          ),
        );

        final (result, err) = await paymentez.getAllCards('4');
        expect(result, isNull);
        expect(err, isA<PaymentezError>());
        expect(err!.error.type, 'Invalid Token');
      });
    });

    group('AddCard no PCI Method', () {
      test('Response Success', () async {
        final jsonResp = await Helpers.getJsonLocal(
          'test/response_mocks',
          'add_card_success.json',
        );

        final unixJsonResp = await Helpers.getJsonLocal(
          'test/response_mocks',
          'unixtime_success.json',
        );

        final unixTime = (jsonDecode(unixJsonResp) as Map<String, dynamic>)
            .getInt('unixtime');
        final mockURI = Uri.parse(
          'https://ccapi-stg.paymentez.com/v3/card/generate_tokenize/',
        );

        final unixMockURI = Uri.parse(
          'https://pg-micros-stg.paymentez.com/v1/unixtime',
        );

        final cardToAdd = CardRequestFactory.create();

        final generateTokenizeReq = GenerateTokenizeReqFactory.create(
          card: cardToAdd,
        );

        final unixHeaderMock = {
          'Auth-Token': mockPaymentezSecurity.getAuthToken(
            appCode: paymentez.serverApplicationCode,
            appKey: paymentez.serverAppKey,
          ),
          'Content-Type': 'application/json',
        };

        final headerMock = {
          'Auth-Token': mockPaymentezSecurity.getAuthToken(
            appCode: paymentez.serverApplicationCode,
            appKey: paymentez.serverAppKey,
            unixtime: unixTime,
          ),
          'Content-Type': 'application/json',
        };

        when(
          () => mockHttpClient.post(
            mockURI,
            headers: headerMock,
            body: json.encode(generateTokenizeReq.toJson()),
          ),
        ).thenAnswer(
          (_) async => http.Response(
            jsonResp,
            HttpStatus.ok,
          ),
        );

        when(
          () => mockHttpClient.get(
            unixMockURI,
            headers: unixHeaderMock,
          ),
        ).thenAnswer(
          (_) async => http.Response(
            unixJsonResp,
            HttpStatus.ok,
          ),
        );

        final (result, err) = await paymentez.addCard(cardToAdd);

        expect(err, isNull);
        expect(result, isA<AddCardResponse>());
      });

      test('Response Error', () async {
        final jsonResp = await Helpers.getJsonLocal(
          'test/response_mocks',
          'add_card_error.json',
        );

        final unixJsonResp = await Helpers.getJsonLocal(
          'test/response_mocks',
          'unixtime_success.json',
        );

        final unixTime = (jsonDecode(unixJsonResp) as Map<String, dynamic>)
            .getInt('unixtime');
        final mockURI = Uri.parse(
          'https://ccapi-stg.paymentez.com/v3/card/generate_tokenize/',
        );

        final unixMockURI = Uri.parse(
          'https://pg-micros-stg.paymentez.com/v1/unixtime',
        );

        final cardToAdd = CardRequestFactory.create();

        final generateTokenizeReq = GenerateTokenizeReqFactory.create(
          card: cardToAdd,
        );

        final unixHeaderMock = {
          'Auth-Token': mockPaymentezSecurity.getAuthToken(
            appCode: paymentez.serverApplicationCode,
            appKey: paymentez.serverAppKey,
          ),
          'Content-Type': 'application/json',
        };

        final headerMock = {
          'Auth-Token': mockPaymentezSecurity.getAuthToken(
            appCode: paymentez.serverApplicationCode,
            appKey: paymentez.serverAppKey,
            unixtime: unixTime,
          ),
          'Content-Type': 'application/json',
        };

        when(
          () => mockHttpClient.post(
            mockURI,
            headers: headerMock,
            body: json.encode(generateTokenizeReq.toJson()),
          ),
        ).thenAnswer(
          (_) async => http.Response(
            jsonResp,
            HttpStatus.forbidden,
          ),
        );

        when(
          () => mockHttpClient.get(
            unixMockURI,
            headers: unixHeaderMock,
          ),
        ).thenAnswer(
          (_) async => http.Response(
            unixJsonResp,
            HttpStatus.ok,
          ),
        );

        final (result, err) = await paymentez.addCard(cardToAdd);

        expect(result, isNull);
        expect(err, isA<PaymentezError>());
      });

      test('unix error', () async {
        final unixJsonResp = await Helpers.getJsonLocal(
          'test/response_mocks',
          'unixtime_error.json',
        );

        final unixMockURI = Uri.parse(
          'https://pg-micros-stg.paymentez.com/v1/unixtime',
        );

        final cardToAdd = CardRequestFactory.create();

        final unixHeaderMock = {
          'Auth-Token': mockPaymentezSecurity.getAuthToken(
            appCode: paymentez.serverApplicationCode,
            appKey: paymentez.serverAppKey,
          ),
          'Content-Type': 'application/json',
        };

        when(
          () => mockHttpClient.get(
            unixMockURI,
            headers: unixHeaderMock,
          ),
        ).thenAnswer(
          (_) async => http.Response(
            unixJsonResp,
            HttpStatus.forbidden,
          ),
        );

        final (result, err) = await paymentez.addCard(cardToAdd);

        expect(result, isNull);
        expect(err, isA<PaymentezError>());
      });
    });

    group('AddCard PCI', () {
      test(
        'Response Success',
        () async {
          final jsonResp = await Helpers.getJsonLocal(
            'test/response_mocks',
            'add_card_success.json',
          );

          final mockURI = Uri.parse(
            'https://ccapi-stg.paymentez.com/v2/card/add',
          );

          final cardToAdd = CardPCIRequestFactory.create();

          final headerMock = {
            'Auth-Token': mockPaymentezSecurity.getAuthToken(
              appCode: paymentez.clientApplicationCode,
              appKey: paymentez.clientAppKey,
            ),
            'Content-Type': 'application/json',
          };

          when(
            () => mockHttpClient.post(
              mockURI,
              headers: headerMock,
              body: json.encode(cardToAdd.toJson()),
            ),
          ).thenAnswer(
            (_) async => http.Response(
              jsonResp,
              HttpStatus.ok,
            ),
          );

          final (result, err) = await paymentez.addCardCC(
            cardToAdd,
          );

          expect(err, isNull);
          expect(result, isA<AddCardResponse>());
        },
      );

      test(
        'Response error',
        () async {
          final jsonResp = await Helpers.getJsonLocal(
            'test/response_mocks',
            'add_card_error.json',
          );

          final mockURI = Uri.parse(
            'https://ccapi-stg.paymentez.com/v2/card/add',
          );

          final cardToAdd = CardPCIRequestFactory.create();

          final headerMock = {
            'Auth-Token': mockPaymentezSecurity.getAuthToken(
              appCode: paymentez.clientApplicationCode,
              appKey: paymentez.clientAppKey,
            ),
            'Content-Type': 'application/json',
          };

          when(
            () => mockHttpClient.post(
              mockURI,
              headers: headerMock,
              body: json.encode(cardToAdd.toJson()),
            ),
          ).thenAnswer(
            (_) async => http.Response(
              jsonResp,
              HttpStatus.forbidden,
            ),
          );

          final (result, err) = await paymentez.addCardCC(
            cardToAdd,
          );

          expect(result, isNull);
          expect(err, isA<PaymentezError>());
        },
      );
    });

    group('DeleteCard Method', () {
      test('Response Success', () async {
        final jsonResp = await Helpers.getJsonLocal(
          'test/response_mocks',
          'delete_card_success.json',
        );

        final mockURI = Uri.parse(
          'https://ccapi-stg.paymentez.com/v2/card/delete',
        );

        final modelRequest = DeleteCardRequest(
          cardToken: 'data_mock',
          userId: 'data_mock',
        );

        final headerMock = {
          'Auth-Token': mockPaymentezSecurity.getAuthToken(
            appCode: paymentez.serverApplicationCode,
            appKey: paymentez.serverAppKey,
          ),
          'Content-Type': 'application/json',
        };

        when(
          () => mockHttpClient.post(
            mockURI,
            headers: headerMock,
            body: json.encode(modelRequest.toJson()),
          ),
        ).thenAnswer(
          (_) async => http.Response(
            jsonResp,
            HttpStatus.ok,
          ),
        );

        final (result, err) = await paymentez.deleteCard(
          modelRequest,
        );

        expect(err, isNull);
        expect(result, isA<DeleteCardResponse>());
      });
      test('Response Error', () async {
        final jsonResp = await Helpers.getJsonLocal(
          'test/response_mocks',
          'delete_card_error.json',
        );

        final mockURI = Uri.parse(
          'https://ccapi-stg.paymentez.com/v2/card/delete',
        );

        final modelRequest = DeleteCardRequest(
          cardToken: 'data_mock',
          userId: 'data_mock',
        );

        final headerMock = {
          'Auth-Token': mockPaymentezSecurity.getAuthToken(
            appCode: paymentez.serverApplicationCode,
            appKey: paymentez.serverAppKey,
          ),
          'Content-Type': 'application/json',
        };

        when(
          () => mockHttpClient.post(
            mockURI,
            headers: headerMock,
            body: json.encode(modelRequest.toJson()),
          ),
        ).thenAnswer(
          (_) async => http.Response(
            jsonResp,
            HttpStatus.internalServerError,
          ),
        );

        final (result, err) = await paymentez.deleteCard(
          modelRequest,
        );

        expect(result, isNull);
        expect(err, isA<PaymentezError>());
      });
    });
  });

  group('Charge', () {});

  group('Refund', () {});

  group('Information', () {});
}
