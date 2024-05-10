part of '../page.dart';

class DetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DetailAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final catBreed = ModalRoute.of(context)!.settings.arguments as CatBreed;

    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      iconTheme: IconThemeData(
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      title: TextHeading6(
        catBreed.name,
        color: Theme.of(context).colorScheme.onPrimary,
        weight: FontWeight.w700,
      ),
    );
  }
}
