import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/constants/string_data.dart';
import 'package:city17_seller/source/core/components/custom_tab_widget.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class IncomeForecastWidget extends StatefulWidget {
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
  State<IncomeForecastWidget> createState() => _IncomeForecastWidgetState();
}

class _IncomeForecastWidgetState extends State<IncomeForecastWidget>
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
    return Container(
      alignment: Alignment.topLeft,
      height: widget.height ?? MediaQuery.of(context).size.height / 3,
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
              SizedBox(child: widget.child1 ?? SizedBox()),

              SizedBox(
                width: context.width / 2.1,
                height: 35,

                child: CustomTabWidget(
                  controller: _controller,
                  tabs: [
                    Tab(text: StringData.days),
                    Tab(text: StringData.weeks),
                    Tab(text: StringData.months),
                  ],
                  indicatorColor: Colors.white10,
                ),
              ),
            ],
          ),
          SizedBox(child: widget.child),
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
