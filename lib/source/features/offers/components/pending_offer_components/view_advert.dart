import 'package:city17_seller/source/constants/asset_string.dart';
import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/core/components/buttons.dart';
import 'package:flutter/material.dart';

import 'full_image_view.dart';

class ViewAdvert extends StatelessWidget {
  const ViewAdvert({super.key, this.isBiddingScreen = false});
  final bool isBiddingScreen;

  @override
  Widget build(BuildContext context) {
    double containerHeight = isBiddingScreen ? 180 : 200;

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            height: containerHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              image: DecorationImage(
                image: AssetImage(
                  isBiddingScreen ? AssetString.addView : AssetString.street,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          CustomElevatedButtonWidget(
            color: MyColors.backgroundColor,

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FullImageView()),
              );
            },

            buttonText: 'View Advert',
            prefix: null,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
