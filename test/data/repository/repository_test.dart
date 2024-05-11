import 'dart:io';

import 'package:catbreeds/core/core.dart';
import 'package:catbreeds/data/api/model/cat_breed.dart';
import 'package:catbreeds/data/data.dart';
import 'package:catbreeds/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCatBreedsApiDataSource extends Mock
    implements CatBreedsApiDataSource {}

void main() {
  late MockCatBreedsApiDataSource mockApiDatasource;
  late CatBreedsRepositoryImpl repository;

  setUp(() {
    mockApiDatasource = MockCatBreedsApiDataSource();
    repository = CatBreedsRepositoryImpl(
      api: mockApiDatasource,
    );
  });

  group('getCatBreeds', () {
    test('returns list of CatBreed', () async {
      final catBreeds = [
        CatBreedApiModel.fromJson({'id': '1', 'name': 'Abyssinian'}),
        CatBreedApiModel.fromJson({'id': '2', 'name': 'American Bobtail'}),
      ];

      when(() => mockApiDatasource.getCatBreeds(page: 0, limit: 10))
          .thenAnswer((_) async => catBreeds);

      final result = await repository.getCatBreeds(page: 0, limit: 10);

      expect(result, isA<List<CatBreed>>());
    });

    test('throws NoInternetException when SocketException is occurred',
        () async {
      when(() => mockApiDatasource.getCatBreeds(page: 0, limit: 10))
          .thenThrow(const SocketException('No internet'));

      expect(
        () => repository.getCatBreeds(page: 0, limit: 10),
        throwsA(isInstanceOf<NoInternetException>()),
      );
    });

    test('throws InvalidResponseException when FormatException is occurred',
        () async {
      when(() => mockApiDatasource.getCatBreeds(page: 0, limit: 10))
          .thenThrow(const FormatException('Wrong response'));

      expect(
        () => repository.getCatBreeds(page: 0, limit: 10),
        throwsA(isInstanceOf<InvalidResponseException>()),
      );
    });

    test('throws FetchDataException when any other Exception is occurred',
        () async {
      when(() => mockApiDatasource.getCatBreeds(page: 0, limit: 10))
          .thenThrow(Exception('Other Exception'));

      expect(
        () => repository.getCatBreeds(page: 0, limit: 10),
        throwsA(isInstanceOf<FetchDataException>()),
      );
    });
  });

  group('searchCatBreeds', () {
    test('returns list of CatBreed', () async {
      final catBreeds = [
        CatBreedApiModel.fromJson({'id': '1', 'name': 'Abyssinian'}),
        CatBreedApiModel.fromJson({'id': '2', 'name': 'American Bobtail'}),
      ];

      when(() => mockApiDatasource.searchCatBreeds(query: 'American'))
          .thenAnswer((_) async => catBreeds);

      final result = await repository.searchCatBreeds(query: 'American');

      expect(result, isA<List<CatBreed>>());
    });

    test('throws NoInternetException when SocketException is occurred',
        () async {
      when(() => mockApiDatasource.searchCatBreeds(query: 'American'))
          .thenThrow(const SocketException('No internet'));

      expect(
        () => repository.searchCatBreeds(query: 'American'),
        throwsA(isInstanceOf<NoInternetException>()),
      );
    });

    test('throws InvalidResponseException when FormatException is occurred',
        () async {
      when(() => mockApiDatasource.searchCatBreeds(query: 'American'))
          .thenThrow(const FormatException('Wrong response'));

      expect(
        () => repository.searchCatBreeds(query: 'American'),
        throwsA(isInstanceOf<InvalidResponseException>()),
      );
    });

    test('throws FetchDataException when any other Exception is occurred',
        () async {
      when(() => mockApiDatasource.searchCatBreeds(query: 'American'))
          .thenThrow(Exception('Other Exception'));

      expect(
        () => repository.searchCatBreeds(query: 'American'),
        throwsA(isInstanceOf<FetchDataException>()),
      );
    });
  });
}
