import 'package:city17_seller/source/constants/asset_string.dart';
import 'package:city17_seller/source/core/components/custom_container.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
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
            style: context.textTheme.bodyMedium?.copyWith(
              color: Colors.white.withValues(alpha: 0.95),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildOption(
                label: 'Horizontal',
                image: Image.asset(
                  AssetString.orientation,
                  width: 120,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              _buildOption(
                label: 'Vertical',
                image: RotatedBox(
                  quarterTurns: 1,
                  child: Image.asset(
                    AssetString.orientation,
                    width: 60,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOption({required String label, required Widget image}) {
    final bool isSelected = selectedOption == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = label;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            clipBehavior: Clip.hardEdge,
            child: image,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: Row(
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.grey.shade600,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? Colors.white : Colors.grey.shade600,
                      width: 2,
                    ),
                  ),
                  child: isSelected
                      ? const Center(
                          child: Icon(
                            Icons.check,
                            size: 12,
                            color: Colors.white,
                          ),
                        )
                      : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
