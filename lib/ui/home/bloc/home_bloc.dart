import 'dart:async';
import 'package:catbreeds/domain/domain.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc {
  HomeBloc({required this.repository}) {
    _output.add(state);
    _output.stream.listen(_stateHandler);
    _input.stream.listen(_eventHandler);
  }

  final CatBreedsRepository repository;
  HomeState state = const HomeInitialState(HomeStateData());
  final StreamController<HomeEvent> _input = StreamController();
  final StreamController<HomeState> _output = StreamController.broadcast();

  Stream<HomeState> get stream => _output.stream;
  StreamSink<HomeEvent> get events => _input.sink;

  void _stateHandler(HomeState newState) {
    state = newState;
  }

  void _eventHandler(HomeEvent event) {
    switch (event) {
      case LoadCatBreedsEvent():
        _onLoadCatBreedsEvent(event);
        break;
      case LoadNextCatBreedsEvent():
        _onLoadNextCatBreedsEvent(event);
        break;
      case SearchCatBreedEvent():
        _onSearchCatBreedEvent(event);
        break;
      default:
    }
  }

  void _onLoadCatBreedsEvent(LoadCatBreedsEvent event) async {
    _output.add(HomeLoadingState(state.data));
    try {
      final catBreeds = await repository.getCatBreeds(
        page: event.page,
        limit: event.limit,
      );

      _output.add(
        HomeLoadedState(
          state.data.copyWith(
            catBreeds: catBreeds,
            page: event.page + 1,
            limit: event.limit,
            isLastPage: false,
          ),
        ),
      );
    } catch (e) {
      _output.add(
        HomeFailureState(
          state.data,
          message: e.toString(),
        ),
      );
    }
  }

  void _onLoadNextCatBreedsEvent(LoadNextCatBreedsEvent event) async {
    _output.add(HomeLoadingNextState(state.data));
    try {
      final catBreeds = await repository.getCatBreeds(
        page: state.data.page,
        limit: state.data.limit,
      );

      final isLastPage =
          catBreeds.isEmpty || catBreeds.length < state.data.limit;

      _output.add(
        HomeNextPageLoadedState(
          state.data.copyWith(
            catBreeds: state.data.catBreeds + catBreeds,
            page: state.data.page + 1,
            isLastPage: isLastPage,
          ),
        ),
      );
    } catch (e) {
      _output.add(
        HomeFailureState(
          state.data,
          message: e.toString(),
        ),
      );
    }
  }

  void _onSearchCatBreedEvent(SearchCatBreedEvent event) async {
    _output.add(HomeLoadingState(state.data));
    try {
      final catBreeds = await repository.searchCatBreeds(
        query: event.query,
      );

      _output.add(
        HomeLoadedState(
          state.data.copyWith(
            catBreeds: catBreeds,
            isLastPage: true,
          ),
        ),
      );
    } catch (e) {
      _output.add(
        HomeFailureState(
          state.data,
          message: e.toString(),
        ),
      );
    }
  }

  void dispose() {
    _input.close();
    _output.close();
  }
}
