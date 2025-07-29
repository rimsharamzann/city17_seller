import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/constants/string_data.dart';
import 'package:city17_seller/source/core/components/custom_container.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class AdPricingWidget extends StatelessWidget {
  const AdPricingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 4),
          Text(
StringData.addPricingPrefreneces,            style: context.textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 8),
          BidOffer(
            text: StringData.letMultipleBuyersCompete,
          ),
          SizedBox(height: 10),
          BidOffer(
            text:
             StringData.allowTheBuyerToPayFixedAmount,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(
                    StringData.fixedOfferPrices,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                SwitchWidget(value: false, onChanged: (value) {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BidOffer extends StatelessWidget {
  const BidOffer({super.key, this.child, required this.text});
  final Widget? child;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 55,
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.all(10),
      width: context.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: MyColors.backgroundColor,
      ),
      child: Column(
        children: [
          SizedBox(
            child:
                child ??
                Text(
                  StringData.biddingOffers,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                  ),
                ),
          ),
          SizedBox(height: 8),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.info_outline, color: Colors.white),
              SizedBox(width: 6),
              Expanded(
                child: Text(text, maxLines: 2, overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
