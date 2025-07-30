import 'package:city17_seller/source/constants/asset_string.dart';
import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/core/components/buttons.dart';
import 'package:city17_seller/source/core/components/custom_container.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AllNotifications extends StatelessWidget {
  const AllNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        NotificationCard(
          title: 'New Advert Pending',
          description:
              'A \$10/hr ad from XYZ Co. is pending your approval on the Hilton screen',
          time: '2h ago',
          buttonText: 'View ads',
          iconColor: Colors.transparent,
          image: AssetString.adOutined,
        ),
        // screen Sttaus alert setting
        NotificationCard(
          title: 'Screen Status Alerts',
          description:
              'Warning: Display ‘Samsung-3’ is offline. Ads may not play',
          time: '2h ago',
          buttonText: 'Check Status',
          iconColor: MyColors.primaryColor,
          image: null,
          icon: Icons.warning_rounded,
        ),
        // new display connection
        NotificationCard(
          title: 'New Display Connected',
          description:
              'Display ‘Samsung-4’ was successfully added to your account.',
          time: '2h ago',
          buttonText: 'Confirm',
          image: AssetString.displayScreen,
        ),
        NotificationCard(
          title: 'Display Disconnected',
          description: 'Warning: Display ‘Samsung-2’ was disconnected.',
          time: '2h ago',
          buttonText: 'Confirm',
          iconColor: MyColors.primaryColor,
          image: AssetString.displayScreen,
        ),
        NotificationCard(
          title: 'Payment Request',
          description:
              'Jimmie Wilson just confirm a payment of \$150 for display ‘Hilton Hotel’.',
          time: '2h ago',
          buttonText: 'Review Payment',
          image: AssetString.paymentRounded,
        ),
        NotificationCard(
          title: 'Auto-Approval Trigger',
          description:
              '3 ads were auto-approved today from Hilton Hotels Group.',
          time: '2h ago',
          buttonText: 'View Ad',
          iconColor: MyColors.successColor2,
          icon: Icons.check_box,
        ),
        NotificationCard(
          title: 'Ad Slot Sold',
          description:
              'Your 5–6PM slot on Friday was booked at \$12/hr by XYZ Corp.”',
          time: '2h ago',
          buttonText: 'View Setting',
          iconColor: MyColors.successColor2,
          // image: AssetString.,
          icon: Icons.check_box,
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
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // icon
          if (image == null)
            Icon(icon, size: 32, color: iconColor)
          else
            SvgPicture.asset(
              image ?? AssetString.paymentOption,
              colorFilter: iconColor != null
                  ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                  : null,
            ),
          SizedBox(width: 10),
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
                    Container(
                      padding: EdgeInsets.all(4),
                      height: 28,
                      width: 80,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: MyColors.lightBackground,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        time,
                        style: context.textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                // detail
                Text(description, style: context.textTheme.bodySmall),
                SizedBox(height: 10),

                // button
                Align(
                  alignment: Alignment.bottomRight,
                  child: CustomElevatedButtonWidget(
                    onPressed: () {},
                    buttonText: buttonText,
                    prefix: null,
                    color: MyColors.darkThemeBG,
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
