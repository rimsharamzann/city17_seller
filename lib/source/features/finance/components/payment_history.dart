import 'package:city17_seller/source/constants/string_data.dart';
import 'package:city17_seller/source/core/components/custom_tab_widget.dart';
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
        CustomTabWidget(
          controller: _controller,
          tabs: [
            Tab(text: StringData.lastSevenDays),
            Tab(text: StringData.lastThirtyDays),
            Tab(text: StringData.lastThirtyDays),
          ],
          indicatorColor: Colors.transparent,
        ),
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
