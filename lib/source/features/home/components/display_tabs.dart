import 'package:city17_seller/source/core/components/custom_tab_widget.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:city17_seller/source/features/home/models/display_loaction_model.dart';
import 'package:flutter/material.dart';

class DisplayTabs extends StatefulWidget {
  const DisplayTabs({super.key, required this.locationModel});
  final DisplayLocationModel locationModel;

  @override
  State<DisplayTabs> createState() => _DisplayTabsState();
}

class _DisplayTabsState extends State<DisplayTabs>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: CustomTabWidget(
        unselectedLabelColor: Colors.grey,
        controller: _controller,
        indicatorAnimation: TabIndicatorAnimation.linear,
        labelColor: Colors.white,

        indicatorDecoration: UnderlineTabIndicator(
          borderSide: BorderSide(width: 1.5, color: Colors.white),
        ),
        tabs: [
          Tab(text: '${widget.locationModel.totalDisplays} All Displays'),
          Tab(text: '${widget.locationModel.onlineDisplays} Online'),
          Tab(text: '${widget.locationModel.offlineDisplays} offline'),
          Tab(text: '${widget.locationModel.draftDisplays} Draft'),
        ],
      ),
    );
  }
}

class DisplayStatusContainer extends StatelessWidget {
  const DisplayStatusContainer({
    super.key,
    required this.borderColor,
    required this.status,
    required this.child,
    this.textColor,
  });
  final Color borderColor;
  final String status;
  final Color? textColor;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),

      padding: EdgeInsets.all(10),
      width: context.width,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 0.5),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.circle, color: borderColor, size: 22),
              SizedBox(width: 10),
              Text(
                status,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: textColor ?? Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(child: child),
        ],
      ),
    );
  }
}
