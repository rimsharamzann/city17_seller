import 'package:city17_seller/source/constants/constants.dart';
import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/constants/string_data.dart';
import 'package:city17_seller/source/core/components/custom_container.dart';
import 'package:city17_seller/source/core/components/custom_text_feild.dart';
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
        Text(title, style: context.textTheme.bodyMedium),
        const SizedBox(height: 10),
        TextField(
          cursorColor: Colors.white,
          cursorHeight: 20,
          style: TextStyle(color: Colors.white),
          controller: controller,
          maxLines: maxLines ?? 1,
          decoration: Constants.textFieldInputDecoration(
            fillColor: fillColor ?? MyColors.containerBg,
            hintText: hintText,
            color: color ?? Colors.white,
            context: context,
            smallText: true,
            suffixIcon: suffixIcon != null
                ? Icon(suffixIcon, color: Colors.white, size: iconSize ?? 20)
                : null,
          ),
        ),
      ],
    );
  }
}

class CustomSearchWidget extends StatefulWidget {
  const CustomSearchWidget({
    super.key,
    required this.title,
    required this.controller,
  });
  final String title;
  final TextEditingController controller;

  @override
  State<CustomSearchWidget> createState() => _CustomSearchWidgetState();
}

class _CustomSearchWidgetState extends State<CustomSearchWidget> {
  List<String> searchResults = [];

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_handleSearch);
  }

  void _handleSearch() {
    final query = widget.controller.text.trim().toLowerCase();

    if (query.isEmpty) {
      setState(() {
        searchResults = [];
      });
    } else {
      // actual data list
      final allItems = ['Hilton Hotel', 'Marriott', 'Holiday Inn'];
      final filtered = allItems
          .where((item) => item.toLowerCase().contains(query))
          .toList();

      setState(() {
        searchResults = filtered;
      });
    }
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFeild(
          controller: widget.controller,
          hintText: StringData.searchBusinessCategory,
          suffixIcon: Icons.search,
          iconColor: Colors.white,
        ),
        const SizedBox(height: 6),

        if (searchResults.isNotEmpty)
          CustomContainer(
            color: MyColors.lightBackground,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: searchResults.map((result) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                    result,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}
