import 'package:city17_seller/source/constants/asset_string.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              // color: Colors.red,
              child: Image.asset(AssetString.logo),
            ),
          ),
        ],
      ),
    );
  }
}
