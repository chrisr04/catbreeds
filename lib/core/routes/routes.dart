import 'package:flutter/material.dart';
import 'package:catbreeds/ui/home/home.dart';
import 'package:catbreeds/ui/detail/detail.dart';

class RouteNames {
  static const initialRoute = '/';
  static const detail = '/detail';
}

Map<String, WidgetBuilder> appRoutes = {
  RouteNames.initialRoute: (BuildContext context) => const HomePage(),
  RouteNames.detail: (BuildContext context) => const DetailPage(),
};
