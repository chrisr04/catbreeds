import 'package:catbreeds/domain/entities/cat_image.dart';

class CatImageApiModel extends CatImage {
  CatImageApiModel({
    required super.id,
    required super.url,
  });

  factory CatImageApiModel.fromJson(Map<String, dynamic> json) =>
      CatImageApiModel(
        id: json['id'] ?? '',
        url: json['url'] ?? '',
      );
}
