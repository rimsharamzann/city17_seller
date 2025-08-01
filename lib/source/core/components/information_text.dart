import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class InformationText extends StatelessWidget {
  const InformationText({
    super.key,
    required this.text,
    required this.icon,
    this.iconColor,
    this.textColor,
    this.maxLines,
    this.iconSize,
    this.fontSize, this.fontWeight,
  });
  final String text;
  final IconData icon;
  final Color? iconColor;
  final Color? textColor;
  final int? maxLines;
  final double? iconSize;
  final double? fontSize;
   final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(icon, color: iconColor ?? Colors.white, size: iconSize ?? 20),
        SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            maxLines: maxLines ?? 2,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.bodySmall?.copyWith(
              color: textColor ?? Colors.white, fontWeight:  fontWeight,
              fontSize: fontSize ?? context.textTheme.bodySmall?.fontSize,
            ),
          ),
        ),
      ],
    );
  }
}
