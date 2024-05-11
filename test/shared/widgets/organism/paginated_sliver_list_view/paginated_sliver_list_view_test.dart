import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:catbreeds/shared/widgets/widgets.dart';

void main() {
  late ScrollController scrollController;

  setUp(() {
    scrollController = ScrollController();
  });

  group('PaginatedListView', () {
    testWidgets('Initial rendering', (WidgetTester tester) async {
      final children = List.generate(10, (index) => Text('Item $index'));

      await tester.pumpWidget(
        MaterialApp(
          home: CustomScrollView(
            controller: scrollController,
            slivers: [
              PaginatedSliverListView(
                controller: scrollController,
                onLoadNextPage: () {},
                isLastPage: false,
                children: children,
              ),
            ],
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
          home: CustomScrollView(
            controller: scrollController,
            slivers: [
              PaginatedSliverListView(
                controller: scrollController,
                isLastPage: false,
                onLoadNextPage: () {
                  isLoadingNextPage = true;
                },
                children: children,
              ),
            ],
          ),
        ),
      );

      await tester.dragUntilVisible(
        find.text('Item 49'),
        find.byType(CustomScrollView),
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
          home: CustomScrollView(
            controller: scrollController,
            slivers: [
              PaginatedSliverListView(
                controller: scrollController,
                isLastPage: true,
                onLoadNextPage: () {
                  isLoadingNextPage = true;
                },
                children: children,
              ),
            ],
          ),
        ),
      );

      await tester.dragUntilVisible(
        find.text('Item 49'),
        find.byType(CustomScrollView),
        const Offset(0.0, -100.0),
      );

      await tester.pumpAndSettle();

      expect(isLoadingNextPage, isFalse);
    });
  });
}
