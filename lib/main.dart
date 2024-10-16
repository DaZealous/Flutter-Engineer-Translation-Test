import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_engineer_translation_test/routes/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/injections/locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  configureDependencies();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Euclid Circular A'
      ),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homePage,
      routes: AppRoutes.routes,
    );
  }
}
