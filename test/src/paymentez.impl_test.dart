import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:paymentez_sdk/models/models.dart';
import 'package:paymentez_sdk/src/paymentez.impl.dart';
import 'package:paymentez_sdk/utils/utils.dart';
import 'package:test/test.dart';

import '../helpers/helpers.dart';
import '../mocks/mocks.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  const applicationCode = 'mockAppCode';
  const appKey = 'mockAppKey';

  late MockHttpClient mockHttpClient;
  late PaymentezImpl paymentez;
  late Map<String, String> headerMock;

  setUp(() {
    mockHttpClient = MockHttpClient();

    paymentez = PaymentezImpl(
      client: mockHttpClient,
      applicationCode: applicationCode,
      appKey: appKey,
    );

    headerMock = {
      'Auth-Token': PaymentezSecurity.getAuthToken(
        appCode: applicationCode,
        appKey: appKey,
      ),
      'Content-Type': 'application/json',
    };
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

        when(() => mockHttpClient.get(mockURI, headers: headerMock)).thenAnswer(
          (_) async => http.Response(
            jsonResp,
            HttpStatus.ok,
            headers: headerMock,
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

        when(() => mockHttpClient.get(mockURI, headers: headerMock)).thenAnswer(
          (_) async => http.Response(
            jsonResp,
            HttpStatus.unauthorized,
            headers: headerMock,
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
        final mockHttpClient2 = MockHttpClient();

        final sdk = PaymentezImpl(
          client: mockHttpClient2,
          applicationCode: applicationCode,
          appKey: appKey,
        );
        // ++++++++++++++++++++++++++++++++++++++++//
        // ************ GET UNIXTIME **************//
        final mockUnixtimeURI = Uri.parse(
          'https://pg-micros-stg.paymentez.com/v1/unixtime',
        );

        final unixJsonResp = await Helpers.getJsonLocal(
          'test/response_mocks',
          'unixtime_success.json',
        );

        when(
          () => mockHttpClient2.get(
            mockUnixtimeURI,
            headers: headerMock,
          ),
        ).thenAnswer(
          (_) async => http.Response(
            unixJsonResp,
            HttpStatus.ok,
            headers: headerMock,
          ),
        );

        final unixTime = (jsonDecode(unixJsonResp) as Map<String, dynamic>)
            .getInt('unixtime');

        // ++++++++++++++++++++++++++++++++++++++++//
        // ************ TOKENIZED REQUEST *********//
        final mockGeneralTokenizedURI = Uri.parse(
          'https://ccapi-stg.paymentez.com/v3/card/generate_tokenize/',
        );

        final jsonRespData = await Helpers.getJsonLocal(
          'test/response_mocks',
          'add_request_tokenized.json',
        );

        final headerTokenizedMock = {
          'Auth-Token': PaymentezSecurity.getAuthToken(
            appCode: applicationCode,
            appKey: appKey,
            unixtime: unixTime,
          ),
          'Content-Type': 'application/json',
        };

        when(
          () => mockHttpClient2.post(
            mockGeneralTokenizedURI,
            headers: headerTokenizedMock,
            body: json.encode(
              GenerateTokenizeReqMock.create(
                unixtime: unixTime,
              ).toJson(),
            ),
          ),
        ).thenAnswer(
          (_) async => http.Response(
            jsonRespData,
            HttpStatus.ok,
            headers: headerTokenizedMock,
          ),
        );

        // ++++++++++++++++++++++++++++++++++++++++//
        // *************** UNIT TEST **************//
        final cardToAdd = CardRequestMock.create();
        final (result, err) = await sdk.addCard(cardToAdd);
        expect(err, isNull);
        expect(result, isA<AddCardResponse>());
        if (result != null) {
          expect(result.card, isNull);
          expect(result.tokenizeURL, isNotEmpty);
          expect(result.tokenizeURL, equals('https://www.host.com/form'));
        }
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

          final cardToAdd = CardPCIRequestMock.create();

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
              headers: headerMock,
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

          final cardToAdd = CardPCIRequestMock.create();

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
              headers: headerMock,
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

        const modelRequest = DeleteCardRequest(
          cardToken: 'data_mock',
          userId: 'data_mock',
        );

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
            headers: headerMock,
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

        const modelRequest = DeleteCardRequest(
          cardToken: 'data_mock',
          userId: 'data_mock',
        );

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
            headers: headerMock,
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
}
