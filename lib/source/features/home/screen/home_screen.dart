import 'package:city17_seller/source/constants/asset_string.dart';
import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/constants/string_data.dart';
import 'package:city17_seller/source/core/components/custom_layout.dart';
import 'package:city17_seller/source/core/components/custom_tile_widget.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:city17_seller/source/features/home/components/add_display_widget.dart';
import 'package:city17_seller/source/features/home/components/income_forcast_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomLayoutScreen(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            IncomeForcastList(),
            IncomeForecastWidget(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '-----',
                            style: context.textTheme.bodyLarge?.copyWith(
                              color: MyColors.lightGradient,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: MyColors.lightGradient.withValues(
                                alpha: 0.2,
                              ),
                            ),

                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 60,
                                  child: Divider(
                                    // height: 10,
                                    thickness: 1.5,
                                    radius: BorderRadius.circular(8),
                                    color: MyColors.lightGradient.withValues(
                                      alpha: 0.5,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.upload,
                                  color: MyColors.lightGradient,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(StringData.aud, textAlign: TextAlign.start),
                    ),
                  ],
                ),
              ),
            ),
            _title(StringData.pendingActions),
            CustomTileWidget(
              image: AssetString.advertisement,
              title: StringData.pendingAdvert,
            ),
            CustomTileWidget(
              image: AssetString.payment,
              title: StringData.duePayments,
            ),
            CustomTileWidget(
              image: AssetString.payment,
              title: StringData.paymentApproval,
            ),
            _title(StringData.manageBusiness),
            AddDisplayWidget(),
          ],
        ),
      ),
    );
  }

  Widget _title(String title) {
    return Text(
      title,
      style: context.textTheme.bodyLarge?.copyWith(
        color: Colors.white.withValues(alpha: 0.95),
        fontSize: 15, 
      ),
    );
  }
}
