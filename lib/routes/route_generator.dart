import 'package:flutter/material.dart';
import 'package:sample_crud/pages/home_page.dart';
import 'package:sample_crud/screens/auth/signIn_page.dart';
import 'package:sample_crud/screens/auth/signUp_page.dart';
import 'package:sample_crud/screens/forgot_password_screen.dart';
import 'package:sample_crud/screens/password_reset_email_send_screen.dart';

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

        case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
        
        case Routes.forgotPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordScreen(),
        );

        case Routes.passwordResetEmailSendAcreen:
        return MaterialPageRoute(
          builder: (_) => const PasswordResetEmailSendScreen(email: ''),
        );
        default:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
    }
  }
}
