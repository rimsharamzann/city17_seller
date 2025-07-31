import 'package:city17_seller/source/features/offers/components/active_offer_components/active_fixed_components.dart';
import 'package:flutter/material.dart';

class ActiveFixedTab extends StatelessWidget {
  const ActiveFixedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          ...List.generate(2, (index) => ActiveFixedComponents()),
        ],
      ),
    );
  }
}
