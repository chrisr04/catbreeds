import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:catbreeds/shared/widgets/widgets.dart';

void main() {
  testWidgets('AppIcon widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AppIcon(Icons.search),
        ),
      ),
    );

    expect(find.byIcon(Icons.search), findsOneWidget);
  });
}
