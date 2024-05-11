import 'package:catbreeds/data/api/model/cat_breed.dart';
import 'package:catbreeds/data/api/model/cat_image.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CatImageApiModel', () {
    test('fromJson should return a valid CatImageApiModel instance', () {
      final json = {'id': 'vsXQ8RQ40', 'url': 'https://example.com/cat.jpg'};

      final catImage = CatImageApiModel.fromJson(json);

      expect(catImage.id, json['id']);
      expect(catImage.url, json['url']);
    });

    test('fromJson should handle null values gracefully', () {
      final json = {'id': null, 'url': null};

      final catImage = CatImageApiModel.fromJson(json);

      expect(catImage.id, '');
      expect(catImage.url, '');
    });
  });

  group('CatBreedApiModel', () {
    test('fromJson should correctly deserialize JSON', () {
      final Map<String, dynamic> jsonData = {
        'id': 'vsXQ8RQ40',
        'name': 'Persian',
        'description': 'The Persian cat is a long-haired breed.',
        'intelligence': 4,
        'adaptability': 3,
        'origin': 'Iran',
        'life_span': '15-20',
        'alt_names': 'Fox Cat, Long-Haired Abyssinian',
        'temperament': 'Loyal, Inquisitive, Friendly, Quiet, Gentle',
        'image': {'url': 'https://example.com/persian.jpg'},
      };

      final catBreed = CatBreedApiModel.fromJson(jsonData);

      expect(catBreed.id, equals('vsXQ8RQ40'));
      expect(catBreed.name, equals('Persian'));
      expect(
        catBreed.description,
        equals('The Persian cat is a long-haired breed.'),
      );
      expect(catBreed.intelligence, equals(4));
      expect(catBreed.adaptability, equals(3));
      expect(catBreed.origin, equals('Iran'));
      expect(catBreed.lifeSpan, equals('15-20'));
      expect(catBreed.altNames, equals('Fox Cat, Long-Haired Abyssinian'));
      expect(
        catBreed.temperament,
        equals('Loyal, Inquisitive, Friendly, Quiet, Gentle'),
      );
      expect(catBreed.image.url, equals('https://example.com/persian.jpg'));
    });
  });
}
