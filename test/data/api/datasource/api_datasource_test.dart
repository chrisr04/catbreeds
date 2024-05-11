import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:catbreeds/core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:catbreeds/data/api/model/cat_breed.dart';
import 'package:catbreeds/data/api/datasource/cat_breeds_api_datasource.dart';

void main() {
  late HttpClient httpClient;
  late CatBreedsApiDataSource catBreedsApiDataSource;
  final responseData = [
    {'id': '1', 'name': 'Abyssinian'},
    {'id': '2', 'name': 'American Bobtail'},
  ];

  setUp(() {
    httpClient = HttpClient(
      client: MockClient(
        (request) async => Response(jsonEncode(responseData), 200),
      ),
    );
    catBreedsApiDataSource = CatBreedsApiDataSource(http: httpClient);
  });

  test('getCatBreeds returns list of CatBreedApiModel', () async {
    final expectedCatBreeds = [
      CatBreedApiModel.fromJson({'id': '1', 'name': 'Abyssinian'}),
      CatBreedApiModel.fromJson({'id': '2', 'name': 'American Bobtail'}),
    ];

    final result = await catBreedsApiDataSource.getCatBreeds(
      page: 0,
      limit: 10,
    );

    expect(result, isA<List<CatBreedApiModel>>());
    expect(result.length, equals(expectedCatBreeds.length));
  });

  test('searchCatBreed returns list of CatBreedApiModel', () async {
    final expectedCatBreeds = [
      CatBreedApiModel.fromJson({'id': '1', 'name': 'Abyssinian'}),
      CatBreedApiModel.fromJson({'id': '2', 'name': 'American Bobtail'}),
    ];

    final result = await catBreedsApiDataSource.searchCatBreeds(
      query: 'Abyssinian',
    );

    expect(result, isA<List<CatBreedApiModel>>());
    expect(result.length, equals(expectedCatBreeds.length));
  });
}
