import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class VerticalLinearProgress extends StatefulWidget {
  const VerticalLinearProgress({super.key, this.height});
  final double? height;

  @override
  State<VerticalLinearProgress> createState() => _VerticalLinearProgressState();
}

class _VerticalLinearProgressState extends State<VerticalLinearProgress> {
  @override
  Widget build(BuildContext context) {
    final double barHeight = widget.height ?? 339;
    final double slotHeight = barHeight / 8;

    final List<Map<String, dynamic>> slots = [
      {'start': 0, 'end': 1, 'color': MyColors.successColor},
      {'start': 1, 'end': 3, 'color': MyColors.containerBg},
      {'start': 3, 'end': 4, 'color': MyColors.successColor},
      {'start': 4, 'end': 5, 'color': MyColors.containerBg},
      {'start': 5, 'end': 6, 'color': MyColors.successColor},
      {'start': 6, 'end': 7, 'color': MyColors.containerBg},
      {'start': 7, 'end': 8, 'color': MyColors.successColor},
    ];

    return Padding(
      padding: EdgeInsets.all(4.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top text
            Container(
              padding: EdgeInsets.only(top: 2),
              width: 85,
              height: 30,
              decoration: BoxDecoration(
                color: MyColors.successColor.withValues(alpha: 0.25),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                '\$14-\$10 /hr',
                style: context.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: MyColors.successColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            Card(
              color: MyColors.darkThemeBG,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              margin: EdgeInsets.fromLTRB(3.5, 0, 3.5, 0),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text(
                      '12:00am',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade400,
                        fontSize: 13,
                      ),
                    ),
                    // SizedBox(height: 2),
                    SizedBox(
                      height: widget.height ?? barHeight,
                      width: 85,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned.fill(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: slots.map((slot) {
                                final double height =
                                    slotHeight * (slot['end'] - slot['start']);
                                return Container(
                                  height: height,
                                  width: 8,
                                  decoration: BoxDecoration(
                                    color: slot['color'],
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),

                          Positioned(
                            top: slotHeight - 10,
                            child: Text('1:00', style: _style(Colors.white)),
                          ),
                          Positioned(
                            top: slotHeight * 3 - 10,
                            child: Text('03:00', style: _style(Colors.white)),
                          ),
                          Positioned(
                            top: slotHeight * 4 - 10,
                            child: Text('04:00', style: _style(Colors.white)),
                          ),
                          Positioned(
                            top: slotHeight * 5 - 10,
                            child: Text('05:00', style: _style(Colors.white)),
                          ),
                          Positioned(
                            top: slotHeight * 6 - 10,
                            child: Text('06:00', style: _style(Colors.white)),
                          ),
                          Positioned(
                            top: slotHeight * 7 - 10,
                            child: Text('07:00', style: _style(Colors.white)),
                          ),
                        ],
                      ),
                    ),
                    Text('08:00am', style: _style(MyColors.textColor)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle? _style(Color? txetColor) {
    return context.textTheme.bodySmall?.copyWith(
      fontWeight: FontWeight.bold,
      color: txetColor ?? Colors.white,
      fontSize: 13,
    );
  }
}
