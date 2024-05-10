import 'package:catbreeds/domain/entities/cat_breed.dart';

abstract class CatBreedsRepository {
  Future<List<CatBreed>> getCatBreeds({
    required int page,
    required int limit,
  });
  Future<List<CatBreed>> searchCatBreeds({required String query});
}
