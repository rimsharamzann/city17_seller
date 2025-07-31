import 'package:city17_seller/source/constants/asset_string.dart';
import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/core/components/buttons.dart';
import 'package:city17_seller/source/core/components/custom_container.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:city17_seller/source/features/offers/components/active_offer_components/active_time_slots.dart';
import 'package:flutter/material.dart';

class ActiveBidCard extends StatelessWidget {
  const ActiveBidCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ActiveTimeSlots(time: '12:00 am', rate: '\$14'),
            Expanded(child: SellerAddInfo()),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ActiveTimeSlots(
              time: '12:00 am',
              title: 'No Request Approved',
              color: MyColors.primaryColor,
            ),
            Expanded(
              child: const EmptyDataContainer(
                messsage: '13 Pending requests',
                color: MyColors.primaryColor,
                underLined: true,
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ActiveTimeSlots(time: '12:00 am', rate: '\$14'),
            Expanded(child: SellerAddInfo()),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ActiveTimeSlots(time: '12:00 am', rate: '\$14'),
            Expanded(child: SellerAddInfo()),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ActiveTimeSlots(
              time: '12:00 am',
              title: ' Reserved for Fixed Offer',
              color: MyColors.lightBackground,
            ),
            Expanded(
              child: const EmptyDataContainer(
                messsage: ' Reserved for Fixed Offer',
                color: MyColors.textColor,
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ActiveTimeSlots(
              time: '12:00 am',
              title: 'No request',
              color: Colors.pinkAccent,
            ),
            Expanded(
              child: const EmptyDataContainer(
                messsage: 'No request',
                color: Colors.pinkAccent,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class EmptyDataContainer extends StatelessWidget {
  const EmptyDataContainer({
    super.key,
    required this.messsage,
    required this.color,
    this.underLined,
  });
  final String messsage;
  final Color color;
  final bool? underLined;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      margin: EdgeInsets.all(6),
      height: 130,
      child: Center(
        child: Text(
          messsage,

          style: context.textTheme.bodyMedium?.copyWith(
            fontSize: 16,
            color: color,

            decorationColor: color,
            decoration: underLined == true
                ? TextDecoration.underline
                : TextDecoration.none,
          ),
        ),
      ),
    );
  }
}

class SellerAddInfo extends StatelessWidget {
  const SellerAddInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      margin: EdgeInsets.zero,
      color: MyColors.containerBg,
      borderRadius: BorderRadius.circular(4),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      child: Image.asset(AssetString.profile),
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Jamie Olivier',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),

                DataDetail(title: 'Scehedule : ', value: '01-April-25'),
                SizedBox(height: 6),
                DataDetail(title: 'Hours per day : ', value: '04'),

                SizedBox(height: 6),
                CustomElevatedButtonWidget(
                  width: context.width,
                  onPressed: () {},
                  buttonText: 'View Advert',
                  prefix: null,
                  textColor: Colors.white,
                  color: MyColors.darkThemeBG,
                ),
              ],
            ),
          ),
          Expanded(flex: 2, child: _addImage()),
        ],
      ),
    );
  }

  Widget _addImage() {
    return Container(
      margin: EdgeInsets.only(left: 6),
      height: 120,
      child: ClipRRect(
        child: Image.asset(AssetString.addView, fit: BoxFit.cover),
      ),
    );
  }
}

class DataDetail extends StatelessWidget {
  final String title;
  final String value;

  const DataDetail({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: context.textTheme.bodySmall?.copyWith(fontSize: 10)),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
