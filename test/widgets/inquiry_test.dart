import 'package:flutter_test/flutter_test.dart';
import 'package:mqpal/state.dart';
import 'package:mqpal/widgets/inquiry.dart';
import 'package:mockito/mockito.dart';

class MockStateModel extends Mock implements StateModel {}

void main() {
  group('Inquiry', () {
    test('should create an Inquiry object with provided values', () {
      final inquiry = Inquiry(
        title: 'Test Inquiry',
        description: 'This is a inquiry',
        date: '2023-04-30',
        time: '12:00',
        status: 'In progress',
      );

      expect(inquiry.title, 'Test Inquiry');
      expect(inquiry.description, 'This is a inquiry');
      expect(inquiry.date, '2023-04-30');
      expect(inquiry.time, '12:00');
      expect(inquiry.status, 'In progress');
    });

    test('should convert Inquiry object to JSON', () {
      final inquiry = Inquiry(
        title: 'Test Inquiry',
        description: 'This is a inquiry',
        date: '2023-04-30',
        time: '12:00',
        status: 'In progress',
      );

      final json = inquiry.toJson();

      expect(json, {
        'title': 'Test Inquiry',
        'description': 'This is a inquiry',
        'date': '2023-04-30',
        'time': '12:00',
        'status': 'In progress',
      });
    });

    test('should create an Inquiry object from JSON', () {
      final json = {
        'title': 'Test Inquiry',
        'description': 'This is a inquiry',
        'date': '2023-04-30',
        'time': '12:00',
        'status': 'In progress',
      };

      final inquiry = Inquiry.fromJson(json);

      expect(inquiry.title, 'Test Inquiry');
      expect(inquiry.description, 'This is a inquiry');
      expect(inquiry.date, '2023-04-30');
      expect(inquiry.time, '12:00');
      expect(inquiry.status, 'In progress');
    });

    test('should handle missing status field in JSON', () {
      final json = {
        'title': 'Test Inquiry',
        'description': 'This is a inquiry',
        'date': '2023-04-30',
        'time': '12:00',
      };

      final inquiry = Inquiry.fromJson(json);

      expect(inquiry.title, 'Test Inquiry');
      expect(inquiry.description, 'This is a inquiry');
      expect(inquiry.date, '2023-04-30');
      expect(inquiry.time, '12:00');
      expect(inquiry.status, 'In progress');
    });
  });
}
