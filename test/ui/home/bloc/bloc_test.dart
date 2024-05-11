import 'package:catbreeds/core/core.dart';
import 'package:catbreeds/domain/domain.dart';
import 'package:catbreeds/ui/home/home.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCatBreedsRepository extends Mock implements CatBreedsRepository {}

void main() {
  late MockCatBreedsRepository repository;
  late HomeBloc homeBloc;

  setUp(() {
    repository = MockCatBreedsRepository();
    homeBloc = HomeBloc(repository: repository);
  });

  group('HomeBloc', () {
    test('when LoadCatBreedsEvent is success', () {
      when(
        () => repository.getCatBreeds(page: 0, limit: 10),
      ).thenAnswer((_) async => []);

      homeBloc.events.add(
        const LoadCatBreedsEvent(
          page: 0,
          limit: 10,
        ),
      );

      expect(
        homeBloc.stream,
        emitsInOrder([
          isA<HomeLoadingState>(),
          isA<HomeLoadedState>(),
        ]),
      );
    });

    test('when LoadCatBreedsEvent is failure', () {
      when(
        () => repository.getCatBreeds(page: 0, limit: 10),
      ).thenThrow(NoInternetException());

      homeBloc.events.add(
        const LoadCatBreedsEvent(
          page: 0,
          limit: 10,
        ),
      );

      expect(
        homeBloc.stream,
        emitsInOrder([
          isA<HomeLoadingState>(),
          isA<HomeFailureState>(),
        ]),
      );
    });

    test('when LoadNextCatBreedsEvent is success', () {
      when(
        () => repository.getCatBreeds(page: 0, limit: 10),
      ).thenAnswer((_) async => []);

      homeBloc.events.add(
        const LoadNextCatBreedsEvent(),
      );

      expect(
        homeBloc.stream,
        emitsInOrder([
          isA<HomeLoadingNextState>(),
          isA<HomeNextPageLoadedState>(),
        ]),
      );
    });

    test('when LoadNextCatBreedsEvent is failure', () {
      when(
        () => repository.getCatBreeds(page: 0, limit: 10),
      ).thenThrow(NoInternetException());

      homeBloc.events.add(
        const LoadNextCatBreedsEvent(),
      );

      expect(
        homeBloc.stream,
        emitsInOrder([
          isA<HomeLoadingNextState>(),
          isA<HomeFailureState>(),
        ]),
      );
    });

    test('when SearchCatBreedEvent is success', () {
      when(
        () => repository.searchCatBreeds(query: 'American'),
      ).thenAnswer((_) async => []);

      homeBloc.events.add(
        const SearchCatBreedEvent(
          query: 'American',
        ),
      );

      expect(
        homeBloc.stream,
        emitsInOrder([
          isA<HomeLoadingState>(),
          isA<HomeLoadedState>(),
        ]),
      );
    });

    test('when SearchCatBreedEvent is failure', () {
      when(
        () => repository.searchCatBreeds(query: 'American'),
      ).thenThrow(NoInternetException());

      homeBloc.events.add(
        const SearchCatBreedEvent(query: 'American'),
      );

      expect(
        homeBloc.stream,
        emitsInOrder([
          isA<HomeLoadingState>(),
          isA<HomeFailureState>(),
        ]),
      );
    });
  });
}
