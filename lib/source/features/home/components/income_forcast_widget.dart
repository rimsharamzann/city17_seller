import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/constants/string_data.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class IncomeForecastWidget extends StatelessWidget {
  const IncomeForecastWidget({
    super.key,
    this.title,
    this.value,
    this.height,
    required this.child,
    this.child1,
  });
  final String? title;
  final String? value;
  final Widget child;
  final double? height;
  final Widget? child1;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      height: height ?? MediaQuery.of(context).size.height / 3,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: MyColors.containerBg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(child: child1 ?? SizedBox()), // Text(
              //   title ?? 'Income Forecast',
              //   style: Theme.of(context).textTheme.titleSmall?.copyWith(
              //     color: Colors.white,
              //     fontWeight: FontWeight.w300,
              //     fontSize: 14,
              //   ),
              // ),
              // const SizedBox(width: 6),
              // Container(
              //   padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(8),
              //     color: Colors.green.withValues(alpha: 0.2),
              //   ),
              //   child: Row(
              //     children: [
              //       Text(
              //         value ?? '7.01%',
              //         style: Theme.of(context).textTheme.headlineSmall
              //             ?.copyWith(
              //               color: MyColors.successColor,
              //               fontSize: 10,
              //             ),
              //       ),
              //       const SizedBox(width: 4),
              //       Icon(
              //         Icons.download,
              //         color: MyColors.successColor,
              //         size: 12,
              //       ),
              //     ],
              //   ),
              // ),
              const TabsData(),
            ],
          ),
          SizedBox(child: child),
        ],
      ),
    );
  }
}

class TabsData extends StatefulWidget {
  const TabsData({super.key});

  @override
  State<TabsData> createState() => _TabsDataState();
}

class _TabsDataState extends State<TabsData> with TickerProviderStateMixin {
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
    return
     Container(
      width: context.width / 2.1,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white10.withValues(alpha: 0.05),
      ),

      child: TabBar(
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white10,
        ),
        unselectedLabelColor: Colors.white70,
        controller: _controller,
        splashBorderRadius: BorderRadius.circular(8),
        indicatorColor: MyColors.primaryColor,
        dividerColor: MyColors.containerBg,
        indicatorAnimation: TabIndicatorAnimation.linear,
        // unselectedLabelColor: Colors.grey.shade400,
        labelColor: Colors.white,
        tabs: [
          Tab(text: 'Days'),
          Tab(text: 'Weeks'),
          Tab(text: 'Months'),
        ],
      ),
    );
  }
}

class IncomeForcastList extends StatelessWidget {
  const IncomeForcastList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          StringData.incomeForcast,
          style: context.textTheme.bodyLarge?.copyWith(
            color: Colors.white.withValues(alpha: 0.95),
          ),
        ),
        Spacer(),
        Text(
          'Textual',
          style: context.textTheme.bodySmall?.copyWith(
            fontSize: 14,
            color: Colors.white,
            height: 2,
            decorationColor: Colors.white,
            decoration: TextDecoration.underline,
          ),
        ),
        Icon(
          Icons.arrow_drop_down_rounded,
          color: Colors.white.withValues(alpha: 0.9),
          size: 30,
        ),
      ],
    );
  }
}
