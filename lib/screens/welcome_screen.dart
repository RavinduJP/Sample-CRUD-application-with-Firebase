import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_crud/common/common_widgets/welcome_button.dart';
import 'package:sample_crud/common/custom_scaffold.dart';
import 'package:sample_crud/screens/auth/signIn_page.dart';
import 'package:sample_crud/theme/theme.dart';

import '../utils/constants/app_colors.dart';
import 'auth/signUp_page.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      image: 'assets/images/background1.png',
      child: Column(
        children: [
          Flexible(
            flex: 8,
            child: Container(
              padding:
                 EdgeInsets.symmetric(vertical: 0.sp, horizontal: 40.sp),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Welcome Back!\n',
                        style: TextStyle(
                          fontSize: 45.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                       TextSpan(
                        text:
                            '\nEnter personal details to your notebook account',
                        style: TextStyle(
                          fontSize: 20.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  const Expanded(
                    child: WelcomeButton(
                      buttonText: 'Sign in',
                      color: Colors.transparent,
                      textColor: AppColors.welcomeText,
                      onTap: SignInScreen(),
                    ),
                  ),
                  Expanded(
                    child: WelcomeButton(
                      buttonText: 'Sign up',
                      color: AppColors.onPrimary,
                      textColor: ligthColourSchema.primary,
                      onTap: const SignUpScreen(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
