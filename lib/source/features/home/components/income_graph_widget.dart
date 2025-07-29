import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:city17_seller/source/features/home/components/income_forcast_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class IncomeGraphScreen extends StatelessWidget {
  const IncomeGraphScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IncomeForecastWidget(
      height: context.height / 2.8,
      child1: IncomeForcastValue(),

      child: _incomeGraph(),
    );
  }

  Widget _incomeGraph() {
    return SizedBox(
      height: 180,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 6,
          minY: 0,
          maxY: 100,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            horizontalInterval: 25,
            verticalInterval: 1,
            getDrawingHorizontalLine: (value) {
              return FlLine(color: Colors.white12, strokeWidth: 1);
            },
            getDrawingVerticalLine: (value) {
              return FlLine(color: Colors.white12, strokeWidth: 1);
            },
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.fromBorderSide(
              BorderSide(color: Colors.white12, width: 1),
            ),
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: 25,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toInt().toString(),
                    style: const TextStyle(color: Colors.white54, fontSize: 11),
                  );
                },
              ),
            ),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  const titles = [
                    'Mon',
                    'Tue',
                    'Wed',
                    'Thu',
                    'Fri',
                    'Sat',
                    'Sun',
                  ];
                  final index = value.toInt();
                  if (index < 0 || index >= titles.length) {
                    return const SizedBox();
                  }
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      titles[index],
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              isCurved: false,
              color: Colors.lightGreenAccent,
              barWidth: 2,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) {
                  return FlDotCirclePainter(
                    radius: 3,
                    color: Colors.lightGreenAccent,
                    strokeColor: Colors.transparent,
                  );
                },
              ),
              spots: const [
                FlSpot(0, 30),
                FlSpot(1, 75),
                FlSpot(2, 70),
                FlSpot(3, 85),
                FlSpot(4, 100),
                FlSpot(5, 60),
                FlSpot(6, 50),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class IncomeForcastValue extends StatelessWidget {
  const IncomeForcastValue({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '\$400',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'AUD',
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
            ],
          ),
          SizedBox(width: 6),
          BadgeWidget(),
        ],
      ),
    );
  }
}

class BadgeWidget extends StatelessWidget {
  const BadgeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: MyColors.successColor2.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Row(
        children: [
          Text(
            '7.01%',
            style: TextStyle(color: MyColors.successColor2, fontSize: 10),
          ),
          Icon(Icons.upload_sharp, color: MyColors.successColor2, size: 14),
        ],
      ),
    );
  }
}
