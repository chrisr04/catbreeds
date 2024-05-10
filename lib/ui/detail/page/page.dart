import 'package:flutter/material.dart';
import 'package:catbreeds/domain/domain.dart';
import 'package:catbreeds/shared/values/assets.dart';
import 'package:catbreeds/shared/values/strings.dart';
import 'package:catbreeds/shared/widgets/widgets.dart';

part 'widgets/cat_image.dart';
part 'widgets/cat_breed_attributes.dart';
part 'widgets/app_bar.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DetailAppBar(),
      body: Column(
        children: [
          CatImage(),
          CatBreedAttributes(),
        ],
      ),
    );
  }
}
