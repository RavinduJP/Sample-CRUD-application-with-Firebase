import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_crud/screens/auth/signIn_page.dart';
import 'package:sample_crud/services/auth.dart';
import 'package:sample_crud/utils/constants/app_colors.dart';
import '../../common/common_widgets/custom_text_form_field.dart';
import '../../common/custom_scaffold.dart';
import '../../theme/theme.dart';
import '../../utils/constants/routes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String name = '', email = '', password = '';

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formSignupKey = GlobalKey<FormState>();
  bool agreePersonalData = false;

  registration() async {
    if (password != null &&
        _nameController.text != "" &&
        _emailController.text != "" &&
        _passwordController.text != "") {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
            
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: AppColors.secondary,
            content: Text(
              "Registered Successfully",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        );
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushNamed(Routes.signInScreen);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red.shade700,
              content: const Text(
                "Password Provided is too Weak",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          );
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red.shade700,
              content: const Text(
                "Account Already exists",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          );
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
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                // get started form
                child: Form(
                  key: _formSignupKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // get started text
                      Text(
                        'Create Account',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: ligthColourSchema.primary,
                        ),
                      ),
                      SizedBox(
                        height: 40.sp,
                      ),
                      CustomTextFormField(
                        validateMessage: "Please Enter Full Name",
                        lableText: "Name",
                        hintText: "Enter Full Name",
                        keyboardType: TextInputType.name,
                        icon: Icons.person,
                        isObsecureText: false,
                        controller: _nameController,
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      CustomTextFormField(
                        validateMessage: "Please Enter Valid Email",
                        lableText: "Email",
                        hintText: "Enter e-mail",
                        keyboardType: TextInputType.emailAddress,
                        icon: Icons.mail,
                        isObsecureText: false,
                        controller: _emailController,
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      CustomTextFormField(
                        validateMessage: "Please Enter Valid Password",
                        lableText: "Password",
                        hintText: "Enter password",
                        icon: Icons.lock,
                        isObsecureText: true,
                        controller: _passwordController,
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: agreePersonalData,
                            onChanged: (bool? value) {
                              setState(() {
                                agreePersonalData = value!;
                              });
                            },
                            activeColor: ligthColourSchema.primary,
                          ),
                          const Text(
                            'I agree to the processing of ',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          Text(
                            'Personal data',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ligthColourSchema.primary,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      // signup button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formSignupKey.currentState!.validate() ||
                                agreePersonalData) {
                              setState(() {
                                name = _nameController.text;
                                email = _emailController.text;
                                password = _passwordController.text;
                              });
                              await registration();
                            }
                          },
                          child: const Text('Sign up'),
                        ),
                      ),
                      SizedBox(
                        height: 30.sp,
                      ),
                      // sign up divider
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 10,
                            ),
                            child: Text(
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
                      SizedBox(
                        height: 30.h,
                      ),
                      // sign up social media logo
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            child: SizedBox(
                              height: 35.h,
                              width: 35.h,
                              child: Image.asset('assets/logos/facebook.png',
                                  fit: BoxFit.cover),
                            ),
                            onTap: () {},
                          ),
                          GestureDetector(
                            child: SizedBox(
                              height: 35.h,
                              width: 35.h,
                              child: Image.asset('assets/logos/google.png',
                                  fit: BoxFit.cover),
                            ),
                            onTap: () async {
                              AuthMethods().signInWithGoogle(context);
                              // AuthMethods().signInWithGoogle(context);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      // already have an account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account? ',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (e) => const SignInScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Sign in',
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
