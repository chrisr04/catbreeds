import 'dart:async';
import 'package:catbreeds/core/core.dart';
import 'package:catbreeds/shared/values/assets.dart';
import 'package:catbreeds/ui/home/home.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:catbreeds/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class FakeRoute extends Fake implements Route {}

class MockHomeBloc extends Mock implements HomeBloc {
  final StreamController<HomeEvent> _input = StreamController();
  final StreamController<HomeState> _output = StreamController.broadcast();

  @override
  Stream<HomeState> get stream => _output.stream;
  @override
  StreamSink<HomeEvent> get events => _input.sink;

  @override
  void dispose() {
    _output.close();
    _input.close();
  }
}

Route<dynamic>? mockRouteGenerator(RouteSettings setting) => MaterialPageRoute(
      builder: (context) => const Scaffold(),
    );

void main() {
  late MockHomeBloc mockHomeBloc;
  late MockNavigatorObserver mockNavigatorObserver;
  const catImage = CatImage(id: '123', url: 'http://example.com/image.jpg');
  const catBreeds = [
    CatBreed(
      id: '1',
      name: 'Persian',
      description: 'Persian cat description',
      intelligence: 5,
      adaptability: 3,
      origin: 'Persia',
      lifeSpan: '15-20',
      image: catImage,
    ),
    CatBreed(
      id: '2',
      name: 'American',
      description: 'American cat description',
      intelligence: 5,
      adaptability: 3,
      origin: 'United States',
      lifeSpan: '15-20',
      image: catImage,
    ),
  ];

  setUp(() {
    mockHomeBloc = MockHomeBloc();
    mockNavigatorObserver = MockNavigatorObserver();
    registerFallbackValue(FakeRoute());
  });

  group('HomeCatBreedList', () {
    testWidgets('show CircularProgressIndicator', (WidgetTester tester) async {
      when(() => mockHomeBloc.state).thenReturn(
        const HomeLoadingState(HomeStateData()),
      );

      await mockNetworkImages(
        () => tester.pumpWidget(
          HomeBlocDependency(
            bloc: mockHomeBloc,
            child: const MaterialApp(
              home: Scaffold(
                body: Column(
                  children: [
                    HomeCatBreedList(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      final loadingFinder = find.byType(CircularProgressIndicator);

      expect(loadingFinder, findsOneWidget);

      mockHomeBloc.dispose();
    });

    testWidgets('render CatBreedsCards', (WidgetTester tester) async {
      when(() => mockHomeBloc.state).thenReturn(
        const HomeLoadedState(
          HomeStateData(
            catBreeds: catBreeds,
          ),
        ),
      );

      await mockNetworkImages(
        () => tester.pumpWidget(
          HomeBlocDependency(
            bloc: mockHomeBloc,
            child: MaterialApp(
              onGenerateRoute: mockRouteGenerator,
              navigatorObservers: [mockNavigatorObserver],
              home: const Scaffold(
                body: Column(
                  children: [
                    HomeCatBreedList(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      final textFinder = find.text('Persian');

      expect(textFinder, findsOneWidget);

      await tester.tap(textFinder);

      await tester.pumpAndSettle();

      verify(() => mockNavigatorObserver.didPush(any(), any()));
    });

    testWidgets('show ErrorView', (WidgetTester tester) async {
      when(() => mockHomeBloc.state).thenReturn(
        const HomeFailureState(
          HomeStateData(
            catBreeds: catBreeds,
          ),
          message: 'Test Error',
        ),
      );

      await mockNetworkImages(
        () => tester.pumpWidget(
          HomeBlocDependency(
            bloc: mockHomeBloc,
            child: const MaterialApp(
              home: Scaffold(
                body: Column(
                  children: [
                    HomeCatBreedList(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final textFinder = find.text('Test Error');

      expect(textFinder, findsOneWidget);
    });
  });

  group('HomeSearchBar', () {
    testWidgets('enter query and search', (WidgetTester tester) async {
      when(() => mockHomeBloc.state).thenReturn(
        const HomeLoadedState(
          HomeStateData(
            catBreeds: catBreeds,
          ),
        ),
      );

      await tester.pumpWidget(
        HomeBlocDependency(
          bloc: mockHomeBloc,
          child: const MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  HomeSearchBar(),
                ],
              ),
            ),
          ),
        ),
      );

      final inputFinder = find.byType(TextFormField);
      final iconFinder = find.byIcon(Icons.search);

      final imageFinder =
          find.image(const AssetImage(AppAssets.catbreedsWhiteLogo));

      expect(inputFinder, findsOneWidget);
      expect(imageFinder, findsOneWidget);
      expect(iconFinder, findsOneWidget);

      await tester.enterText(inputFinder, 'Persian');

      final textFinder = find.text('Persian');

      expect(textFinder, findsOneWidget);

      await tester.tap(iconFinder);

      await tester.pump();

      mockHomeBloc.dispose();
    });
  });
}
