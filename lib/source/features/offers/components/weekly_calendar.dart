import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:flutter/material.dart';

class WeeklyCalendar extends StatefulWidget {
  const WeeklyCalendar({super.key});

  @override
  State<WeeklyCalendar> createState() => _WeeklyCalendarState();
}

class _WeeklyCalendarState extends State<WeeklyCalendar> {
  int selectedIndex = 0;

  final List<Map<String, String>> tabs = [
    {'title': 'All', 'subtitle': 'This Week'},
    {'title': '01', 'subtitle': 'Mon'},
    {'title': '02', 'subtitle': 'Tue'},
    {'title': '03', 'subtitle': 'Wed'},
    //{'title': '04', 'subtitle': 'Thurs'},
    {'title': '05', 'subtitle': 'Fri'},
    {'title': '06', 'subtitle': 'Sat'},
    {'title': '07', 'subtitle': 'Sun'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(tabs.length, (index) {
          final isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () => setState(() => selectedIndex = index),
            child: Container(
              width: index == 0 ? 65 : 38,
              margin: EdgeInsets.only(
                left: index == 0 ? 0 : 3,
                right: index == tabs.length - 1 ? 0 : 3,
              ),
              padding: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: isSelected ? MyColors.textColor2 : Colors.transparent,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: isSelected ? Colors.white : Colors.grey,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tabs[index]['title']!,
                    style: TextStyle(
                      color: isSelected ? Colors.white : MyColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    tabs[index]['subtitle']!,
                    style: TextStyle(
                      color: isSelected ? Colors.white : MyColors.textColor,
                      fontSize: 9,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
