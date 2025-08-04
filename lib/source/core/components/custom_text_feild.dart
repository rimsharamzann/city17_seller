import 'package:city17_seller/source/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
    required this.controller,
    this.maxLines,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.iconColor,
    this.fillColor,
    this.height,
    this.smallText,
  });
  final TextEditingController controller;
  final int? maxLines;
  final String? hintText;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final Color? iconColor;
  final double? height;
  final Color? fillColor;
  final bool? smallText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 35,
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        cursorColor: Colors.white70,
        cursorHeight: 20,
        decoration: Constants.textFieldInputDecoration(
          hintText: hintText ?? '',
          contentPadding: EdgeInsets.symmetric(horizontal: 6),
          showLabel: true,

          fillColor: fillColor,

          color: Colors.white60,
          context: context,
          smallText: smallText ?? true,
          // prefixIcon: Icon(prefixIcon, color: iconColor),
          suffixIcon: Icon(suffixIcon, color: iconColor),
        ),
      ),
    );
  }
}
