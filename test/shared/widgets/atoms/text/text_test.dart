import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:catbreeds/shared/widgets/widgets.dart';

void main() {
  testWidgets('TextSmall widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TextSmall('Test TextSmall'),
        ),
      ),
    );

    expect(find.text('Test TextSmall'), findsOneWidget);
  });

  testWidgets('TextMedium widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TextMedium('Test TextMedium'),
        ),
      ),
    );

    expect(find.text('Test TextMedium'), findsOneWidget);
  });

  testWidgets('TextLarge widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TextLarge('Test TextLarge'),
        ),
      ),
    );

    expect(find.text('Test TextLarge'), findsOneWidget);
  });

  testWidgets('TextHeading6 widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TextHeading6('Test TextHeading6'),
        ),
      ),
    );

    expect(find.text('Test TextHeading6'), findsOneWidget);
  });

  testWidgets('TextHeading5 widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TextHeading5('Test TextHeading5'),
        ),
      ),
    );

    expect(find.text('Test TextHeading5'), findsOneWidget);
  });

  testWidgets('TextHeading4 widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TextHeading4('Test TextHeading4'),
        ),
      ),
    );

    expect(find.text('Test TextHeading4'), findsOneWidget);
  });

  testWidgets('TextHeading3 widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TextHeading3('Test TextHeading3'),
        ),
      ),
    );

    expect(find.text('Test TextHeading3'), findsOneWidget);
  });

  testWidgets('TextHeading2 widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TextHeading2('Test TextHeading2'),
        ),
      ),
    );

    expect(find.text('Test TextHeading2'), findsOneWidget);
  });

  testWidgets('TextHeading1 widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TextHeading2('Test TextHeading1'),
        ),
      ),
    );

    expect(find.text('Test TextHeading1'), findsOneWidget);
  });
}
