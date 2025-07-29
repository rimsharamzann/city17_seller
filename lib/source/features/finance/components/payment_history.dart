import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/constants/string_data.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:city17_seller/source/features/finance/components/payment_history_components.dart';
import 'package:flutter/material.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({super.key});

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory>
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
    return Column(
      children: [
        TabsData(controller: _controller),
        SizedBox(height: 10),
        Expanded(
          child: TabBarView(
            controller: _controller,
            children: [
              ListView(children: List.generate(5, (index) => HistoryCards())),
              SizedBox(),
              SizedBox(),
            ],
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

class TabsData extends StatelessWidget {
  final TabController controller;
  const TabsData({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.transparent,
      ),
      child: TabBar(
        controller: controller,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.transparent,
        ),
        unselectedLabelColor: Colors.white70,
        splashBorderRadius: BorderRadius.circular(8),
        indicatorColor: MyColors.primaryColor,
        dividerColor: MyColors.containerBg,
        indicatorAnimation: TabIndicatorAnimation.linear,
        labelColor: Colors.white,
        tabs: const [
          Tab(text: StringData.lastSevenDays),
          Tab(text: StringData.lastThirtyDays),
          Tab(text: StringData.lastThirtyDays),
        ],
      ),
    );
  }
}
