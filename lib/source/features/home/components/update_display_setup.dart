import 'package:city17_seller/source/constants/string_data.dart';
import 'package:city17_seller/source/core/components/custom_container.dart';
import 'package:city17_seller/source/core/components/custom_tile_widget.dart';
import 'package:city17_seller/source/core/components/information_text.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:city17_seller/source/features/home/components/customize_screen_widget.dart';
import 'package:city17_seller/source/features/home/components/display_intallation_components.dart';
import 'package:city17_seller/source/features/home/components/disply_data_tab.dart';
import 'package:flutter/material.dart';

class DispaySetupTab extends StatefulWidget {
  const DispaySetupTab({super.key});

  @override
  State<DispaySetupTab> createState() => _DispaySetupTabState();
}

class _DispaySetupTabState extends State<DispaySetupTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          Text(
            'Hilton Hotel',
            style: context.textTheme.bodyMedium?.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text('Hilton 488 George St, Sydney NSW 2000'),
          const SizedBox(height: 8),

          DisplayTile(child1: OnlineOfflineStatus()),
          const SizedBox(height: 8),
          DisplayDataInfo(),
          const SizedBox(height: 12),
          _title('Display Installation Details'),
          DisplayInstallationComponents(),
          const SizedBox(height: 12),

          _title('Customize Screen'),

          const CustomizeScreenWidget(),
          const SizedBox(height: 12),
          _tileData('Name', 'Restaurant Family Hall', ''),
          _tileData('Size', '66 ', 'Inches'),
          _tileData(
            'Add Description',
            'LED facing the family hall in the restaurant at the side of VIP Lounge.',
            '',
          ),
          const SizedBox(height: 12),
          InformationText(
            icon: Icons.info_outline,
            text: 'Shared with potential buyers',
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _tileData(String title, String description, String type) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  description,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              Text(type),
            ],
          ),
        ],
      ),
    );
  }

  Widget _title(String title) {
    return Text(
      title,
      style: context.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }
}

class OnlineOfflineStatus extends StatefulWidget {
  const OnlineOfflineStatus({super.key});

  @override
  State<OnlineOfflineStatus> createState() => _OnlineOfflineStatusState();
}

class _OnlineOfflineStatusState extends State<OnlineOfflineStatus> {
  bool _isOnline = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          StringData.offline,
          style: TextStyle(
            color: _isOnline ? Colors.grey : Colors.white,
            fontWeight: FontWeight.w200,
          ),
        ),
        // const SizedBox(width: 4),
        SwitchWidget(
          value: _isOnline,
          onChanged: (value) {
            setState(() {
              _isOnline = value;
            });
          },
        ),
        // const SizedBox(width: 4),
        Text(
          StringData.online,
          style: TextStyle(
            color: _isOnline ? Colors.white : Colors.grey,
            fontWeight: FontWeight.w200,
          ),
        ),
      ],
    );
  }
}
