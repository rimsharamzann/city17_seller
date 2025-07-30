import 'package:city17_seller/source/constants/asset_string.dart';
import 'package:city17_seller/source/core/components/buttons.dart';
import 'package:city17_seller/source/core/components/custom_container.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationDetails extends StatelessWidget {
  const NotificationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NotificationCard(
          title: 'New Advert Pending',
          description:
              'A \$10/hr ad from XYZ Co. is pending your approval on the Hilton screen',
          time: '2 hours',
          buttonText: 'View ads',
          iconColor: Colors.transparent,
          image: AssetString.adOutined,
        ),
      ],
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.title,
    required this.description,
    this.icon,
    this.image,
    required this.time,
    required this.buttonText,
    this.iconColor,
  });
  final String title;
  final String description;
  final IconData? icon;
  final String? image;
  final String time;
  final String buttonText;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // icon
          if (image == null)
            Icon(icon, size: 28, color: iconColor)
          else
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SvgPicture.asset(
                image ?? AssetString.paymentOption,
                // colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
              ),
            ),

          //rest data
          Expanded(
            child: Column(
              children: [
                //title & time badge
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    CustomContainer(child: Text(time)),
                  ],
                ),
                // detail
                Text(description, style: context.textTheme.bodySmall),

                // button
                Align( alignment: Alignment.bottomRight,
                  child: CustomElevatedButtonWidget(
                    onPressed: () {},
                    buttonText: buttonText,
                    prefix: null,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
