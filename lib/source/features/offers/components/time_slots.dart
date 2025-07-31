import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/core/components/custom_container.dart';
import 'package:city17_seller/source/core/components/time_slot_grid.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class TimeSlotSelector extends StatefulWidget {
  const TimeSlotSelector({super.key});

  @override
  State<TimeSlotSelector> createState() => _TimeSlotSelectorState();
}

class _TimeSlotSelectorState extends State<TimeSlotSelector> {
  final List<String> timeSlots = [
    '01:02 am',
    '02:03 am',
    '03:04 am',
    '05:06 am',
    '06:07 am',
    '07:08 am',
    '08:09 am',
    '09:10 am',
    '10:11 am',
    '11:12 pm',
    '12:01 pm',
    '01:02 pm',
    '02:03 pm',
    '03:04 pm',
    '04:05 pm',
    '05:06 pm',
    '06:07 pm',
    '07:08 pm',
    '08:09 pm',
    '09:10 pm',
    '10:11 pm',
    '11:12 am',
  ];

  final Set<int> selectedIndexes = {10, 14, 21};

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.containerBg,
      padding: const EdgeInsets.fromLTRB(10, 2, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _selectedHours(true, 'Selected'),
              const SizedBox(width: 20),
              _selectedHours(false, 'Unselected'),
            ],
          ),

          const SizedBox(height: 5),
          TimeSlotGrid(),
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
}
