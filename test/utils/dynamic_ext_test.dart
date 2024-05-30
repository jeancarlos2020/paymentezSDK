import 'package:paymentez_sdk/utils/utils.dart';
import 'package:test/test.dart';

void main() {
  group('DynamicExtensions', () {
    test('getDouble should return the correct value', () {
      final map = {'amount': 10.5};
      expect(map.getDouble('amount'), equals(10.5));
    });

    test('getDouble value is int should return the correct value', () {
      final map = {'quantity': 5};
      expect(map.getDouble('quantity'), equals(5.0));
    });

    test('getDouble value is String should return the correct value', () {
      final map = {'quantity': '5'};
      expect(map.getDouble('quantity'), equals(5.0));
    });

    test('getInt should return the correct value', () {
      final map = {'quantity': 5};
      expect(map.getInt('quantity'), equals(5));
    });

    test('getInt value is String should return the correct value', () {
      final map = {'quantity': '5'};
      expect(map.getInt('quantity'), equals(5));
    });

    test('getInt value is bool should return the correct value', () {
      final map = {'quantity': true};
      expect(map.getInt('quantity'), equals(1));
    });

    test('getMap should return the correct value', () {
      final map = {
        'user': {'name': 'John', 'age': 30},
      };
      expect(map.getMap('user'), equals({'name': 'John', 'age': 30}));
    });

    test('getList should return the correct value', () {
      final map = {
        'items': ['apple', 'banana', 'orange'],
      };
      expect(map.getList('items'), equals(['apple', 'banana', 'orange']));
    });

    test('getDateTime should return the correct value', () {
      final map = {'createdAt': '2022-01-01T10:00:00Z'};
      expect(
        map.getDateTime('createdAt'),
        equals(DateTime.parse('2022-01-01T10:00:00Z')),
      );
    });

    test('getBool should return the correct value', () {
      final map = {'isActive': true};
      expect(map.getBool('isActive'), equals(true));
    });
  });
}
