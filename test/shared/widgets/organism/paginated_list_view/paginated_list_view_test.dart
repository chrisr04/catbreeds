import 'package:catbreeds/shared/widgets/organism/paginated_list_view/paginated_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PaginatedListView', () {
    testWidgets('Initial rendering', (WidgetTester tester) async {
      final children = List.generate(10, (index) => Text('Item $index'));

      await tester.pumpWidget(
        MaterialApp(
          home: PaginatedListView(
            onLoadNextPage: () {},
            isLastPage: false,
            children: children,
          ),
        ),
      );

      expect(find.text('Item 0'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('Scrolling behavior', (WidgetTester tester) async {
      final children = List.generate(50, (index) => Text('Item $index'));

      bool isLoadingNextPage = false;

      await tester.pumpWidget(
        MaterialApp(
          home: PaginatedListView(
            isLastPage: false,
            onLoadNextPage: () {
              isLoadingNextPage = true;
            },
            children: children,
          ),
        ),
      );

      await tester.dragUntilVisible(
        find.text('Item 49'),
        find.byType(PaginatedListView),
        const Offset(0.0, -100.0),
      );

      await tester.pumpAndSettle();

      expect(isLoadingNextPage, isTrue);
    });

    testWidgets('when is last page', (WidgetTester tester) async {
      final children = List.generate(50, (index) => Text('Item $index'));

      bool isLoadingNextPage = false;

      await tester.pumpWidget(
        MaterialApp(
          home: PaginatedListView(
            isLastPage: true,
            onLoadNextPage: () {
              isLoadingNextPage = true;
            },
            children: children,
          ),
        ),
      );

      await tester.dragUntilVisible(
        find.text('Item 49'),
        find.byType(PaginatedListView),
        const Offset(0.0, -100.0),
      );

      await tester.pumpAndSettle();

      expect(isLoadingNextPage, isFalse);
    });
  });
}
