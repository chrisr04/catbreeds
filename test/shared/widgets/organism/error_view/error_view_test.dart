import 'package:catbreeds/shared/widgets/organism/error_view/error_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ErrorView widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ErrorView(
            message: 'Test Error Message',
          ),
        ),
      ),
    );

    final iconFinder = find.byIcon(Icons.error_outline_rounded);
    final textFinder = find.text('Test Error Message');

    expect(iconFinder, findsOneWidget);
    expect(textFinder, findsOneWidget);
  });
}
