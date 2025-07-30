import 'package:city17_seller/config/route_names.dart';
import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/core/components/buttons.dart';
import 'package:city17_seller/source/core/components/custom_container.dart';
import 'package:city17_seller/source/core/components/custom_tile_widget.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class AdvertizerTab extends StatelessWidget {
  const AdvertizerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text('Trusted buyers'),
          ...List.generate(4, (index) => AdvertizerDataCards()),
        ],
      ),
    );
  }
}

class AdvertizerDataCards extends StatefulWidget {
  const AdvertizerDataCards({super.key});

  @override
  State<AdvertizerDataCards> createState() => _AdvertizerDataCardsState();
}

class _AdvertizerDataCardsState extends State<AdvertizerDataCards> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserNameAndContact(
            name: 'JimmieWilson',
            widget: Column(
              children: [
                Text(
                  'Business till date ',
                  style: context.textTheme.bodySmall?.copyWith(fontSize: 10),
                ),
                Text(
                  '\$10000',
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            contactNo: '',
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // joined date
              _advertTile('Trusted since', '19-05-23'),
              SizedBox(width: 5),
              //per month average
              _advertTile('Average per Month', '256 hrs'), SizedBox(width: 5),

              //per houur average
              _advertTile('Average per hour', '\$12.00'),
              //per month average
              _advertTile('Total Ads', '200'),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Remove',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: Colors.red,
                  ),
                ),
              ),
              CustomElevatedButtonWidget(
                height: 35,
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.buyerDetails);
                },
                prefix: null,
                buttonText: 'View buyer',
                textColor: Colors.white,
                color: MyColors.primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _advertTile(String title, String data) {
    return Column(
      children: [
        Text(title, style: context.textTheme.bodySmall?.copyWith(fontSize: 10)),
        SizedBox(height: 8),
        Text(
          data,
          style: context.textTheme.bodyMedium?.copyWith(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w200,
          ),
        ),
      ],
    );
  }
}
