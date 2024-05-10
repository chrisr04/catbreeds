part of 'home_bloc.dart';

sealed class HomeState {
  const HomeState(this.data);
  final HomeStateData data;
}

final class HomeInitialState extends HomeState {
  const HomeInitialState(super.data);
}

final class HomeLoadingState extends HomeState {
  const HomeLoadingState(super.data);
}

final class HomeLoadedState extends HomeState {
  const HomeLoadedState(super.data);
}

final class HomeLoadingNextState extends HomeState {
  const HomeLoadingNextState(super.data);
}

final class HomeNextPageLoadedState extends HomeState {
  const HomeNextPageLoadedState(super.data);
}

final class HomeFailureState extends HomeState {
  const HomeFailureState(super.data, {required this.message});
  final String message;
}

class HomeStateData {
  const HomeStateData({
    this.catBreeds = const [],
    this.page = 0,
    this.limit = 20,
    this.isLastPage = false,
  });

  final List<CatBreed> catBreeds;
  final int page;
  final int limit;
  final bool isLastPage;

  HomeStateData copyWith({
    List<CatBreed>? catBreeds,
    int? page,
    int? limit,
    bool? isLastPage,
  }) =>
      HomeStateData(
        catBreeds: catBreeds ?? this.catBreeds,
        page: page ?? this.page,
        limit: limit ?? this.limit,
        isLastPage: isLastPage ?? this.isLastPage,
      );
}
