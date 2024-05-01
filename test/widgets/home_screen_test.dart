import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mqpal/main.dart';
import 'package:mqpal/state.dart';

void main() {
  final stateModel = StateModel();

  testWidgets('Home screen renders properly', (tester) async {
    await tester.pumpWidget(MainApp(
      stateModel: stateModel,
    ));

    final titleFinder = find.text('MQPal');
    final labelFinder = find.text('Home');
    final nameFinder = find.text('Hi Faran!');
    final assetFinder = find.image(const AssetImage('toggleDark.png'));
    expect(assetFinder, findsOneWidget);

    expect(titleFinder, findsOneWidget);
    expect(labelFinder, findsOneWidget);
    expect(nameFinder, findsOneWidget);
  });
}
