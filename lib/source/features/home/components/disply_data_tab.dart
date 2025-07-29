import 'package:city17_seller/source/constants/asset_string.dart';
import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/core/components/buttons.dart';
import 'package:city17_seller/source/core/components/custom_container.dart';
import 'package:city17_seller/source/core/components/information_text.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class DisplayDataTab extends StatelessWidget {
  const DisplayDataTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
         DisplayDataInfo(), Expanded(child: SizedBox()),
        ],
      ),
    );
  }

 

}

 class DisplayDataInfo extends StatefulWidget {
  const DisplayDataInfo({super.key});

  @override
  State<DisplayDataInfo> createState() => _DisplayDataInfoState();
}

class _DisplayDataInfoState extends State<DisplayDataInfo> {
  @override
  Widget build(BuildContext context) {
    return   CustomContainer(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _dataWidget('Brand', 'TCL', context),
                SizedBox(height: 10),
                _dataWidget('Model', 'Android TV', context),
                SizedBox(height: 10),
                _dataWidget('Resolution', '1920x1080', context),
                SizedBox(height: 14),
                CustomElevatedButtonWidget(
                  width: context.width,
                  color: MyColors.backgroundColor,
                  onPressed: () {},
                  buttonText: 'Scan QR Code',
                  textColor: Colors.white,
                  prefix: AssetString.qrcode,
                  iconColor: Colors.white,
                ),
              ],
            ),
          )
        ;
  }
    Widget _dataWidget(String title, String value, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(
          value,
          style: context.textTheme.bodyMedium?.copyWith(color: Colors.white),
        ),
      ],
    );
  }

}

class ScanQR extends StatefulWidget {
  const ScanQR({super.key});

  @override
  State<ScanQR> createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              DottedBorder(
                borderType: BorderType.RRect,
                color: Colors.grey.shade400,
                stackFit: StackFit.loose,
                strokeWidth: 1.5,
                dashPattern: const [9, 3],
                strokeCap: StrokeCap.butt,
                radius: const Radius.circular(16),
                child: Container(
                  height: context.height / 3.6,
                  width: context.width,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 30),
              CustomElevatedButtonWidget(
                width: context.width,
                onPressed: () {},
                buttonText: 'Add Display Image',
                color: MyColors.containerBg,
                iconColor: MyColors.primaryColor,
                textColor: MyColors.primaryColor,
                prefix: Icons.camera_alt_outlined,
              ),
              const SizedBox(height: 10),

              InformationText(
                iconSize: 24,
                fontSize: 12,
                icon: Icons.warning_rounded,
                iconColor: MyColors.primaryColor,
                textColor: MyColors.textColor,
                maxLines: 3,
                text:
                    'Upload a clear image of your display to help buyers better understand its visibility and real-world placement.',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
