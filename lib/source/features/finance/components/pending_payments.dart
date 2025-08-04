import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/core/components/information_text.dart';
import 'package:city17_seller/source/features/finance/components/payment_date.dart';
import 'package:city17_seller/source/features/offers/components/weekly_calendar.dart';
import 'package:flutter/material.dart';

class PendingPayments extends StatelessWidget {
  const PendingPayments({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InformationText(
              iconSize: 18,
              text:
                  'These payments are still pending. The buyer has not yet completed or Confirmed the payment.',
              icon: Icons.warning_rounded,
              fontSize: 10,
              iconColor: MyColors.primaryColor,
              textColor: MyColors.textColor,
            ),
            SizedBox(height: 14),
            Text('Due Payments'),
            SizedBox(height: 6),
            
            WeeklyCalendar(),

            // Row(
            //   spacing: 6,
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: List.generate(7, (index) => PaymentDates(index: index)),
            // ),
            SizedBox(height: 8),

            Column(children: List.generate(3, (index) => PaymentCards())),
          ],
        ),
      ),
    );
  }
}
