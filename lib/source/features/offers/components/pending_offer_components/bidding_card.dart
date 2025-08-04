import 'package:city17_seller/source/core/components/custom_container.dart';
import 'package:city17_seller/source/features/offers/components/pending_offer_components/bidding_info_card.dart';
import 'package:flutter/material.dart';

import '../vertical_linear_progress.dart';

class BiddingCard extends StatelessWidget {
  const BiddingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        2,
        (index) => CustomContainer(
          padding: EdgeInsets.all(4),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ConstrainedBox(
                constraints: BoxConstraints(maxWidth: constraints.maxWidth),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 60, child: TimeLineWidget()),

                    Flexible(fit: FlexFit.loose, child: BiddingAdInfoCard()),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
