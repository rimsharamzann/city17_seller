import 'package:city17_seller/source/constants/asset_string.dart';
import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:city17_seller/source/features/home/components/income_graph_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTileWidget extends StatelessWidget {
  const CustomTileWidget({
    super.key,
    required this.title,
    this.child,
    this.icon,
    required this.image,
  });
  final String title;
  final Widget? child;
  final IconData? icon;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      width: context.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: MyColors.containerBg,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            image,
            colorFilter: const ColorFilter.mode(
              Colors.white70,
              BlendMode.srcIn,
            ),
          ),

          SizedBox(width: 10),
          Text(
            title,
            style: context.textTheme.bodyMedium?.copyWith(
              color: Colors.white.withValues(alpha: 0.8),
            ),
          ),
          Spacer(),
          SizedBox(
            child:
                child ??
                Icon(
                  icon ?? Icons.check_circle_outline,
                  color: Colors.white.withValues(alpha: 0.8),
                ),
          ),
        ],
      ),
    );
  }
}

class DisplayTile extends StatelessWidget {
  const DisplayTile({
    super.key,
    this.child,
    this.child1,
    this.text,
    this.tileColor,
  });
  final Widget? child;
  final Widget? child1;
  final String? text;
  final Color? tileColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 55,
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      width: context.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: tileColor ?? MyColors.containerBg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text ?? 'Restaurent Family Hall',
                style: context.textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                ),
              ),
              SizedBox(child: child1),
            ],
          ),
          SizedBox(height: 10),
          SizedBox(
            child:
                child ??
                Row(
                  spacing: 6,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('This week'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          AssetString.timer,
                          colorFilter: const ColorFilter.mode(
                            Colors.white70,
                            BlendMode.srcIn,
                          ),
                        ),
                        SizedBox(width: 6),

                        Text(
                          '99.9%',
                          style: context.textTheme.bodySmall?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 6),

                        Text(
                          '\$35',
                          style: context.textTheme.bodySmall?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 6),

                        BadgeWidget(),
                      ],
                    ),
                  ],
                ),
          ),
        ],
      ),
    );
  }
}

class UserNameAndContact extends StatelessWidget {
  const UserNameAndContact({
    super.key,
    required this.name,
    required this.contactNo,
    this.profilePic,
    this.child,
    this.iconColor,
    this.contactColor,
  });
  final String name;
  final String contactNo;
  final String? profilePic;
  final Widget? child;
  final Color? iconColor;
  final Color? contactColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.all(10),
      width: context.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: MyColors.backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(child: child ?? SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    child: Image.asset(AssetString.profile),
                  ),
                  SizedBox(width: 6),
                  Text(
                    name,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.phone, color: iconColor ?? Colors.white),
                  SizedBox(width: 6),
                  Text(
                    contactNo,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: contactColor ?? MyColors.textColor,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                      decorationColor: contactColor ?? MyColors.textColor,
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
