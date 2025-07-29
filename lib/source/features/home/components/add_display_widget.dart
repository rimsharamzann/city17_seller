import 'package:city17_seller/config/route_names.dart';
import 'package:city17_seller/source/constants/asset_string.dart';
import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/constants/string_data.dart';
import 'package:city17_seller/source/core/components/custom_text_feild.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddDisplayWidget extends StatefulWidget {
  const AddDisplayWidget({super.key});

  @override
  State<AddDisplayWidget> createState() => _AddDisplayWidgetState();
}

class _AddDisplayWidgetState extends State<AddDisplayWidget> {
  late TextEditingController _businessNameController;
  late TextEditingController _categoryController;

  late TextEditingController _businessAddressController;
  @override
  void initState() {
    super.initState();

    _businessNameController = TextEditingController();
    _businessAddressController = TextEditingController();
    _categoryController = TextEditingController();
  }

  @override
  void dispose() {
    _businessNameController.dispose();
    _businessAddressController.dispose();
    _categoryController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _addBusinessLocation(
          context,
          _businessNameController,
          _businessAddressController,
          _categoryController,
        );
      },
      child: Container(
        height: 55,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        width: context.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: MyColors.containerBg,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              StringData.addDisplayLocation,
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.white.withValues(alpha: 0.8),
              ),
            ),
            const SizedBox(width: 10),
            SvgPicture.asset(
              AssetString.addIcon,
              height: 22,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _addBusinessLocation(
  BuildContext context,
  final TextEditingController businessNameController,
  final TextEditingController businessAddressController,
  final TextEditingController categoryController,
) async {
  await showModalBottomSheet(
    context: context,

    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return SizedBox(
        height: context.height / 1.8,
        child: DraggableScrollableSheet(
          expand: false,

          initialChildSize: 0.6,
          maxChildSize: 0.9,
          minChildSize: 0.4,
          builder: (_, controller) => Container(
            decoration: const BoxDecoration(
              color: Color(0xFF1E1E2C),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: SingleChildScrollView(
              controller: controller,
              padding: EdgeInsets.all(16),
              child: Column(
                spacing: 10,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(),

                  Text(
                    StringData.addBusinessLocation,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(),
                  CustomTextFeild(
                    controller: businessNameController,
                    hintText: StringData.addBusinessName,
                  ),

                  CustomTextFeild(
                    controller: businessAddressController,
                    hintText: StringData.addBusinessAddress,
                  ),

                  CustomTextFeild(
                    controller: categoryController,
                    hintText: StringData.selectBusinessCategory,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RouteNames.displayLocation,
                        );
                        // Navigator.pop(context);
                      },
                      child: Text(
                        StringData.add,
                        style: TextStyle(
                          color: MyColors.primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
