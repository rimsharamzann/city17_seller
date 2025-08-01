import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/constants/string_data.dart';
import 'package:city17_seller/source/core/components/custom_container.dart';
import 'package:city17_seller/source/core/components/information_text.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:city17_seller/source/features/settings/components/buyer_detail_components.dart';
import 'package:city17_seller/source/features/settings/components/buyer_payment_history.dart';
import 'package:flutter/material.dart';

class BuyerDetailScreen extends StatefulWidget {
  const BuyerDetailScreen({super.key});

  @override
  State<BuyerDetailScreen> createState() => _BuyerDetailScreenState();
}

class _BuyerDetailScreenState extends State<BuyerDetailScreen> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringData.buyerDetails,
          style: context.textTheme.bodyLarge?.copyWith(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuyerContactInfo(),
              SizedBox(height: 10),
              _joinDate(),
              SizedBox(height: 10),

              InformationText(
                text:
                    'System Will Automatically approve the Ads from this Buyer.',
                icon: Icons.info_outline,
                fontSize: 8,
                iconColor: MyColors.textColor,
                textColor: MyColors.textColor,
              ),
              SizedBox(height: 10),
              ContactTile(
                icon: Icons.add,
                text: '300',
                title: 'Total Ads',
                child: SizedBox(),
              ),
              SizedBox(height: 10),
              ContactTile(
                icon: Icons.attach_money,
                text: '13.00',
                title: 'Average per hour',
              ),

              SizedBox(height: 10),
              ContactTile(
                icon: Icons.watch_later,
                text: '245 hours',
                title: 'Average per Month',
              ),
              SizedBox(height: 10),
              Text(
                'Recent Payments',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
              // TODO : yahan p tabs any hny ...

              // SizedBox(
              //   height: context.height / 2,
              //   child: BuyerPaymentHistory(),
              // ),
              SizedBox(height: 10),
              BuyerHistoryDetails(title: 'Pending', color: Colors.redAccent),
              SizedBox(height: 10),
              BuyerHistoryDetails(title: 'Paid', color: Colors.green.shade700),
            ],
          ),
        ),
      ),
    );
  }

  Widget _joinDate() {
    return CustomContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trusted Buyer',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                  fontSize: 11,
                ),
              ),
              Text(
                'Since 19-01-2025',
                style: context.textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                  fontSize: 8,
                ),
              ),
            ],
          ),
          SwitchWidget(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = true;
              });
            },
          ),
        ],
      ),
    );
  }
}
