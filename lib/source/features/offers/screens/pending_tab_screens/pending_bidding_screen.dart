import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/core/components/information_text.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:city17_seller/source/features/offers/components/pending_offer_components/bidding_card.dart';
import 'package:city17_seller/source/features/offers/components/weekly_calendar.dart';
import 'package:flutter/material.dart';

class PendingBiddingScreen extends StatelessWidget {
  const PendingBiddingScreen({super.key});

  // List of days
  final List<String> daysOfWeek = const [
    '01 - Monday',
    '02 - Tuesday',
    '03 - Wednesday',
    '04 - Thursday',
    '05 - Friday',
    '06 - Saturday',
    '07 - Sunday',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WeeklyCalendar(),
          const SizedBox(height: 10),
          InformationText(
            text:
                'Biddings allow multiple offers per hour — the highest bid wins.Earnings vary per hour based on accepted bids.',
            icon: Icons.warning_rounded,
            fontWeight: FontWeight.w400,
            fontSize: 10 ,
            iconColor: MyColors.primaryColor,
            textColor: MyColors.textColor,
          ),

          const SizedBox(height: 10),

          // slecting any day or date
          ...daysOfWeek.map((day) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  day,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                  ),
                ),
                const BiddingCard(),
                const SizedBox(height: 10),
              ],
            );
          }),
        ],
      ),
    );
  }
}
