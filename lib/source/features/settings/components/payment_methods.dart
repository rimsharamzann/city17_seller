import 'package:city17_seller/source/constants/asset_string.dart';
import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/constants/string_data.dart';
import 'package:city17_seller/source/core/components/custom_container.dart';
import 'package:city17_seller/source/core/components/custom_text_feild.dart';
import 'package:city17_seller/source/core/components/information_text.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ListView(
        children: [
          // cash
          PaymentCard(
            image: AssetString.cash,
            title: StringData.cash,
            child: SwitchWidget(value: true, onChanged: (value) {}),
          ),
          SizedBox(height: 12),

          // bank
          BankData(),
          SizedBox(height: 12),

          // paymnet options
          PaymentOptions(),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class PaymentOptions extends StatefulWidget {
  const PaymentOptions({super.key});

  @override
  State<PaymentOptions> createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  late TextEditingController _accountTitleController;
  late TextEditingController _instructionCOntroller;
  late TextEditingController _linkCOntroller;
  @override
  void initState() {
    super.initState();
    _accountTitleController = TextEditingController();
    _linkCOntroller = TextEditingController();
    _instructionCOntroller = TextEditingController();
  }

  @override
  void dispose() {
    _accountTitleController.dispose();
    _linkCOntroller.dispose();
    _instructionCOntroller.dispose();
    super.dispose();
  }

  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return PaymentCard(
      image: AssetString.bank,
      title: StringData.bank,
      child2: Column(
        children: [
          InformationText(
            maxLines: 3,
            fontSize: 12,
            text:
                'Add a custom payment option to your profile.This will allow your clients to pay using this custom payment option.',
            icon: Icons.info_outline,
          ),
          // todo decoration of expension tile
          SizedBox(height: 10),
          CustomContainer(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.all(0),
            child: ExpansionTile(
              backgroundColor: Colors.transparent,
              iconColor: Colors.white,
              textColor: Colors.white, 
              title: Text(
                'Add Custom Payment Option',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
              onExpansionChanged: (value) {
                setState(() {
                  isExpanded = value;
                });
              },
              children: [
                CustomTextFeild(
                  controller: _accountTitleController,
                  hintText: 'Bank Name',
                ),
                SizedBox(height: 12),
                CustomTextFeild(
                  controller: _linkCOntroller,
                  hintText: 'Account Name',
                ),

                SizedBox(height: 12),
                CustomTextFeild(
                  controller: _instructionCOntroller,
                  hintText: 'Account Number',
                ),
                SizedBox(height: 12),
              ],
            ),
          ),
        ],
      ),
      child: SwitchWidget(value: true, onChanged: (value) {}),
    );
  }
}

class BankData extends StatefulWidget {
  const BankData({super.key});

  @override
  State<BankData> createState() => _BankDataState();
}

class _BankDataState extends State<BankData> {
  late TextEditingController _bankNameController;
  late TextEditingController _accountNumberController;
  late TextEditingController _accountNameController;
  late TextEditingController _routingNumberController;
  @override
  void initState() {
    super.initState();
    _bankNameController = TextEditingController();
    _accountNameController = TextEditingController();
    _accountNumberController = TextEditingController();
    _routingNumberController = TextEditingController();
  }

  @override
  void dispose() {
    _bankNameController.dispose();
    _accountNameController.dispose();
    _accountNumberController.dispose();
    _routingNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PaymentCard(
      image: AssetString.bank,
      title: StringData.bank,
      child2: Column(
        children: [
          CustomTextFeild(
            controller: _bankNameController,
            hintText: 'Bank Name',
          ),
          SizedBox(height: 12),
          CustomTextFeild(
            controller: _accountNameController,
            hintText: 'Account Name',
          ),
          SizedBox(height: 12),
          CustomTextFeild(
            controller: _routingNumberController,
            hintText: 'ROuting Number',
          ),
          SizedBox(height: 12),
          CustomTextFeild(
            controller: _accountNumberController,
            hintText: 'Account Number',
          ),
          SizedBox(height: 12),
        ],
      ),
      child: SwitchWidget(value: true, onChanged: (value) {}),
    );
  }
}

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    super.key,
    required this.title,
    required this.child,
    this.icon,
    required this.image,
    this.child2,
  });
  final String title;
  final Widget child;
  final IconData? icon;
  final String image;
  final Widget? child2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      width: context.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: MyColors.containerBg,
      ),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                image,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),

              SizedBox(width: 10),
              Text(
                title,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
              Spacer(),
              SizedBox(child: child),
            ],
          ),

          SizedBox(height: 6),
          SizedBox(child: child2),
        ],
      ),
    );
  }
}
