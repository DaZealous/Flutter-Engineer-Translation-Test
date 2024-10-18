import 'package:flutter/material.dart';
import 'package:flutter_engineer_translation_test/presentation/home_page/home_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    homePage: (context) => HomePage(),
  };

  static String homePage = '/';
}
