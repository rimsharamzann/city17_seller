import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/constants/string_data.dart';
import 'package:city17_seller/source/core/components/custom_container.dart';
import 'package:city17_seller/source/core/components/custom_tile_widget.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class BuyerContactInfo extends StatelessWidget {
  const BuyerContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserNameAndContact(
            name: 'jammieWilson',
            contactNo: '',
            widget: SizedBox(),
          ),
          SizedBox(height: 10),
          ContactTile(
            title: StringData.phoneNumber,
            icon: Icons.phone,
            text: '+61235615652',
          ),
          SizedBox(height: 10),

          ContactTile(
            title: 'Business till Date',
            icon: Icons.attach_money_sharp,
            text: '\$10000',
          ),
        ],
      ),
    );
  }
}

class ContactTile extends StatelessWidget {
  const ContactTile({
    super.key,
    required this.text,
    required this.icon,
    this.child,
    required this.title,
  });
  final String text;
  final IconData icon;
  final Widget? child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        SizedBox(height: 6),

        CustomContainer(
          padding: EdgeInsets.all(8),
          color: MyColors.darkThemeBG.withValues(alpha: 0.7),
          child: Row(
            children: [
              child ?? Icon(icon, size: 24, color: Colors.white),
              SizedBox(width: 10),
              Text(
                text,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
