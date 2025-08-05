import 'package:city17_seller/config/route_names.dart';
import 'package:city17_seller/source/constants/asset_string.dart';
import 'package:city17_seller/source/constants/my_colors.dart';
import 'package:city17_seller/source/constants/string_data.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class CustomLayoutScreen extends StatefulWidget {
  final Widget body;
  const CustomLayoutScreen({super.key, required this.body});

  @override
  State<CustomLayoutScreen> createState() => _CustomLayoutScreenState();
}

class _CustomLayoutScreenState extends State<CustomLayoutScreen> {
  final List<String> _routes = [
    RouteNames.home,
    RouteNames.offers,
    RouteNames.finance,
    RouteNames.settings,
  ];

  // late int _currentIndex;
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   final current = ModalRoute.of(context)?.settings.name ?? _routes.first;
  //   _currentIndex = _routes.indexOf(current).clamp(0, _routes.length - 1);
  // }

  // void _onTap(int index) {
  //   if (index == _currentIndex) return;
  //   Navigator.pushNamed(context, _routes[index]);
  // }

  @override
  @override
  Widget build(BuildContext context) {
    final currentRouteName = ModalRoute.of(context)?.settings.name;
    var currentIndex = _routes.indexOf(currentRouteName ?? RouteNames.home);
    if (currentIndex == -1) {
      currentIndex = 0;
    }

    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.backgroundColor,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(AssetString.profile),
              radius: 18,
            ),
            const SizedBox(width: 8),
            Text(
              StringData.hiEllie,
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, RouteNames.notifications),
            child: const Icon(Icons.notifications, color: Colors.white),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: widget.body,
      ),
      bottomNavigationBar: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            final targetRoute = _routes[index];
            if (targetRoute != currentRouteName) {
              Navigator.pushReplacementNamed(
                context,
                targetRoute,
              ); // 👈 use replacement
            }
          },
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            decoration: null,
          ),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          backgroundColor: MyColors.darkThemeBottomAppBarColor,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: List.generate(_routes.length, (index) {
            final isSelected = currentIndex == index;
            final label = [
              StringData.home,
              StringData.offers,
              StringData.finance,
              StringData.settings,
            ][index];

            return BottomNavigationBarItem(
              icon: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Colors.white.withValues(alpha: 0.1)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    label,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: isSelected ? Colors.white : Colors.white70,
                    ),
                  ),
                ),
              ),
              label: '',
            );
          }),
        ),
      ),
    );
  }
}
