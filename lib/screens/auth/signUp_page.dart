import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_crud/screens/auth/signIn_page.dart';
import '../../common/common_widgets/custom_text_form_field.dart';
import '../../common/custom_scaffold.dart';
import '../../theme/theme.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formSignupKey = GlobalKey<FormState>();
  bool agreePersonalData = true;

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
                        'Get Started',
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
                        // validateMessage: "Please Enter Full Name",
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
                        // validateMessage: "Please Enter Valid Email",
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
                        // validateMessage: "Please Enter Valid Password",
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
                          // style: const ButtonStyle(
                          //   backgroundColor: WidgetStatePropertyAll(AppColors.secondary)
                          // ),
                          onPressed: () {
                            if (_formSignupKey.currentState!.validate() &&
                                agreePersonalData) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Processing Data'),
                                ),
                              );
                            } else if (!agreePersonalData) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Please agree to the processing of personal data'),
                                ),
                              );
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
