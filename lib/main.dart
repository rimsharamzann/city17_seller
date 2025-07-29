import 'package:city17_seller/config/on_generate_route.dart';
import 'package:city17_seller/config/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();

  WidgetsFlutterBinding.ensureInitialized();

  RouterFluro.initRoutes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: MainThemeData.darkThemeData(context),

      onGenerateRoute: RouterFluro.fluroRouter.generator,
    );
  }
}
