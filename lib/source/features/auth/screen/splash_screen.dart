// ignore_for_file: use_build_context_synchronously

import 'package:city17_seller/config/route_names.dart';
import 'package:city17_seller/source/constants/asset_string.dart';
import 'package:city17_seller/source/constants/string_data.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();

    animation = CurvedAnimation(parent: controller, curve: Curves.linear);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushNamed(context, RouteNames.home);
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: animation,
              child: Center(
                child: Container(
                  // height: 160,
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  // color: Colors.red,
                  child: Image.asset(AssetString.logo),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              StringData.displayManager,
              style: TextStyle(color: Colors.white38),
            ),
          ],
        ),
      ),
    );
  }
}
