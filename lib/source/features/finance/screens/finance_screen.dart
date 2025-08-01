import 'package:city17_seller/source/constants/string_data.dart';
import 'package:city17_seller/source/core/components/custom_layout.dart';
import 'package:city17_seller/source/core/components/custom_tab_widget.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:city17_seller/source/features/finance/components/payment_approval.dart';
import 'package:city17_seller/source/features/finance/components/payment_history.dart';
import 'package:city17_seller/source/features/finance/components/pending_payments.dart';
import 'package:flutter/material.dart';

class FinanceScreen extends StatefulWidget {
  const FinanceScreen({super.key});

  @override
  State<FinanceScreen> createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen>
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
          CustomTabWidget(
            labelStyle: context.textTheme.bodyMedium?.copyWith(fontSize: 10),
            controller: _controller,
            tabs: const [
              Tab(text: StringData.pendingPayments),
              Tab(text: StringData.paymentApproval),
              Tab(text: StringData.paymentHistory),
            ],
          ),
          SizedBox(height: 10),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: [
                PendingPayments(),
                PaymentApproval(),
                PaymentHistory(),
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
