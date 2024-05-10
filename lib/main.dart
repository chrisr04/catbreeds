import 'package:catbreeds/core/core.dart';
import 'package:catbreeds/shared/themes/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CoreDependencies(
      child: DataSourceDependencies(
        child: RepositoryDependencies(
          child: BlocDependencies(
            child: MaterialApp(
              theme: appTheme,
              routes: appRoutes,
              initialRoute: RouteNames.initialRoute,
            ),
          ),
        ),
      ),
    );
  }
}
