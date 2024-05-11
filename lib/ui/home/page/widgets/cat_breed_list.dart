part of '../page.dart';

class HomeCatBreedList extends StatelessWidget {
  const HomeCatBreedList({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = HomeBlocDependency.of(context);

    return Expanded(
      child: StreamBuilder(
        stream: homeBloc.stream,
        initialData: homeBloc.state,
        builder: (context, snapshot) {
          if (snapshot.data == null) return const SizedBox.shrink();

          final state = snapshot.data!;
          final catBreeds = state.data.catBreeds;

          return switch (state) {
            HomeLoadingState() => const Center(
                child: CircularProgressIndicator(),
              ),
            HomeFailureState() => ErrorView(
                message: state.message,
              ),
            _ => PaginatedListView(
                isLastPage: state.data.isLastPage,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.sl,
                ),
                onLoadNextPage: () {
                  homeBloc.events.add(
                    const LoadNextCatBreedsEvent(),
                  );
                },
                children: catBreeds.map(
                  (catBreed) {
                    return FadeAnimation(
                      child: CatBreedCard(
                        title: catBreed.name,
                        image: catBreed.image.url,
                        tag: catBreed.id,
                        rightLabel: AppStrings.more,
                        rows: [
                          CatBreedRowItem(
                            labelLeft: AppStrings.originCountry,
                            contentLeft: catBreed.origin,
                            labelRight: AppStrings.intelligence,
                            contentRight: catBreed.intelligence.toString(),
                          ),
                        ],
                        onTap: () => _navigateToDetail(context, catBreed),
                      ),
                    );
                  },
                ).toList(),
              )
          };
        },
      ),
    );
  }

  void _navigateToDetail(BuildContext context, CatBreed catBreed) {
    Navigator.pushNamed(
      context,
      RouteNames.detail,
      arguments: catBreed,
    );
  }
}
