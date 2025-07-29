import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/features/home/components/location_card.dart';
import 'package:city17_seller/source/features/home/models/display_loaction_model.dart';
import 'package:flutter/material.dart';

class BusinessLocations extends StatefulWidget {
  const BusinessLocations({super.key});

  @override
  State<BusinessLocations> createState() => _BusinessLocationsState();
}

class _BusinessLocationsState extends State<BusinessLocations> {
  final List<DisplayLocationModel> displayBusinesses = [
    DisplayLocationModel(
      name: "Hilton Hotel",
      brand: "Hilton",
      address: "488 George St, Sydney NSW 2000",
      category: "Hotel",
      totalDisplays: 13,
      onlineDisplays: 10,
      offlineDisplays: 3,
      draftDisplays: 1,
    ),
    DisplayLocationModel(
      name: "Marriott",
      brand: "Marriott",
      address: "7 Macquarie St, Sydney NSW 2000",
      category: "Hotel",
      totalDisplays: 8,
      onlineDisplays: 6,
      offlineDisplays: 2,
      draftDisplays: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: MyColors.containerBg,
      ),
      child: ListView.builder(
        itemCount: displayBusinesses.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final model = displayBusinesses[index];
          return LocationCard(locationModel: model);
        },
      ),
    );
  }
}
