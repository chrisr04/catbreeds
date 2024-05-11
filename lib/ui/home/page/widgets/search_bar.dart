part of '../page.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: SearchInput(
        hintText: AppStrings.searchYourFavariteCatsByBreed,
        onSubmit: (value) => _submitSearch(context, value),
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
