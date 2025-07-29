import 'dart:ui';

import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/core/components/buttons.dart';
import 'package:city17_seller/source/core/components/information_text.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:city17_seller/source/features/finance/components/approve_payment_modal.dart';
import 'package:city17_seller/source/features/finance/components/payment_date.dart';
import 'package:flutter/material.dart';

class PaymentApproval extends StatefulWidget {
  const PaymentApproval({super.key});

  @override
  State<PaymentApproval> createState() => _PaymentApprovalState();
}

class _PaymentApprovalState extends State<PaymentApproval> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        InformationText(
          iconSize: 24,
          text:
              'These payments are still pending. The buyer has not yet completed or Confirmed the payment.',
          icon: Icons.warning_rounded,
          iconColor: MyColors.primaryColor,
          textColor: MyColors.textColor,
        ),
        SizedBox(height: 14),

        Row(
          spacing: 6,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(7, (index) => PaymentDates(index: index)),
        ),
        SizedBox(height: 10),

        Column(
          children: List.generate(
            3,
            (index) => PaymentCards(
              dataColor: Colors.white,
              childern: List.generate(3, (index) => CampaignData()),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Total Amount',
                          style: context.textTheme.bodySmall?.copyWith(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          '\$1575',
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    CustomElevatedButtonWidget(
                      width: context.width / 2,
                      textColor: Colors.white70,
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                            child: const ApprovePaymentModal(),
                          ),
                        );
                      },

                      buttonText: 'Approve all PAyments',
                      color: MyColors.primaryColor,
                      prefix: null,
                      prefixIcon: null,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
