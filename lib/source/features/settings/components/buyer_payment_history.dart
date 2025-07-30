import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/core/components/custom_container.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:city17_seller/source/features/finance/components/payment_history.dart';
import 'package:flutter/material.dart';

class BuyerPaymentHistory extends StatefulWidget {
  const BuyerPaymentHistory({super.key});

  @override
  State<BuyerPaymentHistory> createState() => _BuyerPaymentHistoryState();
}

class _BuyerPaymentHistoryState extends State<BuyerPaymentHistory>
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
        PaymentTabs(controller: _controller),
        SizedBox(height: 10),
        TabBarView(
          controller: _controller,
          children: [
            Expanded(
              child: ListView(
                children: [
                  BuyerHistoryDetails(title: 'Pending', color: Colors.red),
                  SizedBox(height: 10),
                  BuyerHistoryDetails(
                    title: 'Paid',
                    color: Colors.green.shade800,
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            SizedBox(),
            SizedBox(),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

class BuyerHistoryDetails extends StatefulWidget {
  const BuyerHistoryDetails({
    super.key,
    required this.title,
    required this.color,
  });
  final String title;
  final Color color;

  @override
  State<BuyerHistoryDetails> createState() => _BuyerHistoryDetailsState();
}

class _BuyerHistoryDetailsState extends State<BuyerHistoryDetails> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: context.textTheme.bodySmall?.copyWith(color: widget.color),
          ),
          CustomContainer(
            color: MyColors.lightBackground,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _historyTile('Campaign Name', 'Campaign Name'),
                _historyTile('Due date', '19-Apr'),
                _historyTile('Payment cycle', 'Weekly'),
                _historyTile('Amount', '\$300'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Amount',
                  style: context.textTheme.bodySmall?.copyWith(fontSize: 12),
                ),
                Spacer(),
                Text(
                  '\$1050',
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

  Widget _historyTile(String title, String data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
