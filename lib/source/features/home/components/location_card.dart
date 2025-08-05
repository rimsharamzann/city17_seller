import 'package:city17_seller/config/route_names.dart';
import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/constants/string_data.dart';
import 'package:city17_seller/source/core/components/custom_tile_widget.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:city17_seller/source/features/home/components/display_tabs.dart';
import 'package:city17_seller/source/features/home/models/display_loaction_model.dart';
import 'package:flutter/material.dart';

class LocationCard extends StatefulWidget {
  final DisplayLocationModel locationModel;

  const LocationCard({super.key, required this.locationModel});

  @override
  State<LocationCard> createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard>
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

  bool _isDisplayConnected = false;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      alignment: Alignment.topLeft,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: MyColors.darkThemeBottomAppBarColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.locationModel.name,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    _isDisplayConnected
                        ? Icon(Icons.settings, color: Colors.white, size: 20)
                        : SizedBox(),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.locationModel.address,
                      style: _isDisplayConnected
                          ? context.textTheme.bodySmall?.copyWith(
                              color: Colors.white70,
                              fontSize: 10,
                            )
                          : context.textTheme.bodySmall,
                    ),
                    _isDisplayConnected
                        ? SizedBox()
                        : Icon(Icons.settings, color: Colors.white, size: 20),
                  ],
                ),
                SizedBox(height: _isDisplayConnected ? 0 : 8),
                if (!_isDisplayConnected)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.locationModel.category,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: Colors.white.withValues(alpha: 0.9),
                        ),
                      ),

                      if (!_isExpanded) _expandedData(),
                    ],
                  )
                else
                  Wrap(
                    children: [
                      Text(
                        widget.locationModel.category,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: Colors.white.withValues(alpha: 0.9),
                        ),
                      ),

                      SizedBox(width: 30, height: 10),
                      if (!_isExpanded) _expandedData(),
                    ],
                  ),

                SizedBox(height: _isDisplayConnected ? 0 : 8),

                if (!_isDisplayConnected && !_isExpanded)
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isDisplayConnected = true;
                        });
                      },
                      child: Text(
                        'Connect a display',
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: MyColors.primaryColor,
                          decoration: TextDecoration.underline,
                          decorationColor: MyColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          if (_isExpanded) ...[
            DisplayTabs(
              locationModel: widget.locationModel,
              controller: _controller,
            ),
            SizedBox(height: 10),
            SizedBox(
              height: context.height / 1.05,
              child: TabBarView(
                clipBehavior: Clip.hardEdge,
                controller: _controller,
                children: [
                  DisplayStatus(),
                  OfflineDisplays(),
                  OnlineDisplays(),
                  DraftDisplays(),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.connectDisplay);
                  },
                  child: Text(
                    'Connect a display',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: MyColors.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],

          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Container(
              alignment: Alignment.center,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: const Color(0xFF3a3c48),
              ),
              child: Icon(
                _isExpanded
                    ? Icons.keyboard_arrow_up_sharp
                    : Icons.keyboard_arrow_down_sharp,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _expandedData() {
    return Row(
      children: [
        if (_isDisplayConnected) ...[
          SizedBox(width: 5),
          _displayValue(
            '${widget.locationModel.totalDisplays} Displays',
            MyColors.textColor2,
          ),

          SizedBox(width: 5),
          _displayValue(
            '${widget.locationModel.onlineDisplays} Online',
            MyColors.successColor,
          ),
          SizedBox(width: 5),
          _displayValue(
            '${widget.locationModel.offlineDisplays} Offline',
            Colors.redAccent,
          ),
          SizedBox(width: 5),
          _displayValue(
            '${widget.locationModel.draftDisplays} Draft',
            Colors.grey,
          ),
        ] else ...[
          SizedBox(width: 6),
          _displayValue(
            '${widget.locationModel.totalDisplays} Displays',
            MyColors.textColor2,
          ),
          SizedBox(width: 6),
          _displayValue(
            '${widget.locationModel.onlineDisplays} Online',
            MyColors.successColor,
          ),
          SizedBox(width: 6),
          _displayValue(
            '${widget.locationModel.offlineDisplays} Offline',
            Colors.redAccent,
          ),
        ],
      ],
    );
  }

  Widget _displayValue(String value, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.circle, color: color, size: 6),
        SizedBox(width: 6),
        Text(
          value,
          style: context.textTheme.bodySmall?.copyWith(
            color: color,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}

class DisplayStatus extends StatelessWidget {
  const DisplayStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OfflineDisplays(),
        SizedBox(height: 4),
        OnlineDisplays(),
        SizedBox(height: 4),
        DraftDisplays(),
      ],
    );
  }
}

class DraftDisplays extends StatelessWidget {
  const DraftDisplays({super.key});

  @override
  Widget build(BuildContext context) {
    return DisplayStatusContainer(
      borderColor: Colors.grey,
      status: StringData.draft,
      child: DisplayTile(
        child: Align(
          alignment: Alignment.bottomRight,
          child: Text(
            'Complete Setup',
            style: TextStyle(color: MyColors.primaryColor),
          ),
        ),
      ),
    );
  }
}

class OnlineDisplays extends StatelessWidget {
  const OnlineDisplays({super.key});

  @override
  Widget build(BuildContext context) {
    return DisplayStatusContainer(
      borderColor: MyColors.successColor2,
      status: StringData.online,
      child: Column(children: List.generate(3, (index) => DisplayTile())),
    );
  }
}

class OfflineDisplays extends StatelessWidget {
  const OfflineDisplays({super.key});

  @override
  Widget build(BuildContext context) {
    return DisplayStatusContainer(
      borderColor: Colors.redAccent,
      status: StringData.offline,
      child: Column(
        children: [
          ...List.generate(3, (index) => DisplayTile()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Warning!',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: MyColors.primaryColor,
                    ),
                  ),
                  TextSpan(text: ' '),
                  TextSpan(
                    style: context.textTheme.bodySmall?.copyWith(
                      color: Colors.white,
                    ),
                    text:
                        'These displays are currently offline and not generating revenue.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
