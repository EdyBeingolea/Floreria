import 'package:floreria_proyect/presentation/screens/buys/buys_screen.dart';
import 'package:floreria_proyect/presentation/screens/catalog/catalog_screen.dart';
import 'package:floreria_proyect/presentation/screens/home/home_screean.dart';
import 'package:floreria_proyect/presentation/screens/login/login_screens.dart';
import 'package:floreria_proyect/presentation/screens/login/register_screens.dart';
import 'package:floreria_proyect/presentation/screens/main_screen.dart';
import 'package:floreria_proyect/presentation/screens/users/user_Screen.dart';
import 'package:flutter/material.dart';

typedef RegisterScreens = RegisterLoginScreens;

class AppRoutes {
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String catalog = '/catalog';
  static const String buys = '/buys';
  static const String main = '/main';
  static const String users = '/users';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreens());
      case register:
        return MaterialPageRoute(builder: (_) => const RegisterLoginScreens());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreean());
      case catalog:
        return MaterialPageRoute(builder: (_) => const CatalogScreen());
      case buys:
        return MaterialPageRoute(builder: (_) => const BuysScreen());
      case main:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case users:
        return MaterialPageRoute(builder: (_) => const UserScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
