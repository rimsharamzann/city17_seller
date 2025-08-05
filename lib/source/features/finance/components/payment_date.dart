import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/constants/string_data.dart';
import 'package:city17_seller/source/core/components/custom_container.dart';
import 'package:city17_seller/source/core/components/custom_tile_widget.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class PaymentDates extends StatefulWidget {
  const PaymentDates({super.key, required this.index});
  final int index;

  @override
  State<PaymentDates> createState() => _PaymentDatesState();
}

class _PaymentDatesState extends State<PaymentDates> {
  @override
  Widget build(BuildContext context) {
    final bool isFirstContainer = widget.index == 0;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: isFirstContainer ? MyColors.lightGradient : null,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(width: 1, color: MyColors.textColor),
      ),
      child: Column(
        children: [
          Text(
            '19/04',
            style: context.textTheme.bodySmall?.copyWith(fontSize: 8),
          ),
          Text(
            'Mon',
            style: context.textTheme.bodySmall?.copyWith(fontSize: 10),
          ),
        ],
      ),
    );
  }
}

class PaymentCards extends StatefulWidget {
  const PaymentCards({super.key, this.child, this.childern, this.dataColor});
  final Widget? child;
  final List<Widget>? childern;
  final Color? dataColor;

  @override
  State<PaymentCards> createState() => _PaymentCardsState();
}

class _PaymentCardsState extends State<PaymentCards> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          UserNameAndContact(contactNo: '+61123449202', name: 'JimmieWilson'),
          SizedBox(height: 4),
          Column(
            children:
                widget.childern ??
                List.generate(
                  2,
                  (index) =>
                      CampaignData(dataColor: widget.dataColor ?? Colors.red),
                ),
          ),
          widget.child ?? TotalAmount(amount: '\$1050'),
        ],
      ),
    );
  }
}

class TotalAmount extends StatelessWidget {
  const TotalAmount({super.key, this.title, required this.amount});
  final String? title;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title ?? StringData.totalAmount,
            style: context.textTheme.bodySmall?.copyWith(
              fontSize: 10,
              color: MyColors.textColor,
            ),
          ),
          Spacer(),
          Text(
            amount,
            style: context.textTheme.bodyMedium?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class CampaignData extends StatefulWidget {
  const CampaignData({super.key, this.dataColor});
  final Color? dataColor;

  @override
  State<CampaignData> createState() => _CampaignDataState();
}

class _CampaignDataState extends State<CampaignData> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      color: MyColors.lightBackground,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _campaignTile('Due date', '19-04-05', widget.dataColor ?? Colors.red),
          _campaignTile('Payment', 'Weekly', null),
          _campaignTile('Campaign Name', 'Campaign Name', null),
          SizedBox(width: 6),
          _campaignTile('Amount', '\$525.00', null),
        ],
      ),
    );
  }

  Widget _campaignTile(String title, String data, Color? dataCOlor) {
    return Column(
      children: [
        Text(
          title,
          style: context.textTheme.bodySmall?.copyWith(
            fontSize: 7,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 4),
        Text(
          data,
          style: context.textTheme.bodyMedium?.copyWith(
            color: dataCOlor ?? Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
