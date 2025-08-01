import 'package:city17_seller/source/constants/constants.dart';
import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class TextfeildWithTitle extends StatelessWidget {
  const TextfeildWithTitle({
    super.key,
    required this.controller,
    required this.title,
    required this.hintText,
    this.maxLines,
    this.color,
    this.suffixIcon,
    this.fillColor,
    this.titleColor,
    this.iconSize,
  });

  final TextEditingController controller;
  final String title;
  final String hintText;
  final Color? fillColor;
  final int? maxLines;
  final Color? color;
  final double? iconSize;
  final Color? titleColor;

  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.bodyMedium?.copyWith(
            // color: titleColor ?? context.textTheme.titleMedium?.color,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: Constants.textFieldInputDecoration(
            fillColor: fillColor ?? MyColors.containerBg,
            hintText: hintText,
            color: color ?? Colors.white,
            context: context,
            smallText: true ,

            suffixIcon: Icon(
              suffixIcon,
              color: Colors.white,
              size: iconSize ?? 20,
            ),
          ),
        ),
      ],
    );
  }
}
