import 'dart:ui';

import 'package:city17_seller/source/constants/asset_string.dart';
import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/core/components/custom_container.dart';
import 'package:city17_seller/source/core/components/information_text.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:city17_seller/source/features/finance/components/approve_payment_modal.dart';
import 'package:flutter/material.dart';

class HistoryCards extends StatefulWidget {
  const HistoryCards({super.key});

  @override
  State<HistoryCards> createState() => _HistoryCardsState();
}

class _HistoryCardsState extends State<HistoryCards> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: ApprovePaymentModal(
              title: 'Payment Overview',
              paymentDate: 'Payment Date :',
              child2: Align(
                alignment: Alignment.center,
                child: InformationText(
                  text: 'Payment was successfull',
                  icon: Icons.warning_rounded,
                  iconColor: Colors.green.shade800,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Payment Details',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: MyColors.textColor,
                  ),
                ),
              ),
            ),
          ),
        );
      },
      child: CustomContainer(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 14,
                  backgroundImage: AssetImage(AssetString.profile),
                ),
                SizedBox(width: 6),
                Text(
                  'JimmieWilson',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _historyTile('Campaign Name', 'Campaign Name', null),
                SizedBox(width: 10),
                _historyTile('Payment Method', 'Bank Account', null),
                SizedBox(width: 10),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: MyColors.lightBackground,
                      ),
                      child: Text(
                        '16 hours',
                        style: context.textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                          fontSize: 9,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '\$150.00',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                '02 April 2025 01:15 PM',
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 10,
                  color: MyColors.textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _historyTile(String title, String data, Color? dataCOlor) {
    return Column(
      children: [
        Text(
          title,
          style: context.textTheme.bodySmall?.copyWith(
            fontSize: 9,
            color: MyColors.textColor,
          ),
        ),
        SizedBox(height: 8),
        Text(
          data,
          style: context.textTheme.bodyMedium?.copyWith(
            color: dataCOlor ?? Colors.white,
            fontSize: 11,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
