import 'package:flutter/material.dart';

class TimeSlot {
  final String time;
  final bool isActive;

  TimeSlot({required this.time, required this.isActive});
}

class TimeLineWidget extends StatefulWidget {
  const TimeLineWidget({super.key});

  @override
  State<TimeLineWidget> createState() => _TimeLineWidgetState();
}

class _TimeLineWidgetState extends State<TimeLineWidget> {
  final List<TimeSlot> slots = [
    TimeSlot(time: '12:00am', isActive: true),
    TimeSlot(time: '01:00am', isActive: false),
    TimeSlot(time: '02:00am', isActive: false),
    TimeSlot(time: '03:00am', isActive: true),
    TimeSlot(time: '04:00am', isActive: false),
    TimeSlot(time: '05:00am', isActive: false),
    TimeSlot(time: '06:00am', isActive: true),
    TimeSlot(time: '07:00am', isActive: false),
    TimeSlot(time: '08:00am', isActive: false),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Stack(
          children: [
            Column(
              children: slots.map((slot) {
                return Container(
                  width: 4,
                  height: 40,
                  margin: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: slot.isActive ? Colors.green : Colors.grey[800],
                    borderRadius: BorderRadius.circular(2),
                  ),
                );
              }).toList(),
            ),

            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: slots.map((slot) {
                  return Container(
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(
                      slot.time,
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
