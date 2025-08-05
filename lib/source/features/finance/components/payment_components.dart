import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/core/components/buttons.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class TotalAmountWidget extends StatelessWidget {
  const TotalAmountWidget({
    super.key,
    this.title,
    required this.buttonText,
    required this.amount,
    this.onTap,
    this.backgroundColor,
    this.textColor,
  });
  final String? title;
  final String buttonText;
  final String amount;
  final Function()? onTap;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              title ?? 'Total Amount',
              style: context.textTheme.bodySmall?.copyWith(
                fontSize: 9,
                color: MyColors.textColor,
              ),
            ),
            Text(
              amount,
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
        Spacer(),
        CustomElevatedButtonWidget(
          height: 35,
          width: context.width / 2.1,
          textColor: textColor ?? Colors.white70,
          onPressed: onTap,
          fontSize: 10,
          fontWeight: FontWeight.bold,

          buttonText: buttonText,
          color: backgroundColor ?? MyColors.primaryColor,
          prefix: null,
          prefixIcon: null,
        ),
      ],
    );
  }
}
