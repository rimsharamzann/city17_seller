import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    this.height,
    this.width,
    this.margin,
    this.padding,
    required this.child,
    this.color,
    this.borderRadius,
  });
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Widget child;
  final Color? color;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: margin ?? EdgeInsets.symmetric(vertical: 6),
      padding: padding ?? EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      width: width ?? context.width,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(10),
        color: color ?? MyColors.containerBg,
      ),
      child: child,
    );
  }
}

class SwitchWidget extends StatelessWidget {
  const SwitchWidget({super.key, required this.value, this.onChanged});

  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.diagonal3Values(0.7, 0.7, 1),
      child: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: MyColors.successColor2,
        trackOutlineWidth: WidgetStateProperty.all(2),
        trackOutlineColor: WidgetStateProperty.all(Colors.white),
        trackColor: WidgetStateProperty.all(Colors.transparent),
        inactiveThumbColor: Colors.white,
      ),
    );
  }
}
class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key, required this.isChecked, this.onChange});
  final bool isChecked;
  final ValueChanged<bool?>? onChange;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: widget.isChecked,
      onChanged: widget.onChange,
      side: const BorderSide(color: MyColors.darkThemeBG, width: 1),

      fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return MyColors.successColor2;
        }
        return MyColors.darkThemeBG;
      }),

      checkColor: MyColors.successColor2, 
    );
  }
}
