import 'package:city17_seller/source/features/offers/components/active_offer_components/active_bid_card.dart';
import 'package:city17_seller/source/features/offers/components/weekly_calendar.dart';
import 'package:flutter/material.dart';

class ActiveBidTab extends StatelessWidget {
  const ActiveBidTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WeeklyCalendar(),
          const SizedBox(height: 10),

          ActiveBidCard(),
        ],
      ),
    );
  }
}
