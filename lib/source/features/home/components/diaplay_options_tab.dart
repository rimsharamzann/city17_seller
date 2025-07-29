import 'package:city17_seller/source/constants/asset_string.dart';
import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/constants/string_data.dart';
import 'package:city17_seller/source/core/components/buttons.dart';
import 'package:city17_seller/source/core/components/custom_container.dart';
import 'package:city17_seller/source/core/components/custom_tile_widget.dart';
import 'package:city17_seller/source/core/components/information_text.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class DisplayOptionsTab extends StatefulWidget {
  const DisplayOptionsTab({super.key});

  @override
  State<DisplayOptionsTab> createState() => _DisplayOptionsTabState();
}

class _DisplayOptionsTabState extends State<DisplayOptionsTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // rotate phone
            DisplayTile(
              text: StringData.rotateTheDisplay,
              child1: SvgPicture.asset(
                AssetString.cameraAlt,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
              child: InformationText(
                text: StringData.horizontal,
                icon: Icons.info_outlined,
                textColor: Colors.grey,
                iconColor: Colors.grey,
              ),
            ),
            //play my own ads
            SizedBox(height: 10),
            CustomContainer(
              child: Column(
                children: [
                  Text(
                    StringData.whatToShowWhenNoAds,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 14),
                  DisplayTile(
                    tileColor: MyColors.backgroundColor,
                    text: StringData.playMyOwnAds,
                    child1: SwitchWidget(value: true, onChanged: (value) {}),
                    child: SizedBox(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            // Hours Grid
            SpecificHoursData(),
            SizedBox(height: 10),

            Text(
              'Add Personal Ads Videos or Images',
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            _viewAdd(AssetString.addView), SizedBox(height: 10),
            _viewAdd(AssetString.adImage),
            SizedBox(height: 20),
            CustomElevatedButtonWidget(
              width: context.width,
              height: 50,
              onPressed: () {},
              buttonText: StringData.addImageOrVedio,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _viewAdd(String image) {
    return CustomContainer(
      child: Stack(
        children: [
          Image.asset(image, fit: BoxFit.cover),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              // color: MyColors.primaryColor,
              AssetString.moreHorizon,
              // colorFilter: const ColorFilter.mode(
              //   Colors.transparent,
              //   BlendMode.srcIn,
              // ),
            ),
          ),
        ],
      ),
    );
  }
}

class SpecificHoursData extends StatefulWidget {
  const SpecificHoursData({super.key});

  @override
  State<SpecificHoursData> createState() => _SpecificHoursDataState();
}

class _SpecificHoursDataState extends State<SpecificHoursData> {
  final List<String> hoursList = [
    '12:00 am',
    '1:00 am',
    '2:00 am',
    '3:00 am',
    '4:00 am',
    '5:00 am',
    '6:00 am',
    '7:00 am',
    '8:00 am',
    '9:00 am',
    '10:00 am',
    '11:00 am',
    '12:00 pm',
    '1:00 pm',
    '2:00 pm',
    '3:00 pm',
    '4:00 pm',
    '5:00 pm',
  ];

  final bool isSingleSelection = false;

  Set<String> selectedHours = {'4:00 am'};
  void toggleSelection(String time) {
    setState(() {
      if (isSingleSelection) {
        selectedHours = {time};
      } else {
        if (selectedHours.contains(time)) {
          selectedHours.remove(time);
        } else {
          selectedHours.add(time);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Block specific hours to only show my own ads',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              SwitchWidget(value: true, onChanged: (value) {}),
            ],
          ),
          const SizedBox(height: 14),
          InformationText(
            iconColor: MyColors.textColor,
            textColor: MyColors.textColor,
            text:
                'These hours will not be available for purchase. Your own ads will be played automatically',
            icon: Icons.info_outline_rounded,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _selectedHours(true, 'Selected'),
              const SizedBox(width: 20),
              _selectedHours(false, 'Unselected'),
            ],
          ),
          _hoursGrid(),
        ],
      ),
    );
  }

  Widget _selectedHours(bool value, String title) {
    return Row(
      children: [
        CustomCheckBox(isChecked: value),
        const SizedBox(width: 6),
        Text(
          title,
          style: context.textTheme.bodyMedium?.copyWith(color: Colors.white),
        ),
      ],
    );
  }

  Widget _hoursGrid() {
    return ResponsiveGridList(
      horizontalGridSpacing: 5,
      verticalGridSpacing: 4,
      rowMainAxisAlignment: MainAxisAlignment.start,
      minItemWidth: 75,
      minItemsPerRow: 4,
      maxItemsPerRow: 6,
      listViewBuilderOptions: ListViewBuilderOptions(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
      ),
      children: hoursList.map((time) => _timer(time)).toList(),
    );
  }

  Widget _timer(String time) {
    final bool isSelected = selectedHours.contains(time);
    return GestureDetector(
      onTap: () => toggleSelection(time),
      child: CustomContainer(
        padding: const EdgeInsets.all(4),
        borderRadius: BorderRadius.circular(4),
        margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 14),
        color: isSelected ? MyColors.successColor2 : MyColors.darkThemeBG,
        child: Text(
          time,
          style: context.textTheme.bodySmall?.copyWith(
            color: isSelected ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
