import 'package:catbreeds/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

void main() {
  group('CatBreedCard widget test', () {
    testWidgets('Widget renders correctly', (WidgetTester tester) async {
      const String title = 'Test Cat';
      const String image = 'https://example.com/image.png';
      const String rightLabel = 'Right Label';
      bool onTapRightLabelCalled = false;
      const List<CatBreedRowItem> rows = [
        CatBreedRowItem(labelLeft: 'Label 1', contentLeft: 'Content 1'),
        CatBreedRowItem(labelLeft: 'Label 2', contentLeft: 'Content 2'),
      ];

      await mockNetworkImages(
        () => tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CatBreedCard(
                title: title,
                image: image,
                rows: rows,
                rightLabel: rightLabel,
                onTapRightLabel: () {
                  onTapRightLabelCalled = true;
                },
              ),
            ),
          ),
        ),
      );

      expect(find.text(title), findsOneWidget);

      expect(find.byType(Image), findsOneWidget);

      expect(find.text(rightLabel), findsOneWidget);

      await tester.tap(find.text(rightLabel));

      await tester.pump();

      expect(onTapRightLabelCalled, isTrue);
    });
  });
}
