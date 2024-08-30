import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_crud/common/custom_scaffold.dart';
import 'package:sample_crud/pages/home_page.dart';

import '../../common/common_widgets/custom_text_form_field.dart';
import '../../theme/theme.dart';
import '../../utils/constants/routes.dart';
import 'signUp_page.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String email = "", password = "";
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formSignInKey = GlobalKey<FormState>();
  bool rememberPassword = false;

  userLogin() async {
    if (password != null &&
        _emailController.text != "" &&
        _passwordController.text != "") {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red.shade700,
              content: const Text(
                "No User Found for that Email",
                style: TextStyle(fontSize: 15.0),
              )));
        } else if (e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red.shade700,
              content: const Text(
                "Wrong Password Provided by User",
                style: TextStyle(fontSize: 15.0),
              )));
        }
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
                  key: _formSignInKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w900,
                          color: ligthColourSchema.primary,
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      // ignore: prefer_const_constructors
                      CustomTextFormField(
                        validateMessage: "Enterw Valid e-mail",
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
                      CustomTextFormField(
                        validateMessage: "Enter Valid Password",
                        lableText: "Password",
                        hintText: "Enter Password",
                        icon: Icons.lock,
                        isObsecureText: true,
                        controller: _passwordController,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: rememberPassword,
                                onChanged: (bool? value) {
                                  setState(() {
                                    rememberPassword = value!;
                                  });
                                },
                                activeColor: ligthColourSchema.primary,
                              ),
                              const Text(
                                'Remember me',
                                style: TextStyle(
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            child: Text(
                              'Forget password?',
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
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formSignInKey.currentState!.validate() ||
                                rememberPassword) {
                              setState(() {
                                email = _emailController.text;
                                password = _passwordController.text;
                              });
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     const SnackBar(
                              //       content: Text('Processing Data'),
                              //     ),
                              //   );
                              // } else if (!rememberPassword) {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     const SnackBar(
                              //       content: Text(
                              //           'Please agree to the processing of personal data'),
                              //     ),
                              //   );
                              await userLogin();
                            }
                          },
                          child: const Text('Sign In'),
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 0.sp,
                              horizontal: 10.sp,
                            ),
                            child: const Text(
                              'Sign up with',
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 35.h,
                            width: 35.h,
                            child: Image.asset('assets/logos/facebook.png',
                                fit: BoxFit.cover),
                          ),
                          SizedBox(
                            height: 35.h,
                            width: 35.h,
                            child: Image.asset('assets/logos/google.png',
                                fit: BoxFit.cover),
                          )
                        ],
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (e) => const SignUpScreen(),
                                ),
                              );
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
