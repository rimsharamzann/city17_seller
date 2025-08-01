import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/constants/string_data.dart';
import 'package:city17_seller/source/core/components/custom_layout.dart';
import 'package:city17_seller/source/core/components/custom_tab_widget.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:city17_seller/source/features/settings/components/advertizer_tab.dart';
import 'package:city17_seller/source/features/settings/components/payment_methods.dart';
import 'package:city17_seller/source/features/settings/components/profile_options.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
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
            labelStyle: context.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            controller: _controller,
            tabs: const [
              Tab(text: StringData.pendingPayments),
              Tab(text: StringData.paymentApproval),
              Tab(text: StringData.paymentHistory),
            ],
            indicatorColor: MyColors.darkThemeBottomAppBarColor,
          ),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: [ProfileOptions(), PaymentMethods(), AdvertizerTab()],
            ),
          ),
        ],
      ),
    );
  }
}
