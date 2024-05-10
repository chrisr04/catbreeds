part of 'dependencies.dart';

class DataSourceDependencies extends StatelessWidget {
  const DataSourceDependencies({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CatBreedsApiDataSourceDependency(
      datasource: CatBreedsApiDataSource(
        http: HttpDependency.of(context),
      ),
      child: child,
    );
  }
}

class CatBreedsApiDataSourceDependency extends InheritedWidget {
  const CatBreedsApiDataSourceDependency({
    super.key,
    required super.child,
    required this.datasource,
  });

  final CatBreedsApiDataSource datasource;

  static CatBreedsApiDataSource of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<CatBreedsApiDataSourceDependency>()!
      .datasource;

  @override
  bool updateShouldNotify(CatBreedsApiDataSourceDependency oldWidget) => false;
}
