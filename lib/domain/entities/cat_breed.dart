import 'package:catbreeds/domain/entities/cat_image.dart';

class CatBreed {
  const CatBreed({
    required this.id,
    required this.name,
    required this.description,
    required this.intelligence,
    required this.adaptability,
    required this.origin,
    required this.lifeSpan,
    required this.altNames,
    required this.temperament,
    required this.image,
  });

  final String id;
  final String name;
  final String description;
  final int intelligence;
  final int adaptability;
  final String origin;
  final String lifeSpan;
  final String altNames;
  final String temperament;
  final CatImage image;
}
