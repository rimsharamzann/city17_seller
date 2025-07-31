import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class TimeSlotGrid extends StatefulWidget {
  const TimeSlotGrid({super.key});

  @override
  State<TimeSlotGrid> createState() => _TimeSlotGridState();
}

class _TimeSlotGridState extends State<TimeSlotGrid> {
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

  bool isSelectedLabelActive = true;
  bool isUnselectedLabelActive = false;

  @override
  Widget build(BuildContext context) {
    //    final Color activeColor = MyColors.successColor;
    // final Color inactiveBorderColor = Colors.white;
    // final Color unselectedBackground = MyColors.containerBg;

    return GridView.count(
      crossAxisCount: 6,
      mainAxisSpacing: 10,
      crossAxisSpacing: 5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.8,
      children: List.generate(timeSlots.length, (index) {
        final isSelected = selectedIndexes.contains(index);
        return GestureDetector(
          onTap: () {
            setState(() {
              if (isSelected) {
                selectedIndexes.remove(index);
              } else {
                selectedIndexes.add(index);
              }
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? MyColors.successColor : MyColors.darkThemeBG,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  timeSlots[index].split(' ')[0],
                  style: context.textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                    fontSize: 9,
                  ),
                ),
                SizedBox(width: 2),
                Text(
                  timeSlots[index].split(' ')[1],
                  style: context.textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                    fontSize: 9,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
