import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/core/components/buttons.dart';
import 'package:city17_seller/source/core/components/custom_container.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:city17_seller/source/features/offers/components/auto_approve_ads.dart';
import 'package:city17_seller/source/features/offers/components/hotel_address.dart';
import 'package:city17_seller/source/features/offers/components/pending_offer_components/view_advert.dart';
import 'package:flutter/material.dart';

class BiddingAdInfoCard extends StatelessWidget {
  const BiddingAdInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      color: MyColors.darkThemeBG,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Advertiser',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'James Wilson',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              HourDateInfoCardItem(title: 'Hours per day', value: '04'),
              HourDateInfoCardItem(title: 'Start', value: '01-04-25'),
              HourDateInfoCardItem(title: 'End', value: '01-06-25'),
            ],
          ),

          SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ViewAdvert(isBiddingScreen: true),
          ),
          SizedBox(height: 6),
          HotelAddress(),
          AutoApproveAds(isBidding: true),
          const SizedBox(height: 2.75),
          AcceptRejectButtons(isBidding: true),
        ],
      ),
    );
  }
}

class HourDateInfoCardItem extends StatelessWidget {
  final String title;
  final String value;

  const HourDateInfoCardItem({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: MyColors.lightBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 7,
                  fontWeight: FontWeight.w100,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
