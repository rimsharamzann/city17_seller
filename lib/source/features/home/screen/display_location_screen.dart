import 'package:city17_seller/config/route_names.dart';
import 'package:city17_seller/source/constants/asset_string.dart';
import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/constants/string_data.dart';
import 'package:city17_seller/source/core/components/buttons.dart';
import 'package:city17_seller/source/core/components/custom_layout.dart';
import 'package:city17_seller/source/core/components/custom_tile_widget.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:city17_seller/source/features/home/components/business_locations.dart';
import 'package:city17_seller/source/features/home/components/income_forcast_widget.dart';
import 'package:city17_seller/source/features/home/components/income_graph_widget.dart';
import 'package:flutter/material.dart';

class DisplayLocationScreen extends StatefulWidget {
  const DisplayLocationScreen({super.key});

  @override
  State<DisplayLocationScreen> createState() => _DisplayLocationScreenState();
}

class _DisplayLocationScreenState extends State<DisplayLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomLayoutScreen(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            IncomeForcastList(),
            IncomeGraphScreen(),
            _title(StringData.pendingActions),
            CustomTileWidget(
              image: AssetString.advertisement,
              title: StringData.pendingAdvert,
              child: _advertValue('13'),
            ),
            CustomTileWidget(
              image: AssetString.payment,
              title: StringData.duePayments,
              child: _advertValue('01'),
            ),
            CustomTileWidget(
              image: AssetString.orderApprove,
              title: StringData.paymentApproval,
              child: _advertValue('05'),
            ),
            _title(StringData.manageBusiness),
            BusinessLocations(),
            CustomElevatedButtonWidget(
              width: context.width,
              prefix: null,
              buttonText: 'Add a new location',
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.addLocation);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _advertValue(String value) {
    return Text(
      value,

      style: TextStyle(
        decorationColor: MyColors.primaryColor,
        color: MyColors.primaryColor,
        decoration: TextDecoration.underline,
        decorationThickness: 1.5,
        fontSize: 16,

        decorationStyle: TextDecorationStyle.solid,
      ),
    );
  }

  Widget _title(String title) {
    return Text(
      title,
      style: context.textTheme.bodyLarge?.copyWith(
        color: Colors.white.withValues(alpha: 0.95),
      ),
    );
  }
}
