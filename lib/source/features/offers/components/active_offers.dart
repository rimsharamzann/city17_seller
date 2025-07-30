import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/constants/string_data.dart';
import 'package:city17_seller/source/core/components/custom_container.dart';
import 'package:city17_seller/source/core/components/custom_tab_widget.dart';
import 'package:city17_seller/source/core/components/custom_text_feild.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class ActiveOffers extends StatefulWidget {
  const ActiveOffers({super.key});

  @override
  State<ActiveOffers> createState() => _ActiveOffersState();
}

class _ActiveOffersState extends State<ActiveOffers>
    with TickerProviderStateMixin {
  late TabController _controller;
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomContainer(
          child: Column(
            children: [
              CustomContainer(
                padding: EdgeInsets.all(0),
                child: Column(
                  children: [
                    CustomTextFeild(
                      controller: controller,
                      hintText: StringData.searchBusinessCategory,
                      suffixIcon: Icons.search,
                      iconColor: Colors.white,
                    ),
                    SizedBox(height: 6),
                    CustomContainer(
                      color: MyColors.lightBackground,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hilton Hotel',
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 6),

                          Text(
                            'Hilton 488 George St, Sydney NSW 2000',
                            style: context.textTheme.bodySmall?.copyWith(
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),

        CustomTabWidget(
          controller: _controller,
          tabs: const [
            Tab(text: StringData.bidding),
            Tab(text: StringData.fixed),
          ],
        ),
        SizedBox(height: 10),
        Expanded(
          child: TabBarView(
            controller: _controller,
            children: [BidingTabData(), FixedTab()],
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

class BidingTabData extends StatelessWidget {
  const BidingTabData({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(child: Column(children: []));
  }
}

class FixedTab extends StatelessWidget {
  const FixedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          CustomContainer(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Advertizer'),
                Text(
                  'jamesWilson',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
