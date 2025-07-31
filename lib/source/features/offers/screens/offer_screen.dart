import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/constants/string_data.dart';
import 'package:city17_seller/source/core/components/custom_layout.dart';
import 'package:city17_seller/source/core/components/custom_tab_widget.dart';
import 'package:city17_seller/source/features/offers/screens/active_tab_screens/active_offers.dart';
import 'package:city17_seller/source/features/offers/screens/completed_offers/completed_offers.dart';
import 'package:city17_seller/source/features/offers/screens/pending_tab_screens/pending_offers.dart';
import 'package:flutter/material.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({super.key});

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomLayoutScreen(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),

          CustomTabWidget(
            indicatorColor: MyColors.darkThemeBottomAppBarColor,
            controller: _controller,

            tabs: const [
              Tab(text: StringData.pending),
              Tab(text: StringData.active),
              Tab(text: StringData.completed),
            ],
          ),
          SizedBox(height: 10),
          Expanded(
            child: TabBarView(
              controller: _controller,

              children: [PendingOffers(), ActiveOffers(), CompletedOffers()],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
