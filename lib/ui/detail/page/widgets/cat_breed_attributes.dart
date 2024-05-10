part of '../page.dart';

class CatBreedAttributes extends StatelessWidget {
  const CatBreedAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final catBreed = ModalRoute.of(context)!.settings.arguments as CatBreed;

    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
        ),
        child: Column(
          children: [
            TextMedium(catBreed.description),
            const SpacingM(),
            BreedAttributeRow(
              labelLeft: AppStrings.originCountry,
              contentLeft: catBreed.origin,
              labelRight: AppStrings.intelligence,
              contentRight: catBreed.intelligence.toString(),
            ),
            const SpacingM(),
            BreedAttributeRow(
              labelLeft: AppStrings.lifeSpan,
              contentLeft: catBreed.lifeSpan,
              labelRight: AppStrings.adaptability,
              contentRight: catBreed.adaptability.toString(),
            ),
          ],
        ),
      ),
    );
  }
}

class BreedAttributeRow extends StatelessWidget {
  const BreedAttributeRow({
    super.key,
    required this.labelLeft,
    required this.contentLeft,
    required this.labelRight,
    required this.contentRight,
  });

  final String labelLeft;
  final String contentLeft;
  final String labelRight;
  final String contentRight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextMedium(
                labelLeft,
                weight: FontWeight.w700,
              ),
              TextSmall(
                contentLeft,
              ),
            ],
          ),
        ),
        const SpacingM(axis: SpacingAxis.x),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextMedium(
                labelRight,
                weight: FontWeight.w700,
              ),
              TextSmall(
                contentRight,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
