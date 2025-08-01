import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/constants/string_data.dart';
import 'package:city17_seller/source/core/components/custom_container.dart';
import 'package:city17_seller/source/core/components/custom_tab_widget.dart';
import 'package:city17_seller/source/core/components/custom_text_feild.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:city17_seller/source/features/offers/screens/pending_tab_screens/pending_fixed_screen.dart';
import 'package:city17_seller/source/features/offers/screens/pending_tab_screens/pending_bidding_screen.dart';
import 'package:flutter/material.dart';

class PendingOffers extends StatefulWidget {
  const PendingOffers({super.key});

  @override
  State<PendingOffers> createState() => _PendingOffersState();
}

class _PendingOffersState extends State<PendingOffers> {
  final TextEditingController controller = TextEditingController();

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

        Expanded(child: PendingFixedTab()),
      ],
    );
  }
}

class PendingFixedTab extends StatefulWidget {
  const PendingFixedTab({super.key});

  @override
  State<PendingFixedTab> createState() => _PendingFixedTabState();
}

class _PendingFixedTabState extends State<PendingFixedTab>
    with TickerProviderStateMixin {
  late TabController _controller;

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
        CustomTabWidget(
          controller: _controller,
          tabs: const [
            Tab(text: 'Bidding'),
            Tab(text: 'Fixed'),
          ],
        ),
        const SizedBox(height: 8),
        Expanded(
          child: TabBarView(
            controller: _controller,
            children: const [PendingBiddingScreen(), PendingFixedScreen()],
          ),
        ),
      ],
    );
  }
}
