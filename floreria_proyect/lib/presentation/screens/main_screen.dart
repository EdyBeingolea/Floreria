import 'package:floreria_proyect/presentation/screens/buys/buys_screen.dart';
import 'package:floreria_proyect/presentation/screens/catalog/catalog_screen.dart';
import 'package:floreria_proyect/presentation/screens/home/home_screean.dart';
import 'package:floreria_proyect/presentation/screens/users/user_Screen.dart';
import 'package:floreria_proyect/presentation/widgets/navigation_bar_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreean(),
    const CatalogScreen(),
    const BuysScreen(),
    const UserScreen(),
  ];

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavItemTapped,
        items: [
          NavigationItem(
            icon: Icons.home_outlined,
            activeIcon: Icons.home,
            label: 'Inicio',
          ),
          NavigationItem(
            icon: Icons.storefront_outlined,
            activeIcon: Icons.storefront,
            label: 'Catálogo',
          ),
          NavigationItem(
            icon: Icons.shopping_bag_outlined,
            activeIcon: Icons.shopping_bag,
            label: 'Compras',
          ),
          NavigationItem(
            icon: Icons.person_outline_rounded,
            activeIcon: Icons.person_rounded,
            label: 'Usuario',
          ),
        ],
        selectedItemColor: Colors.blue.shade700,
        unselectedItemColor: Colors.grey.shade400,
      ),
    );
  }
}
