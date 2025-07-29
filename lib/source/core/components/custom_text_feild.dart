import 'package:city17_seller/source/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
    required this.controller,
    this.maxLines,
    this.hintText,
  });
  final TextEditingController controller;
  final int? maxLines;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: Constants.textFieldInputDecoration(
        hintText: hintText ?? '',
        color: Colors.white60,
        context: context,
      ),
    );
  }
}
