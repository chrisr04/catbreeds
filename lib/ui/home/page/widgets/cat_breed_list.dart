part of '../page.dart';

class HomeCatBreedList extends StatelessWidget {
  const HomeCatBreedList({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final homeBloc = HomeBlocDependency.of(context);

    return StreamBuilder(
      stream: homeBloc.stream,
      initialData: homeBloc.state,
      builder: (context, snapshot) {
        if (snapshot.data == null) return const SizedBox.shrink();

        final state = snapshot.data!;
        final catBreeds = state.data.catBreeds;
        final isLastPage = state.data.isLastPage;

        return switch (state) {
          HomeLoadingState() => const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          HomeFailureState() => SliverFillRemaining(
              hasScrollBody: false,
              child: ErrorView(
                message: state.message,
              ),
            ),
          _ => catBreeds.isEmpty && isLastPage
              ? const SliverFillRemaining(
                  hasScrollBody: false,
                  child: NoResult(),
                )
              : SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.sl,
                  ),
                  sliver: PaginatedSliverListView(
                    controller: scrollController,
                    isLastPage: state.data.isLastPage,
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
                  ),
                )
        };
      },
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
