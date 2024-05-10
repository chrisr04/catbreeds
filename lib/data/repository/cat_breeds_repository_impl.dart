import 'dart:io';
import 'package:catbreeds/core/core.dart';
import 'package:catbreeds/domain/entities/cat_breed.dart';
import 'package:catbreeds/data/api/datasource/cat_breeds_api_datasource.dart';
import 'package:catbreeds/domain/repositories/cat_breeds_repository.dart';

class CatBreedsRepositoryImpl implements CatBreedsRepository {
  const CatBreedsRepositoryImpl({required this.api});

  final CatBreedsApiDataSource api;

  @override
  Future<List<CatBreed>> getCatBreeds({
    required int page,
    required int limit,
  }) async {
    try {
      final catBreeds = await api.getCatBreeds(page: page, limit: limit);
      return catBreeds;
    } on SocketException {
      throw NoInternetException();
    } on FormatException {
      throw InvalidResponseException();
    } catch (e) {
      throw FetchDataException(e.toString());
    }
  }

  @override
  Future<List<CatBreed>> searchCatBreeds({required String query}) async {
    try {
      final catBreeds = await api.searchCatBreed(query: query);
      return catBreeds;
    } on SocketException {
      throw NoInternetException();
    } on FormatException {
      throw InvalidResponseException();
    } catch (e) {
      throw FetchDataException(e.toString());
    }
  }
}
