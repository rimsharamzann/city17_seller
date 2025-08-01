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
import 'package:city17_seller/source/features/home/components/scan_qr_code.dart';
import 'package:flutter/material.dart';

class ConnectDisplayScreen extends StatefulWidget {
  const ConnectDisplayScreen({super.key});

  @override
  State<ConnectDisplayScreen> createState() => _ConnectDisplayScreenState();
}

class _ConnectDisplayScreenState extends State<ConnectDisplayScreen>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    _controller.addListener(() {
      if (mounted) setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
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
              children: [Step1Data(), DisplayDataTab(), ScanQrCode()],
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

  //  Future<void> saveAsDraft(Map<String, dynamic> displayData) async {
  //   try {
  //     await FirebaseFirestore.instance.collection('display_drafts').add(displayData);

  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Display saved as draft')),
  //     );
  //   } catch (e) {
  //     debugPrint('Error saving draft: $e');
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Failed to save draft')),
  //     );
  //   }
  // }

  // Future<void> saveCurrentStepData(Map<String, dynamic> stepData) async {
  //   // Example: Save step data locally or in-memory (you could use Provider, Riverpod, or a class)
  //   try {
  //     // Cache it, or add to state model
  //     debugPrint('Step saved: $stepData');

  //     // Optionally go to next tab
  //     controller.animateTo(controller.index + 1);
  //   } catch (e) {
  //     debugPrint('Error saving step data: $e');
  //   }
  // }
  //  CustomElevatedButtonWidget(
  //   onPressed: () {
  // final stepData = {
  //   'orientation': selectedOrientation,
  //   'type': selectedType,
  //   // add other form values
  // };

  //     if (isLastStep) {
  //       completeDisplaySetup(stepData);
  //     } else {
  //       saveCurrentStepData(stepData);
  //     }
  //   },
  //   buttonText: isLastStep ? 'Complete Display Setup' : 'Next',
  // ),

  //  Future<void> completeDisplaySetup(Map<String, dynamic> fullDisplayData) async {
  //   try {
  //     // Optional: validate required fields
  //     if (!fullDisplayData.containsKey('name') || fullDisplayData['name'].isEmpty) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text('Please provide all required display information')),
  //       );
  //       return;
  //     }

  //     // Save the complete setup
  //     await FirebaseFirestore.instance.collection('displays').add(fullDisplayData);

  //     // Optionally delete any existing draft if you saved one
  //     // await FirebaseFirestore.instance.collection('display_drafts').doc(draftId).delete();

  //     // Notify user
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Display setup completed successfully')),
  //     );

  //     // Navigate away or reset
  //     Navigator.pop(context);
  //   } catch (e) {
  //     debugPrint('Error completing setup: $e');
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Failed to complete display setup')),
  //     );
  //   }
  // }
}

class Step1Data extends StatefulWidget {
  const Step1Data({super.key});

  @override
  State<Step1Data> createState() => _Step1DataState();
}

class _Step1DataState extends State<Step1Data> {
  late TextEditingController _nameController;
  late TextEditingController _sizeCOntroller;
  late TextEditingController _descriptionCOntroller;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _sizeCOntroller = TextEditingController();
    _descriptionCOntroller = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionCOntroller.dispose();
    _sizeCOntroller.dispose();
    super.dispose();
  }

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
          _tileData('Name', 'Enter Name ', '', _nameController),
          _tileData('Size', 'In Inches', 'Inches', _sizeCOntroller),
          _tileData(
            'Add Description',
            'Description',
            '',
            _descriptionCOntroller,
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
