part of 'dependencies.dart';

class BlocDependencies extends StatelessWidget {
  const BlocDependencies({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return HomeBlocDependency(
      bloc: HomeBloc(
        repository: CatBreedsRepositoryDependency.of(context),
      ),
      child: child,
    );
  }
}

class HomeBlocDependency extends InheritedWidget {
  const HomeBlocDependency({
    super.key,
    required super.child,
    required this.bloc,
  });

  final HomeBloc bloc;

  static HomeBloc of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<HomeBlocDependency>()!.bloc;

  @override
  bool updateShouldNotify(HomeBlocDependency oldWidget) => true;
}
