part of '../page.dart';

class HomeHeaderLogo extends StatelessWidget {
  const HomeHeaderLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final paddingTop = MediaQuery.viewPaddingOf(context).top;
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Padding(
        padding: EdgeInsets.only(
          top: paddingTop + AppSpacing.md,
        ),
        child: const AppAssetImage(
          path: AppAssets.catbreedsWhiteLogo,
          height: 75.0,
        ),
      ),
    );
  }
}
