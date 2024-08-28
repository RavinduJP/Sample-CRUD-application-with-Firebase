import 'package:flutter/material.dart';
import 'package:sample_crud/pages/home_page.dart';
import 'package:sample_crud/screens/auth/signIn_page.dart';
import 'package:sample_crud/screens/auth/signUp_page.dart';

import '../utils/constants/routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );

        case Routes.signInScreen:
        return MaterialPageRoute(
          builder: (_) => const SignInScreen(),
        );

        case Routes.homePage:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );

        default:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
    }
  }
}
