import 'package:city17_seller/source/constants/asset_string.dart';
import 'package:city17_seller/source/constants/constants.dart';
import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  const CustomElevatedButtonWidget({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.color = MyColors.containerBg,
    this.textColor = MyColors.primaryColor,
    this.height = 45,
    this.width,
    this.active = true,
    this.isLoading = false,
    this.borderRadius = 8,
    this.prefix = AssetString.addIcon,
    this.suffix,
    this.iconColor,
    this.tooltip,
    this.prefixIcon,
  });

  final Function()? onPressed;
  final String buttonText;
  final Color color;
  final Color textColor;
  final double height;
  final double? width;
  final bool active;
  final bool isLoading;
  final Color? iconColor;
  final IconData? prefixIcon;
  final double borderRadius;

  final IconData? suffix;
  final dynamic prefix;
  final String? tooltip;
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      richMessage: TextSpan(children: [TextSpan(text: tooltip)]),
      child: SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            disabledBackgroundColor: Colors.grey.withValues(alpha: 0.15),
          ),
          onPressed: active && !isLoading ? onPressed : null,
          child: isLoading
              ? const CupertinoActivityIndicator()
              : _mainWidget(context.textTheme),
        ),
      ),
    );
  }

  Widget _mainWidget(TextTheme textTheme) {
    if (prefix == null && suffix == null) return _text(textTheme);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (prefix != null) ...[
          if (prefix is IconData)
            Icon(prefix, color: iconColor ?? Colors.white),
          if (prefix is String) SvgPicture.asset(prefix),
          const SizedBox(width: myPadding / 2),
        ],
        _text(textTheme),
        if (suffix != null) ...[
          const SizedBox(width: myPadding / 2),
          Icon(suffix, color: iconColor ?? Colors.white),
        ],
      ],
    );
  }

  Text _text(TextTheme textTheme) {
    return Text(
      buttonText,
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: textTheme.titleSmall?.copyWith(
        fontWeight: FontWeight.w500,
        color: active ? textColor : Colors.grey,
        fontSize: textTheme.bodyMedium?.fontSize,
      ),
    );
  }
}
