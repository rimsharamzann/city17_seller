import 'package:city17_seller/source/constants/asset_string.dart';
import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/constants/string_data.dart';
import 'package:city17_seller/source/core/components/buttons.dart';
import 'package:city17_seller/source/core/components/custom_container.dart';
import 'package:city17_seller/source/core/components/custom_tile_widget.dart';
import 'package:city17_seller/source/core/components/information_text.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ApprovePaymentModal extends StatefulWidget {
  const ApprovePaymentModal({
    super.key,
    this.title,
    this.child,
    this.paymentDate,
    this.child2,
  });
  final String? title;
  final Widget? child;
  final String? paymentDate;
  final Widget? child2;

  @override
  State<ApprovePaymentModal> createState() => _ApprovePaymentModalState();
}

class _ApprovePaymentModalState extends State<ApprovePaymentModal> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Align(
              alignment: Alignment.topRight,
              // ignore: deprecated_member_use
              child: SvgPicture.asset(
                AssetString.cancel,
                // ignore: deprecated_member_use
                color: Colors.white,
                height: 16,
              ),
            ),
          ),
          SizedBox(height: 4),
          Text(
            textAlign: TextAlign.center,
            widget.title ?? 'Confirm Payment from Buyer',
            style: context.textTheme.bodyMedium?.copyWith(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Campaign Name',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 6),
              UserNameAndContact(
                contactNo: '+61123449202',
                contactColor: Colors.white.withValues(alpha: 0.85),
                iconColor: MyColors.textColor,
                name: 'Ally Sul',
                profilePic: null,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text('Buyer'),
                ),
              ),
              SizedBox(child: widget.child),
              Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _data('\$150 USD '),
                  _data('Weekly'),
                  _data('Bank Account'),
                ],
              ),
              SizedBox(height: 6),
              CampaignImage(),
              SizedBox(height: 6),

              Align(
                alignment: Alignment.bottomRight,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: widget.paymentDate ?? 'Paid on: ',
                        style: context.textTheme.bodySmall?.copyWith(
                          fontSize: 9,
                        ),
                      ),
                      TextSpan(text: ' '),
                      TextSpan(
                        text: 'Apr 02, 2025 - 01:15 PM',
                        style: context.textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Align(
                alignment: Alignment.center,
                child:
                    widget.child2 ??
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              checkColor: MyColors.textColor,
                              overlayColor: WidgetStateProperty.all(
                                Colors.transparent,
                              ),
                              side: BorderSide(color: Colors.white70),

                              value: isChecked,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  isChecked = newValue ?? false;
                                });
                              },
                              fillColor: WidgetStateProperty.all(
                                Colors.transparent,
                              ),

                              activeColor: MyColors.textColor,
                            ),
                            Text(
                              maxLines: 2,
                              StringData.iHaveRecievedFullPayment,
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 6),

                        InformationText(
                          fontSize: 8,
                          text:
                              'Approval is final and cannot be undone. Please ensure you have received the payment from the buyer before Approving.',
                          icon: Icons.warning_rounded,
                          iconColor: MyColors.primaryColor,
                          textColor: MyColors.textColor,
                          iconSize: 22,
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 35,
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomElevatedButtonWidget(
                                  onPressed: () {},
                                  buttonText: 'Reject',
                                  prefix: null,
                                  suffix: Icons.cancel_outlined,
                                  iconColor: Colors.red,
                                  textColor: Colors.red,
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: CustomElevatedButtonWidget(
                                  onPressed: () {},
                                  buttonText: 'Confirm',
                                  suffix: Icons.check_circle_outline_outlined,
                                  prefix: null,
                                  color: Colors.transparent,

                                  iconColor: Colors.green,
                                  textColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _data(String value) {
    return CustomContainer(
      // height: 55,
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      width: context.width / 3.6,

      color: MyColors.lightBackground,
      child: Text(
        textAlign: TextAlign.center,
        value,
        style: context.textTheme.bodySmall?.copyWith(color: Colors.white),
      ),
    );
  }
}

class CampaignImage extends StatelessWidget {
  const CampaignImage({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      color: Colors.grey.shade700,
      strokeWidth: 1,
      dashPattern: const [9, 3],
      radius: const Radius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              'Note added by the buyer about the payment will be shown here.',
              style: context.textTheme.bodySmall,
            ),
            SizedBox(height: 16),
            Container(
              height: context.height / 3.3,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white70),
              child: ClipRRect(borderRadius: BorderRadius.circular(10)),
            ),
          ],
        ),
      ),
    );
  }
}
