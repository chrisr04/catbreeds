import 'package:catbreeds/data/api/model/cat_image.dart';
import 'package:catbreeds/domain/entities/cat_breed.dart';

class CatBreedApiModel extends CatBreed {
  CatBreedApiModel({
    required super.id,
    required super.name,
    required super.description,
    required super.intelligence,
    required super.adaptability,
    required super.origin,
    required super.lifeSpan,
    required super.image,
  });

  factory CatBreedApiModel.fromJson(Map<String, dynamic> json) =>
      CatBreedApiModel(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        description: json['description'] ?? '',
        intelligence: json['intelligence'] ?? 0,
        adaptability: json['adaptability'] ?? 0,
        origin: json['origin'] ?? '',
        lifeSpan: json['life_span'] ?? '',
        image: CatImageApiModel.fromJson(json['image'] ?? {}),
      );
}
