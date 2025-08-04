import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/core/components/buttons.dart';
import 'package:city17_seller/source/core/components/custom_container.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:city17_seller/source/features/offers/components/active_offer_components/active_fixed_components.dart';
import 'package:city17_seller/source/features/offers/components/auto_approve_ads.dart';
import 'package:city17_seller/source/features/offers/components/hotel_address.dart';
import 'package:city17_seller/source/features/offers/components/pending_offer_components/view_advert.dart';
import 'package:city17_seller/source/features/offers/components/time_slots.dart';
import 'package:flutter/material.dart';

class FixedCard extends StatelessWidget {
  const FixedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(color: MyColors.containerBg, child: FixedAdInfoCard());
  }
}

class FixedAdInfoCard extends StatelessWidget {
  const FixedAdInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AdvertizerName(),
        SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              HourDateInfoCard(title: 'Hours per day', value: '04'),
              SizedBox(width: 6),
              HourDateInfoCard(title: 'Start', value: '01-04-25'),
              SizedBox(width: 6),
              HourDateInfoCard(title: 'End', value: '01-06-25'),
            ],
          ),
        ),
        SizedBox(height: 6),
        PaymentPerDay(),

        SizedBox(height: 10),
        TimeSlotSelector(),
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ViewAdvert(),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: HotelAddress(),
        ),
        AutoApproveAds(isBidding: false,),
        AcceptRejectButtons(isBidding: false),
      ],
    );
  }
}

class AdvertizerName extends StatelessWidget {
  const AdvertizerName({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      borderRadius: BorderRadius.circular(4),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      color: MyColors.darkThemeBG,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Advertiser',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
          ),
          Text(
            'James Wilson',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class HourDateInfoCard extends StatelessWidget {
  final String title;
  final String value;

  const HourDateInfoCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomContainer(
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 6),
        color: MyColors.lightBackground,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: context.textTheme.bodySmall?.copyWith(
                fontSize: 8,
                color: MyColors.textColor,
              ),
            ),
            SizedBox(height: 4),
            Text(
              value,
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
