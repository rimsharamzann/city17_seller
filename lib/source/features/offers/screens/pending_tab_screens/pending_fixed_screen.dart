import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/core/components/information_text.dart';
import 'package:city17_seller/source/features/offers/components/pending_offer_components/fixed_card.dart';
import 'package:city17_seller/source/features/offers/components/weekly_calendar.dart';
import 'package:flutter/material.dart';

class PendingFixedScreen extends StatelessWidget {
  const PendingFixedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WeeklyCalendar(),
          SizedBox(height: 10),
          InformationText(
            text:
                'By accepting these fixed offers, the selected hours for these campaign will be reserved and will no longer be available to other buyers during that period.',
            icon: Icons.warning_rounded,
            iconColor: MyColors.primaryColor,
            textColor: MyColors.textColor,
          ),
          SizedBox(height: 10),
          ...List.generate(2, (index) => FixedCard()),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
