import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/core/components/custom_container.dart';
import 'package:flutter/material.dart';

class DisplayInstallationComponents extends StatefulWidget {
  const DisplayInstallationComponents({super.key});

  @override
  State<DisplayInstallationComponents> createState() =>
      _DisplayInstallationComponentsState();
}

class _DisplayInstallationComponentsState
    extends State<DisplayInstallationComponents> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          RadioButtonsWithTitle(
            title: 'Is this screen Fixed or Mobile?',
            onChanged: (value) {
              setState(() {
                _isSelected = !_isSelected;
              });
            },
            options: ['Mobile', 'Fixed'],
          ),
          RadioButtonsWithTitle(
            title: 'Where is the screen installed?',
            onChanged: (value) {
              setState(() {
                _isSelected = !_isSelected;
              });
            },
            options: ['Shop', 'Restaurent', 'vehicle', 'other'],
          ),
          RadioButtonsWithTitle(
            title: 'Screen Placements',
            onChanged: (value) {
              setState(() {
                _isSelected = !_isSelected;
              });
            },
            options: ['Facing Outside', 'Inside The Property'],
          ),
        ],
      ),
    );
  }
}

class RadioButtonsWithTitle extends StatefulWidget {
  const RadioButtonsWithTitle({
    super.key,
    required this.title,
    required this.options,
    required this.onChanged,
    this.child,
  });

  final String title;
  final List<String> options;
  final Function(String) onChanged;
  final Widget? child;

  @override
  State<RadioButtonsWithTitle> createState() => _RadioButtonsWithTitleState();
}

class _RadioButtonsWithTitleState extends State<RadioButtonsWithTitle> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    List<Row> buildRows(List<String> options, int itemsPerRow) {
      List<Row> rows = [];
      for (int i = 0; i < options.length; i += itemsPerRow) {
        rows.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(itemsPerRow, (j) {
              if (i + j >= options.length) return const SizedBox();
              String option = options[i + j];
              final isSelected = selectedOption == option;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedOption = option;
                  });
                  widget.onChanged(option);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 4,
                  ),
                  child: Row(
                    children: [
                      Text(
                        option,
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : Colors.grey.shade600,
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
                            color: isSelected
                                ? Colors.white
                                : Colors.grey.shade600,
                            width: 2,
                          ),
                        ),
                        child: isSelected
                            ? const Center(
                                child: Icon(
                                  Icons.check,
                                  size: 14,
                                  color: Colors.white,
                                ),
                              )
                            : null,
                      ),
                      SizedBox(width: 16),
                    ],
                  ),
                ),
              );
            }),
          ),
        );
      }
      return rows;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white.withValues(alpha: 0.95),
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(child: widget.child),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: MyColors.backgroundColor,
          ),
          child: Column(children: buildRows(widget.options, 3)),
        ),
      ],
    );
  }
}
