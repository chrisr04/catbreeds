part of 'home_bloc.dart';

sealed class HomeEvent {
  const HomeEvent();
}

final class LoadCatBreedsEvent extends HomeEvent {
  const LoadCatBreedsEvent({
    required this.page,
    required this.limit,
  });
  final int page;
  final int limit;
}

final class LoadNextCatBreedsEvent extends HomeEvent {
  const LoadNextCatBreedsEvent();
}

final class SearchCatBreedEvent extends HomeEvent {
  const SearchCatBreedEvent({required this.query});
  final String query;
}
