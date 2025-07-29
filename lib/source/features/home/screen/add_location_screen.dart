import 'package:city17_seller/config/route_names.dart';
import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/core/components/buttons.dart';
import 'package:city17_seller/source/core/components/custom_container.dart';
import 'package:city17_seller/source/core/components/information_text.dart';
import 'package:city17_seller/source/core/components/textfeild_with_title.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:city17_seller/source/features/home/components/ad_pricing_widget.dart';
import 'package:city17_seller/source/features/home/components/location_card.dart';
import 'package:flutter/material.dart';

class AddLocationScreen extends StatefulWidget {
  const AddLocationScreen({super.key});

  @override
  State<AddLocationScreen> createState() => _AddLocationScreenState();
}

class _AddLocationScreenState extends State<AddLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Location Setting')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          LocationDataContainer(),
          AdPricingWidget(),
          SizedBox(height: 4),
          Text(
            'Displays',
            style: context.textTheme.bodyLarge?.copyWith(color: Colors.white),
          ),
          SizedBox(height: 8),
          DisplayStatus(),
          SizedBox(height: 8),
          CustomElevatedButtonWidget(
            width: context.width,
            prefix: null,
            buttonText: 'Connect a Display',
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.connectDisplay);
            },
            suffix: Icons.add,
            iconColor: MyColors.primaryColor,
          ),
          SizedBox(height: 12),
          InformationText(
            icon: Icons.info_outline,
            text: 'Shared with potential buyers',
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

class LocationDataContainer extends StatefulWidget {
  const LocationDataContainer({super.key});

  @override
  State<LocationDataContainer> createState() => _LocationDataContainerState();
}

class _LocationDataContainerState extends State<LocationDataContainer> {
  late TextEditingController _nameCOntroller;
  late TextEditingController _addressController;
  late TextEditingController _categoryController;
  @override
  void initState() {
    super.initState();
    _addressController = TextEditingController();
    _nameCOntroller = TextEditingController();
    _categoryController = TextEditingController();
  }

  @override
  void dispose() {
    _nameCOntroller.dispose();
    _addressController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          TextfeildWithTitle(
            fillColor: MyColors.containerColor.withValues(alpha: 0.3),
            controller: _nameCOntroller,
            title: 'Name',
            hintText: 'Enter name',
            suffixIcon: Icons.edit_square,
          ),
          SizedBox(height: 8),
          TextfeildWithTitle(
            fillColor: MyColors.containerColor.withValues(alpha: 0.3),

            controller: _addressController,
            title: 'Address',
            hintText: 'Hilton 488 George St, Sydney NSW 2000',
            suffixIcon: Icons.location_on_sharp,
          ),
          SizedBox(height: 8),
          TextfeildWithTitle(
            fillColor: MyColors.containerColor.withValues(alpha: 0.3),

            controller: _nameCOntroller,
            title: 'Category',
            hintText: 'Restaurent',
            suffixIcon: Icons.arrow_drop_down_rounded,
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
