import 'package:city17_seller/source/constants/string_data.dart';
import 'package:city17_seller/source/core/components/custom_tab_widget.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:city17_seller/source/features/settings/components/all_notifications.dart';
import 'package:city17_seller/source/features/settings/components/notification_tabs_data.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen>
    with TickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(StringData.notifications)),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            CustomTabWidget(
              labelStyle: context.textTheme.bodySmall,
              controller: _controller,
              indicatorColor: Colors.transparent,
              tabs: [
                Tab(text: StringData.all),
                Tab(text: StringData.advert),
                Tab(text: StringData.screens),
                Tab(text: StringData.earnings),
                Tab(text: StringData.payment),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: [
                  AllNotifications(),
                  AdvertTab(),
                  ScreenTab(),
                  EarningTab(),
                  PaymentTab(),
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
