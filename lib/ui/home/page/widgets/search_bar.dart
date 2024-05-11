part of '../page.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final paddingTop = MediaQuery.viewPaddingOf(context).top;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(20.0),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.lg,
      ).copyWith(
        top: paddingTop + AppSpacing.md,
      ),
      child: Column(
        children: [
          const AppAssetImage(
            path: AppAssets.catbreedsWhiteLogo,
            height: 75.0,
          ),
          const SpacingM(),
          SearchInput(
            hintText: AppStrings.searchYourFavariteCatsByBreed,
            onSubmit: (value) => _submitSearch(context, value),
          ),
        ],
      ),
    );
  }

  void _submitSearch(BuildContext context, String query) {
    final homeBloc = HomeBlocDependency.of(context);
    if (query.isEmpty) {
      homeBloc.events.add(
        const LoadCatBreedsEvent(
          page: 0,
          limit: 10,
        ),
      );
    } else {
      homeBloc.events.add(
        SearchCatBreedEvent(
          query: query,
        ),
      );
    }
  }
}
