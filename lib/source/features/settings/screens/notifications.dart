import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/constants/string_data.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:city17_seller/source/features/settings/components/notification_details.dart';
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
            NotificationTabs(controller: _controller),
            SizedBox(height: 16),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: [
                  NotificationDetails(),
                  SizedBox(),
                  SizedBox(),
                  SizedBox(),
                  SizedBox(),
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

class NotificationTabs extends StatelessWidget {
  final TabController controller;
  const NotificationTabs({super.key, required this.controller});

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
        tabs: [
          Tab(text: StringData.all),
          Tab(text: StringData.advert),
          Tab(text: StringData.screens),
          Tab(text: StringData.earnings),
          Tab(text: StringData.payment),
        ],
      ),
    );
  }
}
