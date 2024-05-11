import 'package:catbreeds/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppTextFormField Widget Test', () {
    late Widget testWidget;
    final mockKey = GlobalKey<FormState>();

    setUp(() {
      testWidget = MaterialApp(
        home: Scaffold(
          body: Form(
            key: mockKey,
            child: const AppTextFormField(),
          ),
        ),
      );
    });

    testWidgets('Widget builds correctly', (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);

      expect(find.byType(AppTextFormField), findsOneWidget);
    });

    testWidgets('Widget can accept input', (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);

      await tester.enterText(find.byType(TextFormField), 'Test input');

      expect(find.text('Test input'), findsOneWidget);
    });

    testWidgets('Widget calls onChanged when input changes',
        (WidgetTester tester) async {
      String? changedValue;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              key: mockKey,
              child: AppTextFormField(
                onChanged: (value) {
                  changedValue = value;
                },
              ),
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), 'Changed input');
      expect(changedValue, 'Changed input');
    });
  });

  group('SearchInput', () {
    testWidgets('widget calls onSubmit from input actions',
        (WidgetTester tester) async {
      String submitValue = '';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SearchInput(
              hintText: 'Search',
              onSubmit: (value) {
                submitValue = value;
              },
            ),
          ),
        ),
      );

      final searchInputFinder = find.byType(SearchInput);

      expect(searchInputFinder, findsOneWidget);

      await tester.enterText(searchInputFinder, 'Test query');

      expect(find.text('Test query'), findsOneWidget);

      await tester.testTextInput.receiveAction(TextInputAction.search);

      expect(submitValue, 'Test query');
    });

    testWidgets('widget calls onSubmit when search icon is tapped',
        (WidgetTester tester) async {
      String submitValue = '';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SearchInput(
              hintText: 'Search',
              onSubmit: (value) {
                submitValue = value;
              },
            ),
          ),
        ),
      );

      final searchInputFinder = find.byType(SearchInput);

      expect(searchInputFinder, findsOneWidget);

      await tester.enterText(searchInputFinder, 'Test query');

      await tester.tap(find.byIcon(Icons.search));

      expect(submitValue, 'Test query');
    });
  });
}
