import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mqpal/firebase_cloud_storage.dart';
import 'package:mqpal/main.dart';
import 'package:mqpal/screens/inquiry_details_screen.dart';
import 'package:mqpal/screens/update_inquiry_screen.dart';
import 'package:mqpal/state.dart';
import 'package:mqpal/widgets/inquiry.dart';
import 'package:provider/provider.dart';

class MockStateModel extends Mock implements StateModel {}

void main() {
  final stateModel = StateModel();

  group('Home screen', () {
    testWidgets('Home screen toggles the dark mode', (tester) async {
      await tester.pumpWidget(MainApp(
        stateModel: stateModel,
      ));

      final toggleDarkModeButton = find.byType(GestureDetector).first;
      await tester.tap(toggleDarkModeButton);
      await tester.pumpAndSettle();
      expect(stateModel.isDarkMode, true);
    });

    testWidgets('Home screen renders properly', (tester) async {
      await tester.pumpWidget(MainApp(
        stateModel: stateModel,
      ));

      final titleFinder = find.text('MQPal');
      final labelFinder = find.text('Home');
      final nameFinder = find.text('Hi Faran!');
      expect(titleFinder, findsOneWidget);
      expect(labelFinder, findsOneWidget);
      expect(nameFinder, findsOneWidget);
    });

    testWidgets('Home screen toggles inquiry form', (tester) async {
      await tester.pumpWidget(MainApp(
        stateModel: stateModel,
      ));

      final toggleInquiryForm = find.byType(GestureDetector).at(2);
      await tester.tap(toggleInquiryForm);
      await tester.pumpAndSettle();
      expect(stateModel.isExpanded, true);
    });
  });

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

  group('Updae screen', () {
    late StateModel stateModel;

    setUp(() {
      stateModel = StateModel();
    });

    testWidgets('Update inquiry screen renders properly', (tester) async {
      final inquiry = Inquiry(
        title: 'Test',
        description: 'Test',
        date: 'Test',
        time: 'Test',
        status: 'Test',
      );

      await tester.pumpWidget(
        ChangeNotifierProvider.value(
          value: stateModel,
          child: MaterialApp(
            home: UpdateInquiryScreen(inquiry: inquiry),
          ),
        ),
      );

      expect(find.text('Update Inquiry'), findsOneWidget);
      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Description'), findsOneWidget);
      expect(find.byType(TextField), findsNWidgets(2));
    });
  });

  group('state', () {
    test('initial state is correct', () {
      expect(stateModel.isExpanded, false);
      expect(stateModel.isMapOpen, false);
      expect(stateModel.isDarkMode, false);
      expect(stateModel.isSuccessInq, false);
      expect(stateModel.hasAnswered, false);
      expect(stateModel.userId, '');
      expect(stateModel.inquiries, []);
    });

    test('toggles isExpanded', () {
      stateModel.toggleInquiryForm();
      expect(stateModel.isExpanded, true);
      stateModel.toggleInquiryForm();
      expect(stateModel.isExpanded, false);
    });

    test('toggles isSuccessInq', () {
      stateModel.submitInquiryForm();
      expect(stateModel.isSuccessInq, true);
    });

    test('toggles hasAnswered', () {
      stateModel.toggleConfirmation();
      expect(stateModel.hasAnswered, true);
      stateModel.toggleConfirmation();
      expect(stateModel.hasAnswered, false);
    });

    test('toggles isSuccessInq', () {
      stateModel.resetInquiryForm();
      expect(stateModel.isSuccessInq, false);
    });

    test('toggles isMapOpen', () {
      stateModel.toggleMap();
      expect(stateModel.isMapOpen, true);
      stateModel.toggleMap();
      expect(stateModel.isMapOpen, false);
    });

    test('toggles isDarkMode', () {
      stateModel.toggleDarkMode();
      expect(stateModel.isDarkMode, true);
      stateModel.toggleDarkMode();
      expect(stateModel.isDarkMode, false);
    });
  });

  group('FirebaseStorageService', () {
    test('uploadInquiriesToStorage uploads inquiries to storage', () async {
      final inquiries = [
        Inquiry(
          title: 'Test',
          description: 'Test',
          date: 'Test',
          time: 'Test',
          status: 'Test',
        ),
        Inquiry(
          title: 'Test',
          description: 'Test',
          date: 'Test',
          time: 'Test',
          status: 'Test',
        ),
      ];

      final downloadUrl =
          await FirebaseStorageService.uploadInquiriesToStorage(inquiries);
      expect(downloadUrl, '');
    });
  });

  group('Inquiry details', () {
    testWidgets('Inquiry details screen renders properly', (tester) async {
      final inquiry = Inquiry(
        title: 'Test',
        description: 'Test',
        date: 'Test',
        time: 'Test',
        status: 'Test',
      );

      await tester.pumpWidget(
        ChangeNotifierProvider.value(
          value: stateModel,
          child: MaterialApp(
            home: InquiryDetailsScreen(inquiry: inquiry),
          ),
        ),
      );

      final cancelFinder = find.text('Cancel Inquiry');
      final inquiryDescriptionFinder = find.text('Description');
      expect(cancelFinder, findsOneWidget);
      expect(inquiryDescriptionFinder, findsOneWidget);
    });
  });
}
