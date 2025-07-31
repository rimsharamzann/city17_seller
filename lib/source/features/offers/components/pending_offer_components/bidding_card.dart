import 'package:city17_seller/source/core/components/custom_container.dart';
import 'package:city17_seller/source/features/offers/components/pending_offer_components/bidding_info_card.dart';
import 'package:flutter/material.dart';

import '../vertical_linear_progress.dart';

class BiddingCard extends StatelessWidget {
  const BiddingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: 
      List.generate(2, (index)=>  CustomContainer(
          padding: EdgeInsets.all(4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
                child: SizedBox(
                  height: 460,
                  width: 100,
                  child: VerticalLinearProgress(),
                ),
              ),
              Expanded(child: BiddingAdInfoCard()),
            ],
          ),
        ),
       
        ),
      
    );
  }
}
