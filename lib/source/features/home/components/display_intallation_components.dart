import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/core/components/custom_container.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:city17_seller/source/features/home/enums/display_enum.dart';
import 'package:flutter/material.dart';

class DisplayInstallationComponents extends StatefulWidget {
  const DisplayInstallationComponents({super.key});

  @override
  State<DisplayInstallationComponents> createState() =>
      _DisplayInstallationComponentsState();
}

class _DisplayInstallationComponentsState
    extends State<DisplayInstallationComponents> {
  ScreenType? screenType;
  LocationType? locationType;
  Placement? placement;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          RadioButtonsWithTitle<ScreenType>(
            title: 'Is this screen Fixed or Mobile?',
            options: ScreenType.values,
            getTitle: (type) => type.title,
            onChanged: (value) {
              setState(() {
                screenType = value;
              });
            },
          ),
          RadioButtonsWithTitle<LocationType>(
            title: 'Where is the screen installed?',
            options: LocationType.values,
            getTitle: (type) => type.title,
            onChanged: (value) {
              setState(() {
                locationType = value;
              });
            },
          ),
          RadioButtonsWithTitle<Placement>(
            title: 'Screen Placements',
            options: Placement.values,
            getTitle: (type) => type.title,
            onChanged: (value) {
              setState(() {
                placement = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

class RadioButtonsWithTitle<T> extends StatefulWidget {
  const RadioButtonsWithTitle({
    super.key,
    required this.title,
    required this.options,
    required this.onChanged,
    required this.getTitle,
    this.child,
    this.icon,
  });

  final String title;
  final List<T> options;
  final Function(T) onChanged;
  final String Function(T) getTitle;
  final Widget? child;
  final IconData? icon;

  @override
  State<RadioButtonsWithTitle<T>> createState() =>
      _RadioButtonsWithTitleState<T>();
}

class _RadioButtonsWithTitleState<T> extends State<RadioButtonsWithTitle<T>> {
  T? selectedOption;

  @override
  Widget build(BuildContext context) {
    List<Row> buildRows(List<T> options, int itemsPerRow) {
      List<Row> rows = [];
      for (int i = 0; i < options.length; i += itemsPerRow) {
        rows.add(
          Row(
            children: List.generate(itemsPerRow, (j) {
              if (i + j >= options.length) return const SizedBox();
              T option = options[i + j];
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
                        widget.getTitle(option),
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : Colors.grey.shade600,
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
                                  size: 12,
                                  color: Colors.white,
                                ),
                              )
                            : null,
                      ),
                      const SizedBox(width: 16),
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
    //TODO: fix  null error 

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                widget.title,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.white.withAlpha(240),
                ),
              ),
            ),
            if (widget.icon != null)
              Icon(widget.icon, color: Colors.white, size: 18)
            else
              Text(''),
          ],
        ),
        const SizedBox(height: 4),
        if (widget.child != null) widget.child!,
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
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
