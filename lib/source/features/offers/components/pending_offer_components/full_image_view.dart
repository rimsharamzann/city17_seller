import 'package:city17_seller/source/constants/asset_string.dart';
import 'package:flutter/material.dart';

class FullImageView extends StatelessWidget {
  const FullImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Center(
        child: InteractiveViewer(child: Image.asset(AssetString.addView)),
      ),
    );
  }
}
