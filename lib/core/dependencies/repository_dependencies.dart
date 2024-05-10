part of 'dependencies.dart';

class RepositoryDependencies extends StatelessWidget {
  const RepositoryDependencies({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CatBreedsRepositoryDependency(
      repository: CatBreedsRepositoryImpl(
        api: CatBreedsApiDataSourceDependency.of(context),
      ),
      child: child,
    );
  }
}

class CatBreedsRepositoryDependency extends InheritedWidget {
  const CatBreedsRepositoryDependency({
    super.key,
    required super.child,
    required this.repository,
  });

  final CatBreedsRepository repository;

  static CatBreedsRepository of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<CatBreedsRepositoryDependency>()!
      .repository;

  @override
  bool updateShouldNotify(CatBreedsRepositoryDependency oldWidget) => false;
}
