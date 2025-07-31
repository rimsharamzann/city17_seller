import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class HotelAddress extends StatelessWidget {
  const HotelAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Display', style: context.textTheme.bodySmall),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Hilton Hotel',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
              Text(
                'Hilton 488 George St, Sydney,',
                style: context.textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
