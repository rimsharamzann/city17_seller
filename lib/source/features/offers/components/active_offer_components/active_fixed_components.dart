import 'package:city17_seller/source/constants/asset_string.dart';
import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/core/components/buttons.dart';
import 'package:city17_seller/source/core/components/custom_container.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:city17_seller/source/features/offers/components/active_offer_components/fixed_time_slots.dart';
import 'package:city17_seller/source/features/offers/components/pending_offer_components/fixed_card.dart';
import 'package:city17_seller/source/features/offers/screens/advert_detail.dart';
import 'package:flutter/material.dart';

class ActiveFixedComponents extends StatefulWidget {
  const ActiveFixedComponents({super.key});

  @override
  State<ActiveFixedComponents> createState() => _ActiveFixedComponentsState();
}

class _ActiveFixedComponentsState extends State<ActiveFixedComponents> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          AdvertizerName(),
          SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                HourDateInfoCard(title: 'Hours per day', value: '04'),
                SizedBox(width: 6),
                HourDateInfoCard(title: 'Start', value: '01-04-25'),
                SizedBox(width: 6),
                HourDateInfoCard(title: 'End', value: '01-06-25'),
              ],
            ),
          ),
          SizedBox(height: 6),
          PaymentPerDay(),
          SizedBox(height: 10),
          SizedBox(
            height: 230,
            child: Row(
              children: [
                FixedTimeSlots(),
                Expanded(flex: 2, child: _viewAd()),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: CustomElevatedButtonWidget(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdvertDetailScreen()),
                );
              },
              color: MyColors.darkThemeBG,
              buttonText: 'View Campaign',
              prefix: null,
              textColor: Colors.white,
            ),
          ),
        ],
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
}

class PaymentPerDay extends StatelessWidget {
  const PaymentPerDay({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      margin: EdgeInsets.symmetric(horizontal: 10),
      color: MyColors.darkThemeBG,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Payment per day', style: context.textTheme.bodyMedium),
          Text(
            '\$150',
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
