import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_crud/common/custom_scaffold.dart';
import 'package:sample_crud/theme/theme.dart';

import '../utils/constants/routes.dart';

class PasswordResetEmailSendScreen extends StatelessWidget {
  final String email;
  const PasswordResetEmailSendScreen({super.key, required this.email});

  // Future<String?> _getUserEmail() async {
  //   try {
  //     DocumentSnapshot userDoc = await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(userId)
  //         .get();
  //     return userDoc['email'] as String?;
  //   } catch (e) {
  //     print('Error fetching user email: $e');
  //     return null;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // // fetch the current user
    // User? user = FirebaseAuth.instance.currentUser;

    // // Get the user's email
    // String? email = user?.email;

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
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Password Reset Email Sent',
                      style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w900,
                        color: ligthColourSchema.primary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      email,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "Your Account Security is our priority! We've set you a \nsecure link to safty change your password and keep \nyour account protected.",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w300,
                        color: ligthColourSchema.primary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(Routes.signInScreen);
                        },
                        child: const Text('Done'),
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    GestureDetector(
                      child: const Text(
                        'Resend Email ',
                        style: TextStyle(
                          color: Colors.black45,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(Routes.forgotPasswordScreen);
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
