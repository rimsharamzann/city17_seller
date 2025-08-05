import 'package:city17_seller/config/route_names.dart';
import 'package:city17_seller/source/constants/asset_string.dart';
import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/constants/string_data.dart';
import 'package:city17_seller/source/core/components/custom_container.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:city17_seller/source/features/finance/components/payment_date.dart';
import 'package:city17_seller/source/features/offers/components/hotel_address.dart';
import 'package:flutter/material.dart';

class AdvertPaymentScreen extends StatefulWidget {
  const AdvertPaymentScreen({super.key});

  @override
  State<AdvertPaymentScreen> createState() => _AdvertPaymentScreenState();
}

class _AdvertPaymentScreenState extends State<AdvertPaymentScreen> {
  final List<String> _routes = [
    RouteNames.home,
    RouteNames.offers,
    RouteNames.finance,
    RouteNames.settings,
  ];

  late int _currentIndex;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final current = ModalRoute.of(context)?.settings.name ?? _routes.first;
    _currentIndex = _routes.indexOf(current).clamp(0, _routes.length - 1);
  }

  void _onTap(int index) {
    if (index == _currentIndex) return;
    Navigator.pushNamed(context, _routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringData.advertPayment,
          style: context.textTheme.bodyLarge?.copyWith(color: Colors.white),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(14),
        children: [
          _advertizerData(),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Campaign Name',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: MyColors.successColor2.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'Running',
                  style: TextStyle(color: MyColors.successColor2, fontSize: 12),
                ),
              ),
            ],
          ),

          SizedBox(height: 10),
          PaymentDetailsGrid(),
          SizedBox(height: 10),
          HotelAddress(),
          SizedBox(height: 10),
          PaymentDetaiils(title: StringData.paymentOverdue, color: Colors.red),
          SizedBox(height: 10),
          PaymentDetaiils(title: StringData.upcomingPayment),
        ],
      ),
      bottomNavigationBar: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTap,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            decoration: null,
          ),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          backgroundColor: MyColors.darkThemeBottomAppBarColor,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: List.generate(_routes.length, (index) {
            final isSelected = _currentIndex == index;
            final label = [
              StringData.home,
              StringData.offers,
              StringData.finance,
              StringData.settings,
            ][index];

            return BottomNavigationBarItem(
              icon: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Colors.white.withValues(alpha: 0.1)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    label,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: isSelected ? Colors.white : Colors.white70,
                    ),
                  ),
                ),
              ),
              label: '',
            );
          }),
        ),
      ),
    );
  }

  Widget _advertizerData() {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(StringData.advertizer),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 12,
                    child: Image.asset(AssetString.profile),
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Jamie oliver',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Icon(Icons.phone, color: Colors.white),
                  SizedBox(width: 6),
                  Text(
                    '+6198765432',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: MyColors.textColor,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                      decorationColor: MyColors.textColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PaymentDetailsGrid extends StatelessWidget {
  const PaymentDetailsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.8,
      children: const [
        PaymentCard(title: 'Offer', value: 'bid rate'),
        PaymentCard(title: 'hours/day', value: '5 hours'),
        PaymentCard(title: 'Bid per Hour', value: '2345'),
        PaymentCard(title: 'Paymemnt cycle ', value: 'weekly'),
        PaymentCard(title: 'Upcoming due', value: '03 Apr 2025'),
        PaymentCard(title: 'Schedule', value: '01 Apr - 01May '),
      ],
    );
  }
}

class PaymentCard extends StatelessWidget {
  final String title;
  final String value;

  const PaymentCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomContainer(
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 6),
        color: MyColors.lightBackground,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: context.textTheme.bodySmall?.copyWith(
                fontSize: 8,
                color: MyColors.textColor,
              ),
            ),
            SizedBox(height: 4),
            Text(
              value,
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentDetaiils extends StatelessWidget {
  const PaymentDetaiils({super.key, required this.title, this.color});
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        CustomContainer(
          child: Column(
            children: [
              PaymentData(dataColor: color ?? MyColors.primaryColor),
              SizedBox(height: 6),

              TotalAmount(amount: '\$1050'),
            ],
          ),
        ),
      ],
    );
  }
}

class PaymentData extends StatefulWidget {
  const PaymentData({super.key, this.dataColor});
  final Color? dataColor;

  @override
  State<PaymentData> createState() => _PaymentDataState();
}

class _PaymentDataState extends State<PaymentData> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      color: MyColors.lightBackground,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _campaignTile(
            'Due date',
            '19-04-05',
            widget.dataColor ?? MyColors.primaryColor,
          ),
          _campaignTile('Payment', 'Weekly', null),
          SizedBox(width: 6),
          _campaignTile('Detail', '35 hours @ \$15', null),
        ],
      ),
    );
  }

  Widget _campaignTile(String title, String data, Color? dataCOlor) {
    return Column(
      children: [
        Text(title, style: context.textTheme.bodySmall?.copyWith(fontSize: 7)),
        SizedBox(height: 4),
        Text(
          data,
          style: context.textTheme.bodyMedium?.copyWith(
            color: dataCOlor ?? Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
