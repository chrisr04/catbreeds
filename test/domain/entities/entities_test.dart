import 'package:catbreeds/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CatImage', () {
    test('constructor initializes id and url correctly', () {
      const String id = '123';
      const String url = 'https://example.com/cat.jpg';

      const catImage = CatImage(id: id, url: url);

      expect(catImage.id, id);
      expect(catImage.url, url);
    });
  });

  group('CatBreed', () {
    test('should create a CatBreed instance', () {
      const catImage = CatImage(id: '123', url: 'http://example.com/image.jpg');
      const catBreed = CatBreed(
        id: '1',
        name: 'Persian',
        description: 'Persian cat description',
        intelligence: 5,
        adaptability: 3,
        origin: 'Persia',
        lifeSpan: '15-20',
        altNames: 'Fox Cat, Long-Haired Abyssinian',
        temperament: 'Loyal, Inquisitive, Friendly, Quiet, Gentle',
        image: catImage,
      );

      expect(catBreed.id, '1');
      expect(catBreed.name, 'Persian');
      expect(catBreed.description, 'Persian cat description');
      expect(catBreed.intelligence, 5);
      expect(catBreed.adaptability, 3);
      expect(catBreed.origin, 'Persia');
      expect(catBreed.lifeSpan, '15-20');
      expect(catBreed.altNames, 'Fox Cat, Long-Haired Abyssinian');
      expect(
        catBreed.temperament,
        'Loyal, Inquisitive, Friendly, Quiet, Gentle',
      );
      expect(catBreed.image, catImage);
    });
  });
}
