import 'dart:io';

import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/constants/string_data.dart';
import 'package:city17_seller/source/core/components/buttons.dart';
import 'package:city17_seller/source/core/components/information_text.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ScanQrCode extends StatefulWidget {
  const ScanQrCode({super.key});

  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  File? _pickedImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        _pickedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          DottedBorder(
            borderType: BorderType.RRect,
            color: Colors.grey.shade400,
            strokeWidth: 1.5,
            dashPattern: const [6, 2],
            radius: const Radius.circular(4),
            child: Container(
              height: MediaQuery.of(context).size.height / 3.6,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: _pickedImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        _pickedImage!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    )
                  : SizedBox(),
            ),
          ),
          const SizedBox(height: 40),

          CustomElevatedButtonWidget(
            width: context.width,
            onPressed: _pickImage,
            buttonText: StringData.addDisplayImage,
            color: MyColors.containerBg,
            iconColor: MyColors.primaryColor,
            textColor: MyColors.primaryColor,
            prefix: Icons.camera_alt_outlined,
          ),

          const SizedBox(height: 10),

          InformationText(
            iconSize: 24,
            fontSize: 10,
            icon: Icons.warning_rounded,
            iconColor: MyColors.primaryColor,
            textColor: MyColors.textColor,
            maxLines: 3,
            text: StringData.uploadClearImageOfDisplay,
          ),
        ],
      ),
    );
  }
}
