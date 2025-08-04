import 'package:city17_seller/source/constants/asset_string.dart';
import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/core/components/buttons.dart';
import 'package:city17_seller/source/core/components/custom_container.dart';
import 'package:city17_seller/source/core/components/information_text.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:city17_seller/source/features/home/components/display_intallation_components.dart';
import 'package:city17_seller/source/features/home/enums/drop_down_enum.dart';
import 'package:city17_seller/source/features/offers/components/active_offer_components/fixed_time_slots.dart';
import 'package:city17_seller/source/features/offers/components/hotel_address.dart';
import 'package:city17_seller/source/features/offers/components/pending_offer_components/fixed_card.dart';
import 'package:city17_seller/source/features/offers/screens/advert_payment.dart';
import 'package:flutter/material.dart';

class AdvertDetailScreen extends StatefulWidget {
  const AdvertDetailScreen({super.key});

  @override
  State<AdvertDetailScreen> createState() => _AdvertDetailScreenState();
}

class _AdvertDetailScreenState extends State<AdvertDetailScreen> {
  ScheduleType? scheduleType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Advert Details',
          style: context.textTheme.bodyLarge?.copyWith(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _advertizerData(),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Campaign Name',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: MyColors.successColor2.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'Running',
                      style: TextStyle(
                        color: MyColors.successColor2,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),
              CampaignDetailsGrid(),
              SizedBox(height: 10),
              HotelAddress(),
              SizedBox(height: 10),
              SizedBox(
                height: 230,
                child: Row(
                  children: [
                    FixedTimeSlots(
                      width: 65,
                      bgColor: MyColors.lightBackground,
                    ),
                    Expanded(flex: 2, child: _viewAd()),
                  ],
                ),
              ),
              SizedBox(height: 10),

              InformationText(
                text:
                    'Bidding allows multiple offers per hour — the highest bid wins. Earnings vary per cycle based on accepted bids.',
                icon: Icons.warning_rounded,
                iconColor: MyColors.primaryColor,
                textColor: MyColors.textColor,
                fontSize: 10,
                fontWeight: FontWeight.w200,
              ),
              SizedBox(height: 10),
              CustomContainer(
                child: RadioButtonsWithTitle<ScheduleType>(
                  title:
                      'Select how often you want to receive payments from the buyer.',
                  options: ScheduleType.values,
                  getTitle: (type) => type.title,
                  onChanged: (value) {
                    setState(() {
                      scheduleType = value;
                    });
                  },
                ),
              ),

              SizedBox(height: 10),
              Align(
                alignment: Alignment.bottomRight,
                child: CustomElevatedButtonWidget(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdvertPaymentScreen(),
                      ),
                    );
                  },
                  color: MyColors.containerBg,
                  buttonText: 'View payment',
                  prefix: null,
                  textColor: Colors.white,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _viewAd() {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
      margin: const EdgeInsets.only(left: 6),
      height: 190,
      width: context.width,
      child: Image.asset(
        AssetString.street,
        fit: BoxFit.cover,
        height: 150,
        width: context.width,
      ),
    );
  }

  Widget _advertizerData() {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Advertizer'),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 12,
                    child: Image.asset(AssetString.profile),
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Jamie oliver',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Icon(Icons.phone, color: Colors.white),
                  SizedBox(width: 6),
                  Text(
                    '+6198765432',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: MyColors.textColor,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                      decorationColor: MyColors.textColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CampaignDetailsGrid extends StatelessWidget {
  const CampaignDetailsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.8,
      children: const [
        HourDateInfoCard(title: 'Offer', value: 'bid rate'),
        HourDateInfoCard(title: 'hours/day', value: '5 hours'),
        HourDateInfoCard(title: 'Bid per Hour', value: '2345'),
        HourDateInfoCard(title: 'Paymemnt cycle ', value: 'weekly'),
        HourDateInfoCard(title: 'Upcoming due', value: '03 Apr 2025'),
        HourDateInfoCard(title: 'Schedule', value: '01 Apr - 01May '),
      ],
    );
  }
}
