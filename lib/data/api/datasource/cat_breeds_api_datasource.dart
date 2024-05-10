import 'dart:convert';
import 'package:catbreeds/core/core.dart';
import 'package:catbreeds/data/api/model/cat_breed.dart';

class CatBreedsApiDataSource {
  const CatBreedsApiDataSource({required this.http});

  final HttpClient http;

  Future<List<CatBreedApiModel>> getCatBreeds({
    required int page,
    required int limit,
  }) async {
    final uri = Uri.parse('${http.baseUrl}/breeds?limit=$limit&page=$page');
    final response = await http.client.get(uri, headers: http.headers);
    final body = jsonDecode(response.body) as List;
    final catBreeds = body.map((e) => CatBreedApiModel.fromJson(e)).toList();
    return catBreeds;
  }

  Future<List<CatBreedApiModel>> searchCatBreed({required String query}) async {
    final uri = Uri.parse('${http.baseUrl}/breeds/search?q=$query');
    final response = await http.client.get(uri, headers: http.headers);
    final body = jsonDecode(response.body) as List;
    final catBreeds = body.map((e) => CatBreedApiModel.fromJson(e)).toList();
    return catBreeds;
  }
}
