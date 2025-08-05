import 'package:city17_seller/source/constants/asset_string.dart';
import 'package:city17_seller/source/constants/constants.dart';
import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/constants/string_data.dart';
import 'package:city17_seller/source/core/components/textfeild_with_title.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_number_input_v2/intl_phone_number_input.dart';

class ProfileOptions extends StatefulWidget {
  const ProfileOptions({super.key});

  @override
  State<ProfileOptions> createState() => _ProfileOptionsState();
}

class _ProfileOptionsState extends State<ProfileOptions> {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  String? phoneNumber;
  PhoneNumber number = PhoneNumber(isoCode: 'US');

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            ProfileImageWidget(),
            SizedBox(height: 14),
            TextfeildWithTitle(
              titleColor: MyColors.textColor,
              controller: _nameController,
              title: StringData.name,
              color: Colors.white,
              hintText: 'Name',
            ),
            SizedBox(height: 10),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringData.phoneNumber,
                  style: context.textTheme.bodyMedium,
                ),
                const SizedBox(height: 6),
                IntlPhoneField(
                  controller: _phoneController,
                  initialCountryCode: 'US',
                  dropdownIcon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  cursorColor: Colors.white,
                  dropdownIconPosition: IconPosition.trailing,
                  keyboardType: TextInputType.number,
                  showCountryFlag: false,
                  invalidNumberMessage: '',
                  style: TextStyle(color: Colors.white),
                  decoration: Constants.textFieldInputDecoration(
                    context: context,
                    hintText: '123449202',

                    color: Colors.white,
                    fillColor: MyColors.containerBg,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),
            TextfeildWithTitle(
              color: Colors.white,
              titleColor: MyColors.textColor,
              controller: _emailController,
              title: StringData.email,
              hintText: 'yourgmail@gmail.com',
            ),
            SizedBox(height: 20),

            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  'Logout',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: 180,
      child: Stack(
        children: [
          Container(
            height: 180,
            width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(width: 4, color: MyColors.lightBackground),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AssetString.userIcon),
              ),
            ),
            // child: Image.asset(AssetString.profile, fit: BoxFit.cover),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: CircleAvatar(
              backgroundColor: MyColors.containerBg,
              radius: 26,
              child: Icon(Icons.add_a_photo_rounded, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
