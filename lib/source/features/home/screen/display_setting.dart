import 'package:city17_seller/config/route_names.dart';
import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/constants/string_data.dart';
import 'package:city17_seller/source/core/components/buttons.dart';
import 'package:city17_seller/source/core/components/custom_tab_widget.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:city17_seller/source/features/home/components/diaplay_options_tab.dart';
import 'package:city17_seller/source/features/home/components/update_display_setup.dart';
import 'package:flutter/material.dart';

class DisplaySettingScreen extends StatefulWidget {
  const DisplaySettingScreen({super.key});

  @override
  State<DisplaySettingScreen> createState() => _DisplaySettingScreenState();
}

class _DisplaySettingScreenState extends State<DisplaySettingScreen>
    with TickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    controller.addListener(() {
      if (mounted) setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(StringData.displaySetting)),
      body: Column(
        children: [
          SizedBox(
            width: context.width,
            height: 35,

            child: CustomTabWidget(
              controller: controller,
              indicatorColor: Colors.transparent,
              tabs: [
                Tab(text: StringData.displaySetup),
                Tab(text: StringData.options),
              ],
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: TabBarView(
              controller: controller,
              children: [DispaySetupTab(), DisplayOptionsTab()],
            ),
          ),
          _saveData(),
        ],
      ),
    );
  }

  Widget _saveData() {
    final isLastStep = controller.index == 1;

    return isLastStep
        ? SizedBox()
        : Container(
            color: MyColors.backgroundColor,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      StringData.deleteDisplay,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomElevatedButtonWidget(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.displaySetting);
                    },
                    buttonText: StringData.updateDisplay,
                    prefix: null,
                  ),
                ),
              ],
            ),
          );
  }
}
