part of '../page.dart';

class CatImage extends StatelessWidget {
  const CatImage({super.key});

  @override
  Widget build(BuildContext context) {
    final catBreed = ModalRoute.of(context)!.settings.arguments as CatBreed;
    final size = MediaQuery.sizeOf(context);
    return Hero(
      tag: catBreed.id,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(15.0),
          ),
          child: catBreed.image.url.isNotEmpty
              ? Image.network(
                  catBreed.image.url,
                  height: size.height * 0.45,
                  fit: BoxFit.cover,
                )
              : SizedBox(
                  height: size.height * 0.45,
                  child: ColoredBox(
                    color: Theme.of(context).colorScheme.onSurface,
                    child: const AppAssetImage(
                      url: AppAssets.catbreedsWhiteLogo,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
