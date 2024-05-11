import 'package:catbreeds/domain/domain.dart';
import 'package:catbreeds/shared/widgets/widgets.dart';
import 'package:catbreeds/ui/detail/page/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

void main() {
  const catBreed = CatBreed(
    id: '1',
    name: 'Persian',
    description: 'Persian cat description',
    intelligence: 5,
    adaptability: 3,
    origin: 'Persia',
    lifeSpan: '15-20',
    altNames: 'Fox Cat, Long-Haired Abyssinian',
    temperament: 'Loyal, Inquisitive, Friendly, Quiet, Gentle',
    image: CatImage(id: '123', url: 'http://example.com/image.jpg'),
  );

  testWidgets('DetailAppBar widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        onGenerateRoute: (settings) => MaterialPageRoute(
          settings: const RouteSettings(arguments: catBreed),
          builder: (context) => const Scaffold(
            appBar: DetailAppBar(),
            body: SizedBox.shrink(),
          ),
        ),
      ),
    );

    expect(find.byType(TextHeading6), findsOneWidget);
    expect(find.text(catBreed.name), findsOneWidget);
  });

  testWidgets('CatBreedAttributes widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        onGenerateRoute: (settings) => MaterialPageRoute(
          settings: const RouteSettings(arguments: catBreed),
          builder: (context) => const Scaffold(
            body: Column(
              children: [
                CatBreedAttributes(),
              ],
            ),
          ),
        ),
      ),
    );

    expect(find.text(catBreed.description), findsOneWidget);
    expect(find.text(catBreed.origin), findsOneWidget);
    expect(find.text(catBreed.intelligence.toString()), findsOneWidget);
    expect(find.text(catBreed.lifeSpan), findsOneWidget);
  });

  testWidgets('CatImageView widget test', (WidgetTester tester) async {
    await mockNetworkImages(
      () => tester.pumpWidget(
        MaterialApp(
          onGenerateRoute: (settings) => MaterialPageRoute(
            settings: const RouteSettings(arguments: catBreed),
            builder: (context) => const Scaffold(
              body: Column(
                children: [
                  CatImageView(),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.image(NetworkImage(catBreed.image.url)), findsOneWidget);
  });
}
