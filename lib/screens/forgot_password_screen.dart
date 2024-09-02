import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_crud/common/custom_scaffold.dart';

import '../common/common_widgets/custom_text_form_field.dart';
import '../theme/theme.dart';
import '../utils/constants/routes.dart';
import 'password_reset_email_send_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  String email = "";
  final _emailController = TextEditingController();

  final _forgotPasswordKey = GlobalKey<FormState>();
  bool rememberPassword = false;

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      // Navigator.of(context).pushNamed(Routes.passwordResetEmailSendAcreen);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        "Password reset email has been sent !",
        style: TextStyle(fontSize: 20.sp),
      )));
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "No user found for that email.",
          style: TextStyle(fontSize: 20.sp),
        )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      image: 'assets/images/background1.png',
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 10.h,
            ),
          ),
          Expanded(
            flex: 20,
            child: Container(
              padding: EdgeInsets.fromLTRB(25.sp, 40.sp, 25.sp, 20.sp),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  topRight: Radius.circular(40.r),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _forgotPasswordKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Reset Password',
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w900,
                          color: ligthColourSchema.primary,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Don't worry sometimes people can forgot too. enter your email and we will send you a password reset link.",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w300,
                          color: ligthColourSchema.primary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      // ignore: prefer_const_constructors
                      CustomTextFormField(
                        validateMessage: "Email is required",
                        lableText: "email",
                        hintText: "Enter email",
                        icon: Icons.mail,
                        isObsecureText: false,
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_forgotPasswordKey.currentState!.validate()) {
                              setState(() {
                                email = _emailController.text;
                              });
                              await resetPassword();
                              // Navigator.of(context).pushNamed(
                              //     Routes.passwordResetEmailSendAcreen);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PasswordResetEmailSendScreen(
                                          email: email),
                                ),
                              );

                            }
                          },
                          child: const Text('Send email'),
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account? ',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(Routes.signUpScreen);
                            },
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ligthColourSchema.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
