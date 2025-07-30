import 'package:city17_seller/source/constants/asset_string.dart';
import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/features/settings/components/all_notifications.dart';
import 'package:flutter/material.dart';

class AdvertTab extends StatelessWidget {
  const AdvertTab({super.key});

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
      ],
    );
  }
}

class ScreenTab extends StatelessWidget {
  const ScreenTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
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
      ],
    );
  }
}

class PaymentTab extends StatelessWidget {
  const PaymentTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        NotificationCard(
          title: 'Payment Request',
          description:
              'Jimmie Wilson just confirm a payment of \$150 for display ‘Hilton Hotel’.',
          time: '2h ago',
          buttonText: 'Review Payment',
          image: AssetString.paymentRounded,
        ),
      ],
    );
  }
}

class EarningTab extends StatelessWidget {
  const EarningTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
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
