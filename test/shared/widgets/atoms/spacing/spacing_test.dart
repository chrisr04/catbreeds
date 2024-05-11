import 'package:catbreeds/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SpacingXXL Widget Test', () {
    testWidgets('Testing SpacingXXL widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SpacingXXL(axis: SpacingAxis.x),
          ),
        ),
      );

      final spacingWidget = find.byType(SizedBox);

      expect(spacingWidget, findsOneWidget);

      final SizedBox sizedBox = tester.widget(spacingWidget) as SizedBox;
      expect(sizedBox.width, equals(AppSpacing.xxl));
    });

    testWidgets('Testing SpacingXXL widget with default axis',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SpacingXXL(),
          ),
        ),
      );

      final spacingWidget = find.byType(SizedBox);

      expect(spacingWidget, findsOneWidget);

      final SizedBox sizedBox = tester.widget(spacingWidget) as SizedBox;
      expect(sizedBox.height, equals(AppSpacing.xxl));
    });
  });

  group('SpacingXL Widget Test', () {
    testWidgets('Testing SpacingXL widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SpacingXL(axis: SpacingAxis.x),
          ),
        ),
      );

      final spacingWidget = find.byType(SizedBox);

      expect(spacingWidget, findsOneWidget);

      final SizedBox sizedBox = tester.widget(spacingWidget) as SizedBox;
      expect(sizedBox.width, equals(AppSpacing.xl));
    });

    testWidgets('Testing SpacingXL widget with default axis',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SpacingXL(),
          ),
        ),
      );

      final spacingWidget = find.byType(SizedBox);

      expect(spacingWidget, findsOneWidget);

      final SizedBox sizedBox = tester.widget(spacingWidget) as SizedBox;
      expect(sizedBox.height, equals(AppSpacing.xl));
    });
  });

  group('SpacingL Widget Test', () {
    testWidgets('Testing SpacingL widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SpacingL(axis: SpacingAxis.x),
          ),
        ),
      );

      final spacingWidget = find.byType(SizedBox);

      expect(spacingWidget, findsOneWidget);

      final SizedBox sizedBox = tester.widget(spacingWidget) as SizedBox;
      expect(sizedBox.width, equals(AppSpacing.lg));
    });

    testWidgets('Testing SpacingL widget with default axis',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SpacingL(),
          ),
        ),
      );

      final spacingWidget = find.byType(SizedBox);

      expect(spacingWidget, findsOneWidget);

      final SizedBox sizedBox = tester.widget(spacingWidget) as SizedBox;
      expect(sizedBox.height, equals(AppSpacing.lg));
    });
  });

  group('SpacingM Widget Test', () {
    testWidgets('Testing SpacingM widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SpacingM(axis: SpacingAxis.x),
          ),
        ),
      );

      final spacingWidget = find.byType(SizedBox);

      expect(spacingWidget, findsOneWidget);

      final SizedBox sizedBox = tester.widget(spacingWidget) as SizedBox;
      expect(sizedBox.width, equals(AppSpacing.md));
    });

    testWidgets('Testing SpacingM widget with default axis',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SpacingM(),
          ),
        ),
      );

      final spacingWidget = find.byType(SizedBox);

      expect(spacingWidget, findsOneWidget);

      final SizedBox sizedBox = tester.widget(spacingWidget) as SizedBox;
      expect(sizedBox.height, equals(AppSpacing.md));
    });
  });

  group('SpacingS Widget Test', () {
    testWidgets('Testing SpacingS widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SpacingS(axis: SpacingAxis.x),
          ),
        ),
      );

      final spacingWidget = find.byType(SizedBox);

      expect(spacingWidget, findsOneWidget);

      final SizedBox sizedBox = tester.widget(spacingWidget) as SizedBox;
      expect(sizedBox.width, equals(AppSpacing.sm));
    });

    testWidgets('Testing SpacingS widget with default axis',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SpacingS(),
          ),
        ),
      );

      final spacingWidget = find.byType(SizedBox);

      expect(spacingWidget, findsOneWidget);

      final SizedBox sizedBox = tester.widget(spacingWidget) as SizedBox;
      expect(sizedBox.height, equals(AppSpacing.sm));
    });
  });

  group('SpacingXS Widget Test', () {
    testWidgets('Testing SpacingXS widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SpacingXS(axis: SpacingAxis.x),
          ),
        ),
      );

      final spacingWidget = find.byType(SizedBox);

      expect(spacingWidget, findsOneWidget);

      final SizedBox sizedBox = tester.widget(spacingWidget) as SizedBox;
      expect(sizedBox.width, equals(AppSpacing.xs));
    });

    testWidgets('Testing SpacingXS widget with default axis',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SpacingXS(),
          ),
        ),
      );

      final spacingWidget = find.byType(SizedBox);

      expect(spacingWidget, findsOneWidget);

      final SizedBox sizedBox = tester.widget(spacingWidget) as SizedBox;
      expect(sizedBox.height, equals(AppSpacing.xs));
    });
  });

  group('SpacingXXS Widget Test', () {
    testWidgets('Testing SpacingXXS widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SpacingXXS(axis: SpacingAxis.x),
          ),
        ),
      );

      final spacingWidget = find.byType(SizedBox);

      expect(spacingWidget, findsOneWidget);

      final SizedBox sizedBox = tester.widget(spacingWidget) as SizedBox;
      expect(sizedBox.width, equals(AppSpacing.xxs));
    });

    testWidgets('Testing SpacingXXS widget with default axis',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SpacingXXS(),
          ),
        ),
      );

      final spacingWidget = find.byType(SizedBox);

      expect(spacingWidget, findsOneWidget);

      final SizedBox sizedBox = tester.widget(spacingWidget) as SizedBox;
      expect(sizedBox.height, equals(AppSpacing.xxs));
    });
  });
}
