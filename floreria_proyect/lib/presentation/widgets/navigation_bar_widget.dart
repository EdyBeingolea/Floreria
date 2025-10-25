import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<NavigationItem> items;
  final Color? backgroundColor;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final bool showLabels;

  const CustomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
    this.backgroundColor,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.showLabels = true,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: backgroundColor ?? Colors.white,
      selectedItemColor: selectedItemColor ?? Colors.blue.shade700,
      unselectedItemColor: unselectedItemColor ?? Colors.grey.shade400,
      showUnselectedLabels: showLabels,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
      items: items
          .map(
            (item) => BottomNavigationBarItem(
              icon: Icon(item.icon),
              label: item.label,
              activeIcon: Icon(
                item.activeIcon ?? item.icon,
                color: selectedItemColor ?? Colors.blue.shade700,
              ),
            ),
          )
          .toList(),
    );
  }
}

class NavigationItem {
  final IconData icon;
  final String label;
  final IconData? activeIcon;

  NavigationItem({required this.icon, required this.label, this.activeIcon});
}
