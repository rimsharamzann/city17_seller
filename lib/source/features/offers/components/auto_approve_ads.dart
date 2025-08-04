import 'package:city17_seller/source/core/components/custom_container.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class AutoApproveAds extends StatefulWidget {
  const AutoApproveAds({super.key, required this.isBidding});
  final bool isBidding;

  @override
  State<AutoApproveAds> createState() => _AutoApproveAdsState();
}

class _AutoApproveAdsState extends State<AutoApproveAds> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'Automatically approve all adverts from this advertiser?',
              style: context.textTheme.bodySmall?.copyWith(
                fontSize: widget.isBidding ? 9 : 10,
                color: Colors.white,
                fontWeight: widget.isBidding
                    ? FontWeight.w100
                    : FontWeight.w200,
              ),
            ),
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
