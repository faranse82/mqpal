import 'package:flutter_test/flutter_test.dart';
import 'package:mqpal/main.dart';
import 'package:mqpal/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:mqpal/state.dart';
import 'package:provider/provider.dart';
import 'package:mockito/mockito.dart';



//import 'package:mqpal/main.dart';
void main() {
    final stateModel = StateModel();

  testWidgets('Home screen renders properly', (tester) async {
    await tester.pumpWidget(MainApp(stateModel: stateModel,));

    final titleFinder = find.text('MQPal');
    final labelFinder = find.text('Home');

    expect(titleFinder, findsOneWidget);
    expect(labelFinder, findsOneWidget);
  });
}
