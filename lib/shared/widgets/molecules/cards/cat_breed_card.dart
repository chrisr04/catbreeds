import 'package:catbreeds/shared/values/assets.dart';
import 'package:catbreeds/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CatBreedRowItem {
  const CatBreedRowItem({
    this.labelLeft,
    this.contentLeft,
    this.labelRight,
    this.contentRight,
  });
  final String? labelLeft;
  final String? contentLeft;
  final String? labelRight;
  final String? contentRight;
}

class CatBreedCard extends StatelessWidget {
  const CatBreedCard({
    super.key,
    required this.title,
    required this.image,
    required this.rows,
    required this.rightLabel,
    required this.onTap,
    this.tag,
  });

  final String title;
  final String? tag;
  final String rightLabel;
  final String image;
  final List<CatBreedRowItem> rows;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: AppSpacing.sm,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.md,
          horizontal: AppSpacing.md,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.08),
              offset: const Offset(0.0, 8.0),
              blurRadius: 16.0,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextHeading6(
                    title,
                    weight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    TextMedium(
                      rightLabel,
                      weight: FontWeight.w600,
                      color: Theme.of(context).primaryColor,
                    ),
                    AppIcon(
                      Icons.chevron_right_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppSpacing.md,
              ),
              child: Hero(
                tag: tag ?? UniqueKey(),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                  child: image.isNotEmpty
                      ? Image.network(
                          image,
                          height: 300.0,
                          fit: BoxFit.cover,
                        )
                      : SizedBox(
                          height: 300.0,
                          child: ColoredBox(
                            color: Theme.of(context).colorScheme.onSurface,
                            child: const AppAssetImage(
                              path: AppAssets.catbreedsWhiteLogo,
                            ),
                          ),
                        ),
                ),
              ),
            ),
            for (final row in rows)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextMedium(
                          row.labelLeft ?? '',
                          weight: FontWeight.w700,
                        ),
                        TextSmall(
                          row.contentLeft ?? '',
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextMedium(
                          row.labelRight ?? '',
                          weight: FontWeight.w700,
                        ),
                        TextSmall(
                          row.contentRight ?? '',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
