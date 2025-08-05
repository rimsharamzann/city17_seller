import 'dart:io';

import 'package:city17_seller/config/route_names.dart';
import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/core/components/buttons.dart';
import 'package:city17_seller/source/core/components/custom_container.dart';
import 'package:city17_seller/source/core/components/custom_tab_widget.dart';
import 'package:city17_seller/source/core/components/custom_text_feild.dart';
import 'package:city17_seller/source/core/components/information_text.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:city17_seller/source/features/home/components/customize_screen_widget.dart';
import 'package:city17_seller/source/features/home/components/display_intallation_components.dart';
import 'package:city17_seller/source/features/home/components/disply_data_tab.dart';
import 'package:city17_seller/source/features/home/models/display_model.dart';
import 'package:flutter/material.dart';

class ConnectDisplayScreen extends StatefulWidget {
  const ConnectDisplayScreen({super.key});

  @override
  State<ConnectDisplayScreen> createState() => _ConnectDisplayScreenState();
}

class _ConnectDisplayScreenState extends State<ConnectDisplayScreen>
    with TickerProviderStateMixin {
  late TabController _controller;

  late TextEditingController _nameController;
  late TextEditingController _sizeController;
  late TextEditingController _descriptionController;

  String brand = 'TCL';
  String model = 'Android TV';
  String resolution = '1920x1080';

  // Step  data
  String imageUrl = '';
  DisplayQR? displayQR;

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    _nameController = TextEditingController();
    _sizeController = TextEditingController();
    _descriptionController = TextEditingController();
    _controller.addListener(() {
      if (mounted) setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _nameController.dispose();
    _sizeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Connect a Display',
          style: context.textTheme.bodyLarge?.copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: context.width,
            height: 35,
            child: CustomTabWidget(
              controller: _controller,
              tabs: [
                Tab(text: 'Step 1'),
                Tab(text: 'Step 2'),
                Tab(text: 'Step 3'),
              ],
              indicatorColor: Colors.transparent,
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: TabBarView(
              controller: _controller,
              children: [
                Step1Data(
                  nameController: _nameController,
                  sizeController: _sizeController,
                  descriptionController: _descriptionController,
                ),
                DisplayDataTab(),
                ScanQR(
                  onImagePicked: (path) {
                    setState(() {
                      imageUrl = path;
                    });
                  },
                  onQRScanned: (qr) {
                    setState(() {
                      displayQR = qr as DisplayQR?;
                    });
                  },
                ),
              ],
            ),
          ),
          _saveData(),
        ],
      ),
    );
  }

  Widget _saveData() {
    final isLastStep = _controller.index == 2;

    return Container(
      color: MyColors.backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Text(
                'Save As Draft',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: CustomElevatedButtonWidget(
              onPressed: () {
                if (!isLastStep) {
                  _controller.animateTo(_controller.index + 1);
                } else {
                  if (imageUrl.isNotEmpty) {
                    Image.file(File(imageUrl), width: 150, height: 150);
                  }

                  Navigator.pushNamed(context, RouteNames.displaySetting);
                }
              },
              buttonText: isLastStep ? 'Complete Display Setup' : 'Next',
              prefix: null,
            ),
          ),
        ],
      ),
    );
  }
}

class Step1Data extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController sizeController;
  final TextEditingController descriptionController;

  const Step1Data({
    super.key,
    required this.nameController,
    required this.sizeController,
    required this.descriptionController,
  });

  @override
  State<Step1Data> createState() => _Step1DataState();
}

class _Step1DataState extends State<Step1Data> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          _title('Display Installation Details'),
          const SizedBox(height: 6),
          const DisplayInstallationComponents(),
          const SizedBox(height: 12),
          _title('Customize Screen'),
          const CustomizeScreenWidget(),
          const SizedBox(height: 12),
          _tileData('Name', 'Enter Name ', '', widget.nameController),
          _tileData('Size', 'In Inches', 'Inches', widget.sizeController),
          _tileData(
            'Add Description',
            'Description',
            '',
            widget.descriptionController,
          ),
          const SizedBox(height: 12),
          InformationText(
            fontWeight: FontWeight.bold,
            icon: Icons.info_outline,
            text: 'Shared with potential buyers',
            textColor: Colors.white,
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _tileData(
    String title,
    String description,
    String type,
    TextEditingController controller,
  ) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: context.textTheme.bodySmall),
          SizedBox(height: 6),

          CustomTextFeild(controller: controller, hintText: description),
        ],
      ),
    );
  }

  Widget _title(String title) {
    return Text(
      title,
      style: context.textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w600,
        color: Colors.white,
        fontSize: 15,
      ),
    );
  }
}
