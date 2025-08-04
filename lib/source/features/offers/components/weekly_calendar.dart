import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class WeeklyCalendar extends StatefulWidget {
  const WeeklyCalendar({super.key, this.onTap});
  final Function()? onTap;

  @override
  State<WeeklyCalendar> createState() => _WeeklyCalendarState();
}

class _WeeklyCalendarState extends State<WeeklyCalendar> {
  final DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  List<DateTime> getCurrentWeekDates(DateTime date) {
    final startOfWeek = date.subtract(Duration(days: date.weekday - 1));
    return List.generate(7, (index) => startOfWeek.add(Duration(days: index)));
  }

  @override
  Widget build(BuildContext context) {
    final weekDates = getCurrentWeekDates(_focusedDay);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TableCalendar(
        //   firstDay: DateTime.utc(2020, 1, 1),
        //   lastDay: DateTime.utc(2030, 12, 31),
        //   focusedDay: DateTime.now(),
        //   headerVisible: true,
        //   headerStyle: HeaderStyle(
        //     titleTextFormatter: (_, __) => '',
        //     formatButtonVisible: false,
        //     titleCentered: true,
        //   ),

        //   calendarFormat: CalendarFormat.week,
        // ),

        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     IconButton(
        //       onPressed: () {
        //         setState(() {
        //           _focusedDay = _focusedDay.subtract(const Duration(days: 7));
        //         });
        //       },
        //       icon: const Icon(Icons.chevron_left),
        //     ),
        //     Text(
        //       'Week of ${DateFormat('MMM dd').format(weekDates.first)} - ${DateFormat('MMM dd').format(weekDates.last)}',
        //       style: const TextStyle(fontWeight: FontWeight.bold),
        //     ),
        //     IconButton(
        //       onPressed: () {
        //         setState(() {
        //           _focusedDay = _focusedDay.add(const Duration(days: 7));
        //         });
        //       },
        //       icon: const Icon(Icons.chevron_right),
        //     ),
        //   ],
        // ),
        SizedBox(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: weekDates.length,
            itemBuilder: (context, index) {
              final date = weekDates[index];
              final isSelected = isSameDay(date, _selectedDay);

              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedDay = date;
                    widget.onTap;
                  });
                },
                child: Container(
                  width: 48,
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? MyColors.textColor2
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected ? Colors.white : Colors.grey,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat('dd').format(date),
                        style: TextStyle(
                          color: isSelected ? Colors.white : MyColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        DateFormat('E').format(date),
                        style: TextStyle(
                          color: isSelected ? Colors.white : MyColors.textColor,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
