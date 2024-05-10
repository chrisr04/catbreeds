import 'package:flutter/material.dart';
import 'package:catbreeds/data/data.dart';
import 'package:catbreeds/ui/home/home.dart';
import 'package:catbreeds/domain/domain.dart';
import 'package:catbreeds/core/http/http_client.dart';
import 'package:http/http.dart';

part 'bloc_dependencies.dart';
part 'repository_dependencies.dart';
part 'datasource_dependencies.dart';

class CoreDependencies extends StatelessWidget {
  const CoreDependencies({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return HttpDependency(
      http: HttpClient(
        client: Client(),
      ),
      child: child,
    );
  }
}

class HttpDependency extends InheritedWidget {
  const HttpDependency({
    super.key,
    required super.child,
    required this.http,
  });

  final HttpClient http;

  static HttpClient of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<HttpDependency>()!.http;

  @override
  bool updateShouldNotify(HttpDependency oldWidget) => false;
}
