import 'package:catbreeds/shared/values/assets.dart';
import 'package:catbreeds/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

void main() {
  testWidgets('AppAssetImage widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AppAssetImage(
            path: AppAssets.catbreedsWhiteLogo,
          ),
        ),
      ),
    );

    expect(
      find.image(const AssetImage(AppAssets.catbreedsWhiteLogo)),
      findsOneWidget,
    );
  });

  testWidgets('AppNetworkImage widget test', (WidgetTester tester) async {
    const url = 'https://example.com/image.jpg';
    await mockNetworkImages(
      () async => tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppNetworkImage(
              url: url,
            ),
          ),
        ),
      ),
    );

    expect(
      find.image(const NetworkImage(url)),
      findsOneWidget,
    );
  });
}
