import 'package:city17_seller/config/on_generate_route.dart';
import 'package:city17_seller/config/route_names.dart';
import 'package:city17_seller/config/theme_data.dart';
import 'package:city17_seller/utils/bloc_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocUtils.mainList,

      child: MaterialApp(
        title: 'City17 Seller',
        debugShowCheckedModeBanner: false,
        initialRoute: RouteNames.signIn,
        onGenerateRoute: RouteGenerator.onGenerateRoute,
        themeMode: ThemeMode.dark,
        theme: MainThemeData.darkThemeData(context),

        darkTheme: ThemeData.dark(),
      ),
    );
  }
}
