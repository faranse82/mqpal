import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mqpal/screens/inquiry_details_screen.dart';
import 'package:mqpal/state.dart';
import 'package:mqpal/widgets/inquiry.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

class MockStateModel extends Mock implements StateModel {}

void main() {
  testWidgets('InquiryDetailsScreen should cancel inquiry',
      (WidgetTester tester) async {
    final inquiry = Inquiry(
      title: 'Test Inquiry',
      description: 'This is a test inquiry',
      date: '2023-04-30',
      time: '12:00',
      status: 'In progress',
    );
    final mockStateModel = MockStateModel();

    await tester.pumpWidget(
      ChangeNotifierProvider<StateModel>(
        create: (_) => mockStateModel,
        child: MaterialApp(
          home: InquiryDetailsScreen(inquiry: inquiry),
        ),
      ),
    );

    await tester.tap(find.byType(GestureDetector));
    await tester.tap(find.text('Yes'));
    await tester.pumpAndSettle();
  });

  testWidgets('InquiryDetailsScreen should close inquiry',
      (WidgetTester tester) async {
    // Arrange
    final inquiry = Inquiry(
      title: 'Test Inquiry',
      description: 'This is a test inquiry',
      date: '2023-04-30',
      time: '12:00',
      status: 'In progress',
    );
    final mockStateModel = MockStateModel();

    await tester.pumpWidget(
      ChangeNotifierProvider<StateModel>(
        create: (_) => mockStateModel,
        child: MaterialApp(
          home: InquiryDetailsScreen(inquiry: inquiry),
        ),
      ),
    );

    await tester.tap(find.byType(GestureDetector));
    await tester.tap(find.text('Close'));
    await tester.pumpAndSettle();
  });
}
