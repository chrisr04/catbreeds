import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:catbreeds/shared/widgets/widgets.dart';

void main() {
  testWidgets('FadeAnimation Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FadeAnimation(
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );

    expect(find.byType(FadeTransition), findsOneWidget);

    final fadeTransition =
        tester.widget<FadeTransition>(find.byType(FadeTransition));

    expect(fadeTransition.opacity.value, 0.0);

    await tester.pumpAndSettle();

    expect(fadeTransition.opacity.value, 1.0);
  });
}
