import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class ActiveTimeSlots extends StatefulWidget {
  const ActiveTimeSlots({
    super.key,
    required this.time,
    this.rate,
    this.title,
    this.color,
  });
  final String time;
  final String? rate;
  final String? title;
  final Color? color;

  @override
  State<ActiveTimeSlots> createState() => _ActiveTimeSlotsState();
}

class _ActiveTimeSlotsState extends State<ActiveTimeSlots> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: MyColors.lightBackground,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            child: Text(
              widget.time,
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
          ),
          Container(
            width: 70,
            alignment: Alignment.center,
            height: 95,
            padding: EdgeInsets.all(10),

            color: widget.color ?? MyColors.successColor.withValues(alpha: 0.8),

            child: widget.rate == null
                ? Text(
                    widget.title ?? '',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontSize: 9,
                    ),
                  )
                : _highestAmount(),
          ),
        ],
      ),
    );
  }

  Widget _highestAmount() {
    return Column(
      children: [
        Text('Highest', style: _style(Colors.white70)),
        SizedBox(height: 10),
        Text(widget.rate ?? '\$14', style: _style(Colors.white)),
      ],
    );
  }

  TextStyle? _style(Color? txetColor) {
    return context.textTheme.bodySmall?.copyWith(
      fontWeight: FontWeight.bold,
      color: txetColor ?? Colors.white,
      fontSize: 11,
    );
  }
}
