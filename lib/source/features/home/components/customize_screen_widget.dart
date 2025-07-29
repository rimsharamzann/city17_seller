import 'package:city17_seller/source/constants/asset_string.dart';
import 'package:city17_seller/source/core/components/custom_container.dart';
import 'package:flutter/material.dart';

class CustomizeScreenWidget extends StatefulWidget {
  const CustomizeScreenWidget({super.key});

  @override
  State<CustomizeScreenWidget> createState() => _CustomizeScreenWidgetState();
}

class _CustomizeScreenWidgetState extends State<CustomizeScreenWidget> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Text(
            'Screen Orientation',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white.withValues(alpha: 0.8),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    clipBehavior: Clip.hardEdge,
                    child: Image.asset(
                      AssetString.orientation,
                      width: 120,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  _radioOption('Horizontal'),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RotatedBox(
                    quarterTurns: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      clipBehavior: Clip.hardEdge,
                      child: Image.asset(
                        AssetString.orientation,
                        width: 60,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  _radioOption('Vertical'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _radioOption(String optionLabel) {
    final isSelected = selectedOption == optionLabel;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = optionLabel;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Row(
          children: [
            Text(
              optionLabel,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey.shade600,
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 6),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Colors.white : Colors.grey.shade600,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? const Center(
                      child: Icon(Icons.check, size: 14, color: Colors.white),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
